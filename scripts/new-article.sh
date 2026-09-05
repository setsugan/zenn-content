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
