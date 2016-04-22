# modulekit - A set of [Tarantool][] module templates

[![Build Status](https://travis-ci.org/tarantool/modulekit.png?branch=master)](https://travis-ci.org/tarantool/modulekit)

## Prerequisites

 * Tarantool 1.6.5+ with header files (tarantool && tarantool-dev packages)

## HOWTO

1. Clone this repository

    git clone https://github.com/tarantool/modulekit.git

2. Rename all files to use your favorite name:

    ```bash
    grep -R modulekit .
    mv modulekit/ mymodule/
    mv test/modulekit.test.lua test/mymodule.test.lua
    ...
    ```

3. Implement code in `./mymodule/`.

4. Add tests to `./test/mymodule.test.lua`:

    ```bash
    prove -v ./test/modulekit.test.lua or ./test/modulekit.test.lua
    ```

5. Update copyrights and README files.

6. Push all files except `rpm/`, `debian/`, `mymodule-scm-1.rockspec`.

7. Update and check `.rockspec`:

    ```bash
    luarocks install --local modulekit-scm-1.rockspec
    ```

8. Push `.rockspec` and make a pull request with it `.rockspec` to
   https://github.com/tarantool/rocks repository.

9. [Optional] Check DEB packaging and push `debian/` to GitHub:

    ```bash
    dpkg-buildpackage -D -b -us -uc
    ls -l ../*.deb
    ```

10. [Optional] Check RPM packaging and push `rpm/` to GitHub.

    ```bash
    tar cvzf ~/rpmbuild/SOURCES/tarantool-modulekit-1.0.0.tar.gz
    rpmbuild -b rpm/tarantool-modulekit.spec
    ```

[Tarantool.org][Download] build system build packages for all popular
platforms automatically for you.

Enjoy!
Thank your for contributing Tarantool!

## Content of the ModuleKit

  * `./README.md` - this file
  * `./modulekit/init.lua` - the Lua module itself, load with require('modulekit')
  * `./modulekit/functions.lua` - Lua submodule
  * `./modulekit/cfunctions.c` - Lua/C submodule
  * `./test/modulekit.test.lua` - tests for the module
  * `./modulekit-scm-1.rockspec` a specification for [TarantoolRocks][]
  * `./rpm/` - files to build RPM package
  * `./debian/` - files to build DEB package
  * `./CMakeLists.txt`, `./FindTarantool.cmake` - [CMake][] scripts
    (only needed for C and Lua/C modules).

## More Examples

 * [A pure Lua module example](https://github.com/tarantool/queue)
 * [One more pure Lua module example](https://github.com/tarantool/gperftools)
 * [Lua/C module example](https://github.com/tarantool/pg)
 * [One more Lua/C module example](https://github.com/tarantool/http)


## See Also

 * [Tarantool][]
 * [Tarantool Rocks][TarantoolRocks]
 * [Tarantool/Lua API Reference][TarantoolLuaReference]
 * [Tarantool/C API Reference][TarantoolCReference]
 * [Lua/C API Reference][LuaCReference]

[Tarantool]: http://github.com/tarantool/tarantool
[Download]: http://tarantool.org/download.html
[RockSpec]: https://github.com/keplerproject/luarocks/wiki/Rockspec-format
[LuaCReference]: http://pgl.yoyo.org/luai/i/_
[TarantoolLuaReference]: http://tarantool.org/doc/reference/index.html
[TarantoolCReference]: http://tarantool.org/doc/reference/capi.html
[TarantoolRocks]: https://github.com/tarantool/rocks
