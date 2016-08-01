# StackTracePlus Minetest mod

StackTracePlus is a Lua module that extends `debug.traceback` to include more
call frame information such as local and globals, locals and parameters
dumps.

This mod merely plugs this module in and replaces `debug.traceback` with
StackTracePlus's traceback dump routine.

# Installing

This repository uses git submodules.

Clone this repo either recursively (`--recursive`) or as usual, but make sure
to `git submodule update --init` afterwards; it must go into the `mods`
directory.

## Mod security

This mod modifies the global `debug` table which is not accessible by normal
mods when mod security is enabled.

If you have enabled mod security (`secure.enable_security` is `true`), then you
must whitelist this mod in `minetest.conf`'s `secure.trusted_mods` config
entry.

# License

WTFPL / CC0 / Public Domain.

StackTracePlus is distributed under the MIT license.
