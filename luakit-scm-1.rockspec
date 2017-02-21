package = 'luakit'
version = 'scm-1'

source  = {
    url    = 'git://github.com/tarantool/modulekit.git';
    branch = 'lua';
}

description = {
    summary  = "Lua module template for Tarantool";
    detailed = [[
    A ready-to-use Lua module template.
    Clone and modify to create new modules.
    ]];
    homepage = 'https://github.com/tarantool/modulekit';
    maintainer = "Roman Tsisyk <roman@tarantool.org>";
    license  = 'BSD2';
}

dependencies = {
    'lua == 5.1';
}

build = {
    type = 'builtin';
    modules = {
        ['luakit'] = 'luakit/init.lua';
    }
}
-- vim: syntax=lua ts=4 sts=4 sw=4 et
