local wezterm = require('wezterm')
local gpu_adapters = require('utils.gpu_adapter')
local colors = require('colors.custom')

return {
  animation_fps = 60,
  default_cursor_style = "BlinkingBar",
  enable_kitty_graphics = true,
  native_macos_fullscreen_mode = true,
  use_cap_height_to_scale_fallback_fonts = true,
  bold_brightens_ansi_colors = true,
  max_fps = 60,
  webgpu_power_preference = 'HighPerformance',
  webgpu_preferred_adapter = gpu_adapters:pick(),

  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = true,
  audible_bell = "Disabled",
  clean_exit_codes = { 130 },
  -- color scheme
  colors = colors,

  -- background
  background = {
    {
      source = { File = wezterm.GLOBAL.background },
    },
    {
      source = { Color = colors.background },
      height = '100%',
      width = '100%',
      opacity = 0.96,
    },
  },

  -- scrollbar
  enable_scroll_bar = true,

  -- tab bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  tab_max_width = 25,
  show_tab_index_in_tab_bar = false,
  switch_to_last_active_tab_when_closing_tab = true,

  -- window
  window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 10,
  },
  window_close_confirmation = 'NeverPrompt',
  window_decorations = 'RESIZE',
  window_background_opacity = 0.9,
  text_background_opacity = 0.9,
  macos_window_background_blur = 70,
  adjust_window_size_when_changing_font_size = false,
  window_frame = {
    active_titlebar_bg = '#090909',
    -- font = fonts.font,
    -- font_size = fonts.font_size,
  },
  inactive_pane_hsb = {
    saturation = 0.7,
    brightness = 0.6,
  },
  initial_cols = 200,
  initial_rows = 70,
}
