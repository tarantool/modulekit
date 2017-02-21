--------------------------------------------------------------------------------
--- An example of Lua module for Tarantool
--------------------------------------------------------------------------------

--
-- Dependencies
--

local log = require('log') -- some Tarantool module

--
-- Constants
--

-- local variables are only visible from this file.
local SOME_CONSTANT = 10

--
-- Functions
--

-- A some module function
local function test(x)
    if x == nil then
        error("Usage: test(x: integer)")
    end
    log.info("test() called with x=%s", x)
    return x + SOME_CONSTANT
end

--
-- Export functions
--

-- returned a result from require('luakit')
return {
    test = test;
}
-- vim: ts=4 sts=4 sw=4 et
