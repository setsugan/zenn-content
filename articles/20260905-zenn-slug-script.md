---
title: "Zenn CLIのSlug命名を自動化する"
emoji: "🐺"
type: "tech" # tech: 技術記事 / idea: アイデア
topics: ["Zenn"]
published: false
---

## はじめに

Zenn のすべての記事には `slug` とよばれる固有の id が割り当てられており、CLI の場合それを指定できます。ところがこの `slug` は名前の重複や、あとから変更することが認められていないため、その命名には悩まされるところがあります。

そこで今回の記事では自動的に `slug` を命名するスクリプトを作ってみました。

## slugのスタイル

今回は `slug` に日付とブランチ名を含めることにしました。

```text
// 日付-ブランチ名
20260905-zenn-slug-script
```

Zenn はデフォルトブランチからブランチを切って PR を立てることで、下書きの記事としてデプロイされる機能があります。今回の命名はその方針にも合っていると言えるでしょう。

## スクリプト

以下のコードを `zenn-content` などの Zenn と接続したリポジトリの直下に、 `scripts/new-article.sh` として保存してください。

```sh : scripts/new-article.sh
#!/usr/bin/env bash

#
#    エラーで終了する設定
#

set -euo pipefail

#
#    現在のブランチ名を取得
#

CURRENT_BRANCH_NAME="$(git branch --show-current)"

#
#    mainでの記事作成を禁止
#

if [[ "${CURRENT_BRANCH_NAME}" == "main" ]]; then
    echo "You cannot create articles in the main branch."
    exit 1
fi

#
#    現在の日付を取得
#

DATE="$(date +%Y%m%d)"

#
#    slugを作成
#

SLUG="${DATE}-${CURRENT_BRANCH_NAME}"

#
#    slugの形式を確認
#

if [[ ! "${SLUG}" =~ ^[a-z0-9_-]{12,50}$ ]]; then
    echo "Invalid slug: ${SLUG}"
    exit 1
fi

#
#    slugが重複していないか確認
#

if [[ -e "articles/${SLUG}.md" ]]; then
    echo "Already exists: articles/${SLUG}.md"
    exit 1
fi

#
#    記事の作成
#

echo "Creating article"
echo "  branch: ${CURRENT_BRANCH_NAME}"
echo "  slug:   ${SLUG}"
echo ""

npx zenn new:article --slug "$SLUG"

```

使用するには実行権限を付与する必要があります。

```bash
chmod +x scripts/new-article.sh
```

## 実際に使ってみる

ブランチを切ります。

```bash
git checkout -b zenn-slug-script
```

記事を作成します。
ここで適切な `slug` が自動的に設定されます。

```bash
npm run new:article
```

```text
> zenn-content@1.0.0 new:article
> ./scripts/new-article.sh

Creating article
  branch: zenn-slug-script
  slug:   20260905-zenn-slug-script

created: articles/20260905-zenn-slug-script.md
```

記事が作られたことを確認します。

```bash
ls articles/
```

```text
20260905-zenn-slug-script.md
```

## さいごに

今回は自動的に `slug` を指定するスクリプトを作ってみました。
まだ `book` の作成には対応できていなかったり、`master` ブランチに対応できていなかったりするので各自で修正して使うのが良いかと思われます。

## おまけ

ハートを押してくれると筆者がめっちゃよろこびます ヽ(o´∀`)ﾉ♪
あと、コメントでアドバイスくれるとうれしいです！
