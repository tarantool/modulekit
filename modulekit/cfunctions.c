/* A C submodule */
#include <tarantool.h>

#include <lua.h>
#include <lauxlib.h>

static int
modulekit_func(struct lua_State *L)
{
	if (lua_gettop(L) < 2)
		luaL_error(L, "Usage: cfunctions.func(a: number, b: number)");

	int a = lua_tointeger(L, 1);
	int b = lua_tointeger(L, 2);

	lua_pushinteger(L, a + b);
	return 1; /* one return value */
}

LUA_API int
luaopen_modulekit_cfunctions(lua_State *L)
{
	/* result is returned from require('modulekit.cfunctions') */
	lua_newtable(L);
	static const struct luaL_reg meta [] = {
		{"func", modulekit_func},
		{NULL, NULL}
	};
	luaL_register(L, NULL, meta);
	return 1;
}
/* vim: syntax=lua ts=8 sts=8 sw=8 noet */
