# pmdwinbuild
pmdwin を MinGW-w64 でビルドするためのパッチとおまけのバグフィクス

バイナリ差分の配布を開始しました: https://github.com/takamichih/pmdwinbuild/releases

自分で 98fmplayer のために pmd を解析していたこともあり様々な事情で pmdwin のソースを見るのは避けていたのですがこれを作ることにしました。

* 最新の gcc でビルド可能 (Arch 上の i686-w64-mingw32-gcc 7.3.0 で確認)

  Ubuntu, WSL 上の Ubuntu, Makefile の `PREFIX` 変数とかを弄れば MSYS2 でも可能だと思います。

  ただなにせ元が Visual C++ 6.0 用なので、とりきれてない UB が残っている可能性があります。

  試していませんが多分最近の MSVC とか Visual C++ 6.0 でもコンパイルできると思います。

* おまけのバグフィクス
  * SSG 周波数のずれ (`0002-ssg-pitch.patch`)
  * SSG 効果音 (`0003-ssg-effect.patch`)

    ノイズスイープを修正します (例: 効果音 #6 `n6`, SSG リズム @64 "Snare Drum 2" の中身)

  * SSG 音量相対変化 (`0004-ssg-volrel-sat.patch`)

    音量相対変化 (`) (` コマンド) 時に、変化値が大きすぎるときに飽和せずに無視していた問題を修正します

  * 線形補間のバグ (`0005-linearint-fix.patch`)

    `opnaw.cpp` 内の線形補間アルゴリズムの修正 (opna側計算フレーム数のエラーによりブツブツ途切れた音になっていた)、線形補間に起因する折返し歪自体は修正されていません

ライセンスの事情でパッチのみの公開です。パッチ自体は MIT ライセンスです。

## ビルド方法
  bash, wget, 7z, sha256sum, dos2unix, patch, MinGW-w64 i686 gcc が必要です。
  Makefile は gcc が `i686-w64-mingw32-gcc` だと想定してあります。

  1. `git clone $このレポジトリ`
  1. `cd pmdwinbuild`
  1. `make -j$コア数とか`
  1. `pmdwin.dll` が `build/` 内に生成されます
