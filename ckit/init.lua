--------------------------------------------------------------------------------
--- An example of Lua module for Tarantool
--------------------------------------------------------------------------------

--
-- Dependencies
--

local log = require('log') -- some Tarantool module

-- C library
local clib = require('ckit.lib')
-- Now you can use functions.* and cfunctions.* in your code

--
-- Constants
--

-- local variables are only visible from this file.
local SOME_CONSTANT = 10

--
-- Functions
--

-- A some module function
local function func(a, b)
    log.info("func() called with a=%s b=%s", a, b)
    return a + b
end

--
-- Export functions
--

-- result is returned from require('example')
return {
    func = func; -- Lua function
    cfunc = clib.func; -- Lua/C function
}
-- vim: ts=4 sts=4 sw=4 et
