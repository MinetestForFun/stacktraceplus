unused_args = false
max_defined_top = true
max_line_length = 999

globals = {
    "minetest", "debug",
    "io", "coroutine",
}

read_globals = {
    string = {fields = {"split", "trim"}},
    table = {fields = {"copy", "getn"}},
}

files["init.lua"].ignore = { "rawlen", "string", "ie" }
files["StackTracePlus/src/StackTracePlus.lua"].ignore = { "" }
files["StackTracePlus/test/test.lua"].ignore = { "" }
files["StackTracePlus/test/test_questionmark.lua"].ignore = { "" }
files["StackTracePlus/unittest/test.lua"].ignore = { "" }
files["StackTracePlus/src/StackTracePlus.lua"].ignore = { "" }
                                                -- ^ Ignore everything
