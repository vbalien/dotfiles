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
  },

  link: {
    "AppData\\Local\\nvim": "common\\nvim",

    ".local\\bin\\winfetch.ps1": "win\\local\\bin\\winfetch.ps1",

    "AppData\\Local\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json":
      "win\\terminal\\settings.json",

    "Documents\\PowerShell\\Microsoft.PowerShell_profile.ps1":
      "win\\powershell\\Microsoft.PowerShell_profile.ps1",
  },

  scripts: [
    `setx PATH "\${PATH};%USERPROFILE%\\.local\\bin"`,
  ],
};

const linux = {
  name: "linux",

  extend: common.name,

  guard: {
    platform: "linux",
  },

  link: {
    ".nvim": "common/nvim",
    ".gitconfig": "common/gitconfig",
  },
};

export default <MappingConfig[]> [
  common,
  win,
  linux,

  {
    name: "home-win",
    extend: win.name,
    guard: {
      hostname: "DeskMini",
    },
  },

  {
    name: "home-linux",
    extend: linux.name,
    guard: {
      hostname: "DeskMini",
    },
  },
];
