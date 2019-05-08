# windbg_plugin_by_lua

This project allow you to write WinDbg plugin by Lua script.

sample_plugin.lua is a simple demo.

you can call it like this:

1. Move luadbg.dll to WinDbg plugin directory.

2. Start Debugging. Use the command below to load you Lua script.
   !luadbg.run do_file .\sample_plugin.lua

3. Then you can call you function (e.g. echo_msg ) like:
   !luadbg.run echo_msg "your msg"
   
   
