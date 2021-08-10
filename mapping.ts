import { MappingConfig } from "https://github.com/vbalien/ddot/raw/master/src/mapping_config.ts";

const common = {
  name: "common",
  link: {
    ".gitconfig": "common/gitconfig",
  },
};

const win = {
  name: "win",

  extend: common.name,

  guard: {
    platform: "windows",
    hostname: ["DeskMini", "office"]
  },

  link: {
    "AppData\\Local\\nvim": "common\\nvim",

    ".local\\bin\\winfetch.ps1": "win\\local\\bin\\winfetch.ps1",

    "AppData\\Local\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json":
      "win\\terminal\\settings.json",

    "Documents\\PowerShell\\Microsoft.PowerShell_profile.ps1":
      "win\\powershell\\Microsoft.PowerShell_profile.ps1",

    ".vbalien.omp.json": "win\\vbalien.omp.json",
  },

  scripts: [
    `setx PATH "\${PATH};%USERPROFILE%\\.local\\bin"`,
  ],
};

const linuxBase = {
  name: "linux",

  extend: common.name,

  guard: {
    platform: "linux",
  },

  link: {
    ".config/nvim": "common/nvim",
    ".zshrc": "linux/zshrc",
    ".pam_environment": "linux/pam_environment",
    ".local/bin/ufetch": "linux/local/bin/ufetch",
    ".config/ohmyzsh": "linux/ohmyzsh",
    ".config/tmux/tmux.conf": "common/tmux.conf",
  },
};

const linuxConsole = {
  name: "linux-console",
  extend: linuxBase.name,
  guard: {
    hostname: "home",
  },
};

const linuxGraphical = {
  name: "linux-graphical",

  extend: linuxBase.name,

  guard: {
    hostname: ["DeskMini", "T490s"],
  },

  link: {
    ".Xmodmap": "linux/Xmodmap",
    ".xinitrc": "linux/xinitrc",
    ".gtkrc-2.0": "linux/gtkrc-2.0",
    ".fehbg": "linux/fehbg",
    ".local/share/fonts": "linux/fonts",
    ".config/alacritty": "common/alacritty",
    ".config/autostart": "linux/autostart",
    ".config/dunst": "linux/dunst",
    ".config/bspwm": "linux/bspwm",
    ".config/sxhkd": "linux/sxhkd",
    ".config/gtk-3.0/settings.ini": "linux/gtk-3.0/settings.ini",
    ".config/mpv": "linux/mpv",
    ".config/picom": "linux/picom",
    ".config/rofi": "linux/rofi",
    ".config/wallpaper": "common/wallpaper",
    ".config/libinput-gestures.conf": "linux/libinput-gestures.conf",
    ".config/polybar": "linux/polybar",
    ".config/Trolltech.conf": "linux/Trolltech.conf",
  },

  scripts: [
    "betterlockscreen -u $HOME/.config/wallpaper",
  ],
};

const linuxGraphicalHDPI = {
  name: "linux-graphical-hdpi",

  extend: linuxGraphical.name,

  guard: {
    hostname: ["MBP"],
  },

  link: {
    ".Xresources": "linux-hdpi/Xresources",
    ".xprofile": "linux-hdpi/xprofile",
    ".pam_environment": "linux-hdpi/pam_environment",
  },
};

export default <MappingConfig[]> [
  common,
  win,
  linuxBase,
  linuxConsole,
  linuxGraphical,
  linuxGraphicalHDPI,
];
