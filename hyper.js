// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // choose either `'stable'` for receiving highly polished,
    // or `'canary'` for less polished but more frequent updates
    updateChannel: "stable",

    // default font size in pixels for all tabs
    fontSize: 16,

    // font family with optional fallbacks
    fontFamily:
      '"VictorMono Nerd Font", "OperatorMonoSSmLig Nerd Font", "DankMono Nerd Font", "FuraCodeiScript Nerd Font Mono", "BlexMono Nerd Font",  "FuraCode Nerd Font", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    // default font weight: 'normal' or 'bold'
    fontWeight: "normal",

    // font weight for bold characters: 'normal' or 'bold'
    fontWeightBold: "bold",

    // line height as a relative unit
    lineHeight: 1,

    // letter spacing as a relative unit
    letterSpacing: 0,

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: "#FBB829",

    // terminal text color under BLOCK cursor
    cursorAccentColor: "#1c1b19",

    // `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
    cursorShape: "BLOCK",

    // set to `true` (without backticks and without quotes) for blinking cursor
    cursorBlink: true,

    // color of the text
    foregroundColor: "#fce8c3",

    // terminal background color
    // opacity is only supported on macOS
    backgroundColor: "rgba(28,27,25,0.888)",

    // terminal selection color
    selectionColor: "#FCE8C3",

    // border color (window, tabs)
    borderColor: "rgba(28,27,25,0.888)",

    // custom CSS to embed in the main window
    css: "",

    // custom CSS to embed in the terminal window
    termCSS: "",

    // if you're using a Linux setup which show native menus, set to false
    // default: `true` on Linux, `true` on Windows, ignored on macOS
    showHamburgerMenu: "",

    // set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
    showWindowControls: "",

    // custom padding (CSS format, i.e.: `top right bottom left`)
    padding: "0px 4px 4px 4px",

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: "#1C1B19",
      red: "#EF2F27",
      green: "#519F50",
      yellow: "#FBB829",
      blue: "#2C78BF",
      magenta: "#E02C6D",
      cyan: "#0AAEB3",
      white: "#D0BFA1",
      lightBlack: "#918175",
      lightRed: "#F75341",
      lightGreen: "#98BC37",
      lightYellow: "#FED06E",
      lightBlue: "#68A8E4",
      lightMagenta: "#FF5C8F",
      lightCyan: "#53FDE9",
      lightWhite: "#FCE8C3",
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // PowerShell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: "",

    // for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
    // by default `['--login']` will be used
    shellArgs: ["--login"],

    // for environment variables
    env: {},

    // set to `false` for no bell
    bell: "SOUND",

    // if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
    copyOnSelect: true,

    // if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
    defaultSSHApp: true,

    // if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
    // selection is present (`true` by default on Windows and disables the context menu feature)
    // quickEdit: true,

    // choose either `'vertical'`, if you want the column mode when Option key is hold during selection (Default)
    // or `'force'`, if you want to force selection regardless of whether the terminal is in mouse events mode
    // (inside tmux or vim with mouse mode enabled for example).
    macOptionSelectionMode: "vertical",

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // Whether to use the WebGL renderer. Set it to false to use canvas-based
    // rendering (slower, but supports transparent backgrounds)
    webGLRenderer: true,

    // for advanced config flags please refer to https://hyper.is/#cfg
    verminal: {
      fontFamily: '"OperatorMonoSSmLig Nerd Font"',
      fontSize: 12,
    },
    catppuccinTheme: "mocha",
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    "git-falcon9",
    "hyperline",
    "hyper-aura-theme",
    // "hypurr#latest",
    // 'gitrocket',
    // 'hyper-rose-pine',
    // 'hyper-atom-dark-transparent',
    // 'hyper-atom-dark-vibrancy',
    // 'hyper-cat',
    // 'hyper-clean',
    // 'hyper-material-box',
    // 'hyper-material-theme',
    // 'hyper-monokai-vibrancy',
    // 'hyper-one-dark-vivid',
    // 'hyper-pokemon',
    // 'hyper-snazzy',
    // 'hyper-solarized-dark'
    // 'hyper-solarized-dark',
    // 'hyper-spotify',
    // 'hyper-statusline',
    // 'hyperborder',
    // 'hypercwd',
    // 'hyperpower',
    // 'hyperterm-alternatescroll',
    // 'hyperterm-atom-dark',
    // 'hyperterm-monokai',
    // 'hyperterm-new-moon-theme',
    // 'space-pull',
    // "verminal",
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  },
};
