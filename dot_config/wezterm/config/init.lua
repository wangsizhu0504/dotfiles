local wezterm = require('wezterm')

---@class Config
---@field options table
local Config = {}

---Initialize Config
---@return Config
function Config:init()
  self.__index = self
  local wezConfig = {}
  if wezterm.config_builder then
    wezConfig = wezterm.config_builder()
  end
  local config = setmetatable({ options = wezConfig }, self)
  return config
end

---Append to `Config.options`
---@param new_options table new options to append
---@return Config
function Config:append(new_options)
  for k, v in pairs(new_options) do
    if self.options[k] ~= nil then
      wezterm.log_warn(
        'Duplicate config option detected: ',
        { old = self.options[k], new = new_options[k] }
      )
      goto continue
    end
    self.options[k] = v
    ::continue::
  end
  return self
end

---Append plugin
---@return Config
function Config:Plugin()
  -- then finally apply the plugin
  -- these are currently the defaults:
  wezterm.plugin.require("https://github.com/nekowinston/wezterm-bar").apply_to_config(self.options, {
    position = "bottom",
    max_width = 32,
    dividers = "slant_right", -- or "slant_left", "arrows", "rounded", false
    indicator = {
      leader = {
        enabled = true,
        off = " ",
        on = " ",
      },
      mode = {
        enabled = true,
        names = {
          resize_mode = "RESIZE",
          copy_mode = "VISUAL",
          search_mode = "SEARCH",
        },
      },
    },
    tabs = {
      numerals = "arabic",        -- or "roman"
      pane_count = "superscript", -- or "subscript", false
      brackets = {
        active = { "", ":" },
        inactive = { "", ":" },
      },
    },
    clock = {           -- note that this overrides the whole set_right_status
      enabled = true,
      format = "%H:%M", -- use https://wezfurlong.org/wezterm/config/lua/wezterm.time/Time/format.html
    },
  })
  return self
end

return Config
