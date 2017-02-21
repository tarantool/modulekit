<a href="http://tarantool.org">
	<img src="https://avatars2.githubusercontent.com/u/2344919?v=2&s=250" align="right">
</a>
<a href="https://travis-ci.org/tarantool/luakit">
	<img src="https://travis-ci.org/tarantool/luakit.png?branch=master" align="right">
</a>

# Lua module template for Tarantool

Use this template to create and publish a [Tarantool][] module written in Lua.

## Table of contents
* [Content](#content)
* [Prerequisites](#prerequisites)
* [Examples](#examples)
* [See also](#see-also)

## Content

  * `./README.md` - this file
  * `./luakit/init.lua` - the Lua module itself, load with `require('luakit')`
  * `./luakit-scm-1.rockspec` - a specification for [TarantoolRocks][]
  * `./rpm/` - files to build an RPM package
  * `./debian/` - files to build a DEB package

## Prerequisites

Tarantool 1.6.8+ with header files (`tarantool` and `tarantool-dev` packages)

## Usage

1. Clone this repository.

   ```bash
   git clone https://github.com/tarantool/luakit.git
   ```

2. Rename all files to use your favorite name.

   For example, `mymodule`:

    ```bash
    grep -R luakit .
    mv luakit/ mymodule/
    mv test/luakit.test.lua test/mymodule.test.lua
    ...
    ```

3. Implement your code in `./mymodule/`.

4. Add tests to `./test/mymodule.test.lua`:

    ```bash
    prove -v ./test/luakit.test.lua or ./test/luakit.test.lua
    ```

5. Update copyright and README files.

6. Push all files except `rpm/`, `debian/` and `mymodule-scm-1.rockspec`.

7. Update and check `.rockspec`.

   Your `.rockspec` file must comply with [these requirements][Requirements]
   and allow to successfully install your module locally:

    ```bash
    luarocks install --local luakit-scm-1.rockspec
    ```

8. Push your `.rockspec` and make a pull request to
   http://github.com/tarantool/rocks repository.

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

 * [Lua module example](http://github.com/tarantool/queue)
 * [One more Lua module example](http://github.com/tarantool/gperftools)
 * [C module example](http://github.com/tarantool/pg)
 * [One more C module example](http://github.com/tarantool/http)


## See also

 * [Tarantool][]
 * [Tarantool Rocks][TarantoolRocks]
 * [Tarantool/Lua API Reference][TarantoolLuaReference]
 * [Tarantool/C API Reference][TarantoolCReference]
 * [Lua/C API Reference][LuaCReference]

[Tarantool]: http://github.com/tarantool/tarantool
[Download]: http://tarantool.org/download.html
[Requirements]: http://github.com/tarantool/rocks#contributing
[RockSpec]: http://github.com/keplerproject/luarocks/wiki/Rockspec-format
[LuaCReference]: http://pgl.yoyo.org/luai/i/_
[TarantoolLuaReference]: http://tarantool.org/doc/reference/index.html
[TarantoolCReference]: http://tarantool.org/doc/reference/capi.html
[TarantoolRocks]: http://github.com/tarantool/rocks
