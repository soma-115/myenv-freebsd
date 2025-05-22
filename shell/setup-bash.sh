#!/usr/local/bin/bash

# 対象ファイル
FILES=(".bashrc" ".bash_profile")

# ホームディレクトリ
HOME_DIR="$HOME"

# カレントディレクトリ
CURRENT_DIR="$(pwd)"

# バックアップディレクトリ（カレントディレクトリの親ディレクトリに作成）
BACKUP_DIR="$(dirname "$CURRENT_DIR")/backup"

# バックアップディレクトリ作成
mkdir -p "$BACKUP_DIR"

for FILE in "${FILES[@]}"; do
    SRC="$CURRENT_DIR/$FILE"
    DEST="$HOME_DIR/$FILE"
    BACKUP="$BACKUP_DIR/${FILE}.old"

    if [ -f "$SRC" ]; then
        # 既存のファイルをバックアップ
        if [ -f "$DEST" ]; then
            mv "$DEST" "$BACKUP"
        fi

        # コピー実行
        cp "$SRC" "$DEST"
    fi
done
