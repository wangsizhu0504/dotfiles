local wezterm = require('wezterm')
local platform = require('utils.platform')

local font = 'JetBrainsMono Nerd Font'
local font_size = platform().is_mac and 12 or 9

return {
  font = wezterm.font_with_fallback({
    { family = font, weight = "Regular" },
  }),
  font_size = font_size,
  line_height = 1.3,
  front_end = "WebGpu",
  harfbuzz_features = { "calt=1", "ss01=1" },
  --ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
  freetype_load_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
  freetype_render_target = 'Normal', ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
}
