#!/usr/bin/env tarantool

local kit = require('modulekit')
local tap = require('tap')

local test = tap.test('modulekit tests')
test:plan(1)

test:test('kit', function(test)
    test:plan(3)
    test:is(kit.test(1), 11, "Lua function in init.lua")
    test:is(kit.functions.func(10, 15), 25, "Lua function in submodule")
    test:is(kit.cfunctions.func(10, 15), 25, "Lua/C function in submodule")
end)

os.exit(test:check() == true and 0 or -1)
