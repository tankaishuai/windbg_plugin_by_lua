win32exts.load_sym("*", "*")
win32exts.MessageBoxW(nil, {"init windbg_plugin_by_lua"}, nil, 0)
g_buf = win32exts.malloc(2*260)

win32exts.convert_sym(true)
g_iExtensionApis = win32exts.convert(win32exts.ExtensionApis())
win32exts.convert_sym(false)

function init_api()
	if (not g_iGetExpressionRoutine) or (0 == g_iGetExpressionRoutine) then
		g_iOutputRoutine = win32exts.read_value(g_iExtensionApis, 4, 4)
		g_iGetExpressionRoutine = win32exts.read_value(g_iExtensionApis, 8, 4)
		g_iReadProcessMemoryRoutine = win32exts.read_value(g_iExtensionApis, 24, 4)
		g_iWriteProcessMemoryRoutine = win32exts.read_value(g_iExtensionApis, 28, 4)
	end
end


--command: do_file
--
--g_buf * 260 unic
--init_api()
--g_iExtensionApis
--g_iOutputRoutine(fmt, ...)
--g_iGetExpressionRoutine(expr)
--ul = g_iReadProcessMemoryRoutine(off, buf, cb, &cbRet)
--ul = g_iWriteProcessMemoryRoutine(off, buf, cb, &cbRet)


function do_file(args)
	init_api()
	local args_val = win32exts.arg(args, 5)
	local args_str = win32exts.read_astring(args_val, 0, -1, 0)
	if g_iOutputRoutine > 0 then
		win32exts.call(win32exts.convert(g_iOutputRoutine), "start do_file: %s\n", args_val)
	end
	return dofile(args_str)
end
