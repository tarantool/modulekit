#!/usr/bin/env tarantool

local kit = require('ckit')
local tap = require('tap')

local test = tap.test('ckit tests')
test:plan(1)

test:test('kit', function(test)
    test:plan(2)
    test:is(kit.func(10, 15), 25, "Lua function")
    test:is(kit.cfunc(10, 15), 25, "Lua/C function")
end)

os.exit(test:check() == true and 0 or -1)
