-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- timeout before show which_key and also exit current command chain
vim.opt.timeoutlen = 1000

vim.opt.ttimeoutlen = 50

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

-- Keymaps ported from Vimscript (rsi-like behavior)
local map = vim.keymap.set

-- Insert mode mappings
map("i", "<C-A>", "<C-O>^")
map("i", "<C-X><C-A>", "<C-A>")
map("i", "<C-B>", function()
  local line = vim.fn.getline(".")
  if line:match("^%s*$") and vim.fn.col(".") > #line then
    return "0\22\27kJs" -- 0<C-D><Esc>kJs
  else
    return "<Left>"
  end
end, { expr = false })
map("i", "<C-D>", function()
  if vim.fn.col(".") > #vim.fn.getline(".") then
    return "<C-D>"
  else
    return "<Del>"
  end
end, { expr = true })
map("i", "<C-E>", function()
  if vim.fn.col(".") > #vim.fn.getline(".") or vim.fn.pumvisible() == 1 then
    return "<C-E>"
  else
    return "<End>"
  end
end, { expr = true })
map("i", "<C-F>", function()
  if vim.fn.col(".") > #vim.fn.getline(".") then
    return "<C-F>"
  else
    return "<Right>"
  end
end, { expr = true })

-- Command-line mode mappings
map("c", "<C-A>", "<Home>")
map("c", "<C-X><C-A>", "<C-A>")
map("c", "<C-B>", "<Left>")
map("c", "<C-D>", function()
  if vim.fn.getcmdpos() > #vim.fn.getcmdline() then
    return "<C-D>"
  else
    return "<Del>"
  end
end, { expr = true })
map("c", "<C-F>", function()
  if vim.fn.getcmdpos() > #vim.fn.getcmdline() then
    return vim.o.cedit
  else
    return "<Right>"
  end
end, { expr = true })

-- Command-line transpose
map("c", "<C-T>", function()
  local pos = vim.fn.getcmdpos()
  local cmdline = vim.fn.getcmdline()
  if vim.fn.getcmdtype():match("[?/]") then
    return "<C-T>"
  elseif pos > #cmdline + 1 then
    return "<Left><BS><Right>" .. (cmdline:sub(pos - 2, pos - 2) or "")
  elseif pos <= 1 then
    return "<Right><BS><Right>" .. (cmdline:sub(1, 1) or "")
  else
    return "<BS><Right>" .. (cmdline:sub(pos - 2, pos - 2) or "")
  end
end, { expr = true })


-- Command-line <C-U> and <C-Y>
map("c", "<C-U>", function()
  if vim.fn.getcmdpos() > 1 then
    vim.fn.setreg("-", vim.fn.getcmdline():sub(1, vim.fn.getcmdpos() - 2))
  end
  return "<C-U>"
end, { expr = true })
map("c", "<C-Y>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-Y>"
  else
    return "<C-R>-"
  end
end, { expr = true })

-- Meta key mappings (for GUI/Neovim)
map({ "i", "c" }, "<M-b>", "<S-Left>")
map({ "i", "c" }, "<M-f>", "<S-Right>")
map({ "i", "c" }, "<M-d>", "<C-O>dw")
map("c", "<M-d>", "<S-Right><C-W>")
map({ "i", "c" }, "<M-n>", "<Down>")
map({ "i", "c" }, "<M-p>", "<Up>")
map({ "i", "c" }, "<M-BS>", "<C-W>")
map({ "i", "c" }, "<M-C-h>", "<C-W>")

-- Terminal mode mappings (if needed)
map("t", "<M-b>", "<Esc>b")
map("t", "<M-f>", "<Esc>f")
map("t", "<M-d>", "<Esc>d")
map("t", "<M-n>", "<Esc>n")
map("t", "<M-p>", "<Esc>p")
map("t", "<M-BS>", "<Esc><C-?>")
map("t", "<M-C-h>", "<Esc><C-H>")

vim.opt.conceallevel = 0

vim.opt.guicursor =
  [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-lCursor,sm:block-blinkwait175-blinkoff150-blinkon175]]
--vim.api.nvim_set_hl(0, "lCursor", { reverse = true })

if vim.g.neovide then
  vim.opt.guifont = "Maple Mono:h14"
  vim.opt.linespace = 2

  vim.g.neovide_refresh_rate = 75
  vim.g.neovide_refresh_rate_idle = 5

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
    [".sqruff"] = "toml",
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
