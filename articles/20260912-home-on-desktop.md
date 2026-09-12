---
title: "UbuntuのデスクトップにHomeの中身を表示する"
emoji: "💭"
type: "tech" # tech: 技術記事 / idea: アイデア
topics: ["ubuntu"]
published: true
---

## はじめに

Ubuntu の Desktop ディレクトリを使ったことがありません。
デスクトップの画面がもったいないので、Home の中身をデスクトップに表示させます。

## 手順

設定を開きます。

```bash
nano ~/.config/user-dirs.dirs
```

次のように修正します。

```diff bash
# This file is written by xdg-user-dirs-update
# If you want to change or add directories, just edit the line you're
# interested in. All local changes will be retained on the next run.
# Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
# homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
# absolute path. No other format is supported.
#
-XDG_DESKTOP_DIR="$HOME/Desktop"
+XDG_DESKTOP_DIR="$HOME"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_TEMPLATES_DIR="$HOME/Templates"
XDG_PUBLICSHARE_DIR="$HOME/Public"
XDG_DOCUMENTS_DIR="$HOME/Documents"
XDG_MUSIC_DIR="$HOME/Music"
XDG_PICTURES_DIR="$HOME/Pictures"
XDG_VIDEOS_DIR="$HOME/Videos"
```

保存して終了します。
一旦ログアウトして、ログインし直してください。

すると、home の中身がデスクトップに表示されます。

![デスクトップに表示された](/images/desktop.png)

## さいごに

戻したい場合は、設定をもとに戻して再度ログインし直してください。
