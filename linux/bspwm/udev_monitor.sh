#!/bin/bash
function set-props {
  # Elan Touchpad
  xinput set-prop 'Elan Touchpad' 'libinput Tapping Enabled' 1
  xinput set-prop 'Elan Touchpad' 'libinput Natural Scrolling Enabled' 1

  # Elan TrackPoint
  xinput set-prop       'Elan TrackPoint' 'libinput Accel Speed' -0.1
  xinput set-prop       'Elan TrackPoint' 'libinput Natural Scrolling Enabled' 1
  xinput set-button-map 'Elan TrackPoint' 1 0 3

  # Magic Trackpad 2
  xinput set-prop 'Apple Inc. Magic Trackpad 2' 'libinput Natural Scrolling Enabled' 1
  xinput set-prop 'Apple Inc. Magic Trackpad 2' 'libinput Accel Speed' 0.5

  # Macbook Pro Trackpad
  xinput set-prop 'bcm5974' 'libinput Natural Scrolling Enabled' 1
  xinput set-prop 'bcm5974' 'libinput Accel Speed' 0.4

  # Logitech G402
  xinput set-prop 'Logitech Gaming Mouse G402' 'libinput Accel Speed' -0.8

  # Logitech G102
  xinput set-prop 'Logitech G102 LIGHTSYNC Gaming Mouse' 'libinput Natural Scrolling Enabled' 1
  xinput set-prop 'Logitech G102 LIGHTSYNC Gaming Mouse' 'libinput Accel Speed' -0.5

  # TrackPoint Keyboard 2
  xinput set-prop       'Lenovo TrackPoint Keyboard II Mouse' 'libinput Natural Scrolling Enabled' 1
  xinput set-button-map 'Lenovo TrackPoint Keyboard II Mouse' 1 0 3
  xinput set-prop       'Lenovo TrackPoint Keyboard II Mouse' 'libinput Accel Speed' 0.3
}

set-props
udevadm monitor -u | while read -r _ _ tag _; do
  if [ "$tag" = "bind" ];then
    set-props
  fi
done
