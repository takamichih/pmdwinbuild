# pmdwinbuild
scripts to build pmdwin using MinGW-w64 with patches to fix some of the bugs

For various reasons I didn't look at the pmdwin's source while reverse engineering pmd for 98fmplayer, but I decided to create patches to build pmdwin.

* Supports compiling under latest gcc (tested with i686-w64-mingw32-gcc 7.3.0 on Arch) instead of the ancient Visual C++ 6.0
  I think it is possible to build on Ubuntu, Ubuntu on WSL, or MSYS2 with minor tweaking (such as `PREFIX` variable in Makefile).

  However this might still contain some UB that would not manifestate under ancient compilers.

  Probably still compilable under MSVC and Visual C++ 6.0.

* Fixed some bugs:
  * SSG frequency error (`0002-ssg-pitch.patch`)
  * SSG effect bug (`0003-ssg-effect.patch`)
    Fixes noise sweep (Example: SSG effect #6: `n6`, which is triggered by SSG rhythm @64 "Snare Drum 2"

Because of licensing reasons (original license forbids redistribution of source and binary without permission) I only included the patches. The patches themselves are MIT license.

# How to build
  bash, wget, 7z, sha256sum, patch, Mingw-w64 i686 gcc is required.
  Makefile assumes `i686-w64-mingw32-gcc` for gcc.

  1. `git clone $this_repo`
  2. `make -j$whatever`
  3. `pmdwin.dll` is generated under `build/` directory
