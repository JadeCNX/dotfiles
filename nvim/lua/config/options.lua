-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- timeout before show which_key and also exit current command chain
vim.opt.timeoutlen = 1000

-- Show line number
vim.opt.number = true

-- Show relative line number
vim.opt.relativenumber = true

-- show command
vim.opt.showcmd = true

-- start horizontal split below
vim.opt.splitbelow = true

-- start vertical split right
vim.opt.splitright = true

-- number of lines of history
vim.opt.history = 1000

-- Set to auto read when a file is changed from the outside
vim.opt.autoread = true

vim.opt.swapfile = false

vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.textwidth = 160
vim.opt.showbreak = "↳ "

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.showtabline = 0

vim.opt.clipboard = ""

vim.opt.listchars = "tab:>-,trail:.,precedes:,extends:,space:⋅,eol:↴"
vim.opt.list = false

vim.g.autoformat = false

vim.g.loaded_perl_provider = 0

vim.opt.conceallevel = 0

vim.opt.guicursor =
  [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-lCursor,sm:block-blinkwait175-blinkoff150-blinkon175]]
--vim.api.nvim_set_hl(0, "lCursor", { reverse = true })

if vim.g.neovide then
  vim.opt.guifont = "DankMono Nerd Font:h14"
  vim.opt.linespace = 2

  vim.g.neovide_refresh_rate = 75
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_profiler = false
  vim.g.neovide_input_macos_option_key_is_meta = "both"
  vim.g.neovide_opacity = 0.8
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_window_blurred = true

  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  vim.keymap.set({ "n", "v" }, "<D-c>", [["*y]], { noremap = false })
  vim.keymap.set({ "n", "v" }, "<D-v>", [["*p]], { noremap = false })
  vim.keymap.set({ "c", "i" }, "<D-v>", "<C-R>*", { noremap = false })

  -- Allow clipboard copy paste in neovim
  vim.api.nvim_set_keymap("", "<D-v>", "*p<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>*", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>*", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>*", { noremap = true, silent = true })

  -- vim.g.terminal_color_0 = "#2e3436"
  -- vim.g.terminal_color_1 = "#cc0000"
  -- vim.g.terminal_color_2 = "#4e9a06"
  -- vim.g.terminal_color_3 = "#c4a000"
  -- vim.g.terminal_color_4 = "#3465a4"
  -- vim.g.terminal_color_5 = "#75507b"
  -- vim.g.terminal_color_6 = "#0b939b"
  -- vim.g.terminal_color_7 = "#d3d7cf"
  -- vim.g.terminal_color_8 = "#555753"
  -- vim.g.terminal_color_9 = "#ef2929"
  -- vim.g.terminal_color_10 = "#8ae234"
  -- vim.g.terminal_color_11 = "#fce94f"
  -- vim.g.terminal_color_12 = "#729fcf"
  -- vim.g.terminal_color_13 = "#ad7fa8"
  -- vim.g.terminal_color_14 = "#00f5e9"
  -- vim.g.terminal_color_15 = "#eeeeec"
end

local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

-- local python_path = "/opt/homebrew/bin/python3"
-- if file_exists(python_path) then
--   vim.g.python3_host_prog = python_path
-- end

local ruby_path = "/opt/homebrew/opt/ruby/bin/ruby"
if file_exists(ruby_path) then
  vim.g.ruby_host_prog = ruby_path
end

-- scroll off
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.scrollopt = "ver,jump,hor"

-- File types
vim.filetype.add({
  extensions = {
    conf = "sh",
    mm = "objc",
    php = "php",
    tsv = "csv",
    rasi = "rasi",
    rofi = "rasi",
    wofi = "rasi",
  },
  filename = {
    [".env"] = "dotenv",
    [".prettierrc"] = "yaml",
    [".sqlfluff"] = "toml",
    ["Dockerfile"] = "dockerfile",
    ["fish_variables"] = "fish",
    ["Jenkinsfile"] = "groovy",
    ["vrapperrc"] = "vim",
    ["vifmrc"] = "vim",
  },
  pattern = {
    ["Dockerfile.+"] = "dockerfile",
    ["Jenkinsfile.+"] = "groovy",
    [".*/waybar/config"] = "jsonc",
    [".*/mako/config"] = "dosini",
    [".*/kitty/.*\\.conf"] = "bash",
    [".*/hypr/.*%\\.conf"] = "hyprlang",
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
})

local function command_exists(cmd)
  local handle = io.popen("command -v " .. cmd)
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result ~= ""
  end
  return false
end

if command_exists("fnm") then
  local handle = io.popen("fnm exec --using=default -- node -p 'process.execPath'")
  if handle then
    local node_path = handle:read("*a"):gsub("%s+", "")
    handle:close()

    if node_path and node_path ~= "" then
      vim.g.node_host_prog = node_path
    end
  end
elseif command_exists("mise") then
  local handle = io.popen('echo "$(mise where node@22)/bin/node"')
  if handle then
    local node_path = handle:read("*a"):gsub("%s+", "")
    handle:close()

    if node_path and node_path ~= "" then
      vim.g.node_host_prog = node_path
    end
  end
end
