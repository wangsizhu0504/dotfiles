-------------------------------------------------------------------------------
--                          WezTerm Configuration
-------------------------------------------------------------------------------
local Config = require('config')
require('utils.backdrops'):set_files():random()

require('events.right-status').setup()
require('events.tab-title').setup()
require('events.new-tab-button').setup()

local wezConfig = Config:init()
    :append(require('config.appearance'))
    :append(require('config.bindings'))
    :append(require('config.domains'))
    :append(require('config.fonts'))
    :append(require('config.general')).options

return wezConfig
