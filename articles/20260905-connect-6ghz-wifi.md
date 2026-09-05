---
title: "Ubuntu24.04で6GHzに接続する"
emoji: "🐺"
type: "tech" # tech: 技術記事 / idea: アイデア
topics: [6ghz]
published: true
---

## はじめに

6GHz 対応デバイスでも 6Ghz に接続できない場合があります。
今回はその場合の対処方法について簡単にまとめておきます。

## 解決策

:::message

これで必ず解決するわけではありません。

:::

`iw` をインストールします。

```bash
sudo apt update
sudo apt install iw
```

国を日本に設定する。

```bash
sudo iw reg set JP
```

`wifi` をもう 1 回調べる。

```bash
nmcli device wifi rescan
```

接続可能な `wifi` を確認する。

```bash
nmcli decice wifi list
```

お好きな `wifi` に接続する。

```bash
nmcli device wifi connect "SSID"
```

## 補足

6Ghz 帯が `wifi` で使用できるように許可されたのは日本だと 2022 年の 9 月のことです。
デフォルトではどの国の法律にも違法しないようにきびしめに使える周波数帯が設定されているらしいので、ここは日本だよと教えてあげることで使えるようになります。

## さいごに

去年の交流ロボコンのときに教えていただいたものです。
つながってよかった。

## おまけ

ハートを押してくれると筆者がめっちゃよろこびます ヽ(o´∀`)ノ♪
あと、コメントでアドバイスくれるとうれしいです！

---
title: "Ubuntu24.04で6GHzに接続する"
emoji: "🐺"
type: "tech" # tech: 技術記事 / idea: アイデア
topics: [6ghz]
published: true
---

## はじめに

6GHz 対応デバイスでも 6Ghz に接続できない場合があります。
今回はその場合の対処方法について簡単にまとめておきます。

## 解決策

:::message

これで必ず解決するわけではありません。

:::

`iw` をインストールします。

```bash
sudo apt update
sudo apt install iw
```

国を日本に設定する。

```bash
sudo iw reg set JP
```

`wifi` をもう 1 回調べる。

```bash
nmcli device wifi rescan
```

接続可能な `wifi` を確認する。

```bash
nmcli decice wifi list
```

お好きな `wifi` に接続する。

```bash
nmcli device wifi connect "SSID"
```

## 補足

6Ghz 帯が `wifi` で使用できるように許可されたのは日本だと 2022 年の 9 月のことです。
デフォルトで使える周波数帯は世界共通の制限が厳しい設定なので、ここは日本だよと教えてあげることで 6GHz 帯も使えるようになります。

## さいごに

去年の交流ロボコンのときに教えていただいたものです。
つながってよかった。

## おまけ

ハートを押してくれると筆者がめっちゃよろこびます ヽ(o´∀`)ノ♪
あと、コメントでアドバイスくれるとうれしいです！
