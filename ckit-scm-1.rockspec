package = 'ckit'
version = 'scm-1'

source  = {
    url    = 'git://github.com/tarantool/modulekit.git';
    branch = 'ckit';
}

description = {
    summary  = "C module template for Tarantool";
    detailed = [[
    A ready-to-use C module template.
    Clone and modify to create new modules.
    ]];
    homepage = 'https://github.com/tarantool/modulekit.git';
    license  = 'BSD';
    maintainer = "Roman Tsisyk <roman@tarantool.org>";
}

dependencies = {
    'lua == 5.1';
}

external_dependencies = {
    TARANTOOL = {
        header = 'tarantool/module.h';
    };
}

build = {
    type = 'cmake';
    variables = {
        CMAKE_BUILD_TYPE="RelWithDebInfo";
        TARANTOOL_INSTALL_LIBDIR="$(LIBDIR)";
        TARANTOOL_INSTALL_LUADIR="$(LUADIR)";
    };
}
-- vim: syntax=lua ts=4 sts=4 sw=4 et
