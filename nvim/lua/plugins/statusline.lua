return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, options)
      local empty = require("lualine.component"):extend()
      function empty:draw(default_highlight)
        self.status = ""
        self.applied_separator = ""
        self:apply_highlights(default_highlight)
        self:apply_section_separators()
        return self.status
      end

      -- Put proper separators and gaps between components in sections
      local function process_sections(sections)
        for name, section in pairs(sections) do
          local left = name:sub(9, 10) < "x"
          for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
            table.insert(section, pos * 2, { empty })
          end
          for id, comp in ipairs(section) do
            if type(comp) ~= "table" then
              comp = { comp }
              section[id] = comp
            end
            comp.separator = left and { right = "" } or { left = "" }
          end
        end
        return sections
      end

      options.sections.lualine_z = {}
      options.sections = process_sections(options.sections)
      options.options.section_separators = { left = "", right = "" }
      return options
    end,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
}
