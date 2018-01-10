<a href="http://tarantool.org">
	<img src="https://avatars2.githubusercontent.com/u/2344919?v=2&s=250" align="right">
</a>
<a href="https://travis-ci.org/tarantool/modulekit">
	<img src="https://travis-ci.org/tarantool/modulekit.png?branch=ckit" align="right">
</a>

# C module template for Tarantool 1.6+

Use this template to create and publish a [Tarantool][] module written in C.

**Note:** If you write a Tarantool module in pure Lua only, see the
[luakit][Luakit] branch of this repository.

## Table of contents
* [Kit content](#kit-content)
* [Prerequisites](#prerequisites)
* [Examples](#examples)
* [See also](#see-also)

## Kit content

  * `./README.md` - this file
  * `./ckit/init.lua` - the Lua module itself, loaded with `require('ckit')`
  * `./ckit/lib.c` - C module
  * `./test/ckit.test.lua` - tests for the module
  * `./ckit-scm-1.rockspec` - a specification for the
    [tarantool/rocks][TarantoolRocks] repository
  * `./rpm/` - files to build an RPM package
  * `./debian/` - files to build a DEB package
  * `./CMakeLists.txt`, `./FindTarantool.cmake` - CMake scripts
    (only needed for C modules)
    
## Prerequisites

Tarantool 1.6.5+ with header files (`tarantool`, `tarantool-dev` and
`libmsgpuck-dev` packages)

## Usage

1. Clone this repository and switch to the `ckit` branch.

   ```bash
   git clone https://github.com/tarantool/modulekit.git
   git fetch origin
   git checkout -b ckit origin/ckit
   ```

2. Rename all files to use your favorite name.

   For example, `mymodule`:

    ```bash
    grep -R ckit .
    mv ckit/ mymodule/
    mv test/ckit.test.lua test/mymodule.test.lua
    ...
    ```

3. Implement your code in `./mymodule/`.

   You will have one or more *C modules*, which export their functions for
   API calls. Also, you may have *Lua modules*, which in their turn may
   re-export the C modules' functions for API calls.
   
   As an example, see the following modules from the `ckit` package:
   * [ckit/lib.c][CModule] - a C module. Here we have one internal function
     (`ckit_func()`) and export another function (`luaopen_ckit_lib()`) which
     uses `ckit_func()`.
   * [ckit/init.lua][LuaCModule] - a Lua module. Here we load the C module
     with `require('ckit.lib')` and then re-export it as `cfunc` function for
     API calls. Also, we have a Lua function (`func()`) that uses the
     exported C function from `ckit.lib`, and we export this Lua function as
     `func` function.
     
   As a result, after we publish the `ckit` package in step 7, Tarantool
   users will be able to load the package and call two functions:
   * the C function `luaopen_ckit_lib()` - with `require('ckit.lib').func(args)`
     or `require('ckit').cfunc(args)`, and
   * the Lua function `func()` - with `require('ckit').func(args)`.

4. Add tests to `./test/mymodule.test.lua`:

    ```bash
    prove -v ./test/ckit.test.lua or ./test/ckit.test.lua
    ```

5. Update copyright and README files.

6. Push all files except `rpm/`, `debian/` and `mymodule-scm-1.rockspec`.

7. Update and check the rockspec.
    
   A `.rockspec` file wraps a module into a package. This is what you can
   publish. If you are new to Lua rocks, see general information on rockspec 
   [format][RockSpecFormat] and [creation][RockSpecCreation].
   
   Your rockspec must comply with [these requirements][Requirements]
   and allow to build and install your package locally:

    ```bash
    luarocks install --local mymodule-scm-1.rockspec
    ```
    
    See an annotated rockspec example in [ckit-scm-1.rockspec][CRockSpec].

8. Push your rockspec and make a pull request to the
   [tarantool/rocks][TarantoolRocks] repository.
   
   The Tarantool team will review the request and decide on including your
   package in [Tarantool rocks list][TarantoolRocksList] and 
   [official Tarantool images for Docker][TarantoolDocker].


9. [Optional] Check DEB packaging and push `debian/` to GitHub.

    ```bash
    dpkg-buildpackage -D -b -us -uc
    ls -l ../*.deb
    ```

10. [Optional] Check RPM packaging and push `rpm/` to GitHub.

    ```bash
    tar cvzf ~/rpmbuild/SOURCES/tarantool-mymodule-1.0.0.tar.gz
    rpmbuild -b rpm/tarantool-mymodule.spec
    ```

Enjoy! Thank you for contributing to Tarantool.

## Examples

 * [C module example](http://github.com/tarantool/pg)
 * [One more C module example](http://github.com/tarantool/http)

## See also

 * [Tarantool/C API Reference][TarantoolCReference]
 * [Lua/C API Reference][LuaCReference]
 * [Basics of creating a Lua module for Tarantool][CreateLuaModule]

[Tarantool]: http://github.com/tarantool/tarantool
[Download]: http://tarantool.org/download.html
[Requirements]: http://github.com/tarantool/rocks#contributing
[RockSpecFormat]: http://github.com/keplerproject/luarocks/wiki/Rockspec-format
[RockSpecCreation]: http://github.com/luarocks/luarocks/wiki/Creating-a-rock
[LuaCReference]: http://pgl.yoyo.org/luai/i/_
[TarantoolLuaReference]: http://tarantool.org/doc/reference/index.html
[TarantoolCReference]: http://tarantool.org/doc/reference/capi.html
[TarantoolRocks]: http://github.com/tarantool/rocks
[TarantoolRocksList]: http://tarantool.org/en/download/rocks.html
[TarantoolDocker]: http://github.com/tarantool/docker
[Luakit]: http://github.com/tarantool/modulekit/tree/luakit
[Ckit]: http://github.com/tarantool/modulekit/tree/ckit
[LuaModule]: http://github.com/tarantool/modulekit/blob/luakit/luakit/init.lua
[CModule]: http://github.com/tarantool/modulekit/blob/ckit/ckit/lib.c
[LuaCModule]: http://github.com/tarantool/modulekit/blob/ckit/ckit/init.lua
[LuaRockSpec]: http://github.com/tarantool/modulekit/blob/luakit/luakit-scm-1.rockspec
[CRockSpec]: http://github.com/tarantool/modulekit/blob/ckit/ckit-scm-1.rockspec
[CreateLuaModule]: http://tarantool.org/en/doc/book/app_server/creating_app.html#modules-rocks-and-applications
