local secenv = _G
local modname = minetest.get_current_modname()
local sec = (minetest.settings:get('secure.enable_security') == 'true')
local ie

-- //MFF (Mg|01/07/2016 for classic#508, hg#104, sb#166, creative#68)
if (rawget(_G, "rawlen") == nil) then
	rawlen = {} -- That's extremely bad, but our only mean of stopping StackTracePlus from complaining about rawlen being undefined
end

if sec then
  ie = minetest.request_insecure_environment()
  if ie == nil then
    error("Mod security is on but " .. modname .. " is not whitelisted as a secure mod")
  end
end

if sec then
  string, io, debug, coroutine = ie.string, ie.io, ie.debug, ie.coroutine
end

local STP = dofile(minetest.get_modpath(modname) .. '/StackTracePlus/src/StackTracePlus.lua')
-- Remove string/table dump length limits
STP.max_tb_output_len = math.huge

if sec then
  ie.debug.traceback = STP.stacktrace
  -- StackTracePlus caches the following modules, reset them to the original ones to
  -- avoid leaking them
  string, io, debug, coroutine = secenv.string, secenv.io, secenv.debug, secenv.coroutine
  ie = nil
end
debug.traceback = STP.stacktrace

minetest.log('action', "[" .. modname .. "] replaced debug.traceback")
