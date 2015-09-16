#!/usr/bin/env tarantool

package.path = "../?.lua;../?/init.lua;./?.lua;./?/init.lua"
package.cpath = "../?.so;../?.dylib;./?.so;./?.dylib"

local kit = require('modulekit')

require('tap').test('kit', function(test)
    test:plan(3)
    test:is(kit.test(1), 11, "Lua function in init.lua")
    test:is(kit.functions.func(10, 15), 25, "Lua function in submodule")
    test:is(kit.cfunctions.func(10, 15), 25, "Lua/C function in submodule")
end)
