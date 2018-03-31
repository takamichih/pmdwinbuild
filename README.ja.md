# pmdwinbuild
pmdwin を MinGW-w64 でビルドするためのパッチとおまけのバグフィクス

自分で 98fmplayer のために pmd を解析していたこともあり様々な事情で pmdwin のソースを見るのは避けていたのですがこれを作ることにしました。

* 最新の gcc でビルド可能 (Arch 上の i686-w64-mingw32-gcc 7.3.0 で確認)
  Ubuntu, WSL 上の Ubuntu, Makefile の `PREFIX` 変数とかを弄れば MSYS2 でも可能だと思います。

  ただなにせ元が Visual C++ 6.0 用なので、とりきれてない UB が残っている可能性があります。

  試していませんが多分最近の MSVC とか Visual C++ 6.0 でもコンパイルできると思います。

* おまけのバグフィクス
  * SSG 周波数のずれ (`0002-ssg-pitch.patch`)
  * SSG 効果音 (`0003-ssg-effect.patch`)
    ノイズスイープを修正します (例: 効果音 #6 `n6`, SSG リズム @64 "Snare Drum 2" の中身)

ライセンスの事情でパッチのみの公開です。パッチ自体は MIT ライセンスです。

# ビルド方法
  bash, wget, 7z, sha256sum, patch, MinGW-w64 i686 gcc が必要です。
  Makefile は gcc が `i686-w64-mingw32-gcc` だと想定してあります。

  1. `git clone $このレポジトリ`
  2. `make -j$コア数とか`
  3. `pmdwin.dll` が `build/` 内に生成されます
