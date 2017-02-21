#!/usr/bin/env tarantool

local kit = require('luakit')
local tap = require('tap')

local test = tap.test('luakit tests')
test:plan(1)

test:test('luakit', function(test)
    test:plan(1)
    test:is(kit.test(1), 11, "Lua function in init.lua")
end)

os.exit(test:check() == true and 0 or -1)
