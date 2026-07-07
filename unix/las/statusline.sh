#!/usr/bin/env bash
# LAS 근태 세그먼트 (starship claude-code statusline용)
# usage: statusline.sh status          -> 상태 세그먼트 (아이콘 + 라벨)
#        statusline.sh time            -> 시간 세그먼트 (아이콘 + 누적 근무시간)
#        statusline.sh when <group>    -> group(working|rest|off|time)에 해당하면 exit 0
set -u

# base_url·token은 repo 밖 로컬 설정에서만 읽는다 (사내 도메인/시크릿을 repo에 넣지 않기 위함)
CONFIG_FILE="$HOME/.config/las/config.json"
CACHE_DIR="$HOME/.cache/las"
CACHE_FILE="$CACHE_DIR/daily.json"
TTL=60

refresh() {
  [ -r "$CONFIG_FILE" ] || return 1
  if [ -f "$CACHE_FILE" ]; then
    local now mtime
    now=$(date +%s)
    mtime=$(stat -f %m "$CACHE_FILE" 2>/dev/null || stat -c %Y "$CACHE_FILE" 2>/dev/null) || mtime=0
    [ $((now - mtime)) -le "$TTL" ] && return 0
  fi
  local base_url token
  base_url=$(jq -r '.base_url // empty' "$CONFIG_FILE" 2>/dev/null)
  token=$(jq -r '.token // empty' "$CONFIG_FILE" 2>/dev/null)
  [ -n "$base_url" ] && [ -n "$token" ] || return 1
  # 근무일 경계가 05:00 KST이므로 5시간 전 시각의 날짜를 조회일로 사용
  local date_kst body
  date_kst=$(TZ=Asia/Seoul date -v-5H +%F 2>/dev/null || TZ=Asia/Seoul date -d '5 hours ago' +%F)
  body=$(curl -sf -m 3 -H "Authorization: $token" \
    "$base_url/api/attendance/daily?date=$date_kst" 2>/dev/null)
  mkdir -p "$CACHE_DIR"
  if [ -n "$body" ] && jq -e '.workStats.currentStatus' <<<"$body" >/dev/null 2>&1; then
    printf '%s' "$body" >"$CACHE_FILE.tmp" && mv "$CACHE_FILE.tmp" "$CACHE_FILE"
  else
    # 요청 실패 시 stale 캐시를 유지하고 TTL 동안 재시도를 억제
    touch "$CACHE_FILE"
  fi
}

refresh
[ -s "$CACHE_FILE" ] || exit 1
status=$(jq -r '.workStats.currentStatus // empty' "$CACHE_FILE" 2>/dev/null)
[ -n "$status" ] || exit 1

case "${1:-status}" in
  when)
    case "${2:-}" in
      working) [ "$status" = WORKING ] ;;
      rest) [ "$status" = BREAK ] || [ "$status" = MEAL ] ;;
      off) [ "$status" = LEAVING ] || [ "$status" = VACATION ] ;;
      time) [ "$status" != VACATION ] ;; # 휴가일 땐 시간 세그먼트 숨김
      *) false ;;
    esac
    ;;
  status)
    # 아이콘은 nerd font 글리프의 UTF-8 바이트 (에디터에서 안 보여도 정상)
    case "$status" in
      WORKING) printf '\xef\x82\xb1 근무' ;;  # U+F0B1 nf-fa-briefcase
      BREAK) printf '\xef\x83\xb4 휴식' ;;    # U+F0F4 nf-fa-coffee
      MEAL) printf '\xef\x83\xb5 식사' ;;     # U+F0F5 nf-fa-cutlery
      LEAVING) printf '\xef\x82\x8b 퇴근' ;;  # U+F08B nf-fa-sign_out
      VACATION) printf '\xef\x81\xb2 휴가' ;; # U+F072 nf-fa-plane
    esac
    ;;
  time)
    work=$(jq -r '.workStats.totalWorkTime // empty' "$CACHE_FILE")
    # U+F017 nf-fa-clock_o + "8시간 05분" -> "8:05"
    printf '\xef\x80\x97 %s' "$(sed -E 's/([0-9]+)시간 ([0-9]+)분/\1:\2/' <<<"$work")"
    ;;
esac
