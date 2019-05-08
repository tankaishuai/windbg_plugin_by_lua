
--you can call it like this:
--   !luadbg.run do_file .\sample_plugin.lua
--   !luadbg.run echo_msg "your msg"

function echo_msg(args)
	--Make sure api enabled
	init_api()
	
	--Take command args
	local args_val = win32exts.arg(args, 5)
	
	--call OutputRoutine() to display text to WinDbg
	win32exts.call(win32exts.convert(g_iOutputRoutine), "echo_msg: %s\n", args_val)
	
	return true
end
