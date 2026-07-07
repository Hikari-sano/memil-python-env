# Mimel Lab Python / AI Environment

日本語 | [English](#english)

---

## 日本語

## 概要

このリポジトリは、Mimel Lab向けの **ポータブルPython / VS Code / AI開発環境** です。

初心者が迷わないように、ルート直下の入口はできるだけ少なくしています。

基本的に使うファイルは次の3つです。

```text
Start.bat
AI_CATALOG.bat
SHARE_ENV_TO_AI.bat
```

---

## 最初に使う手順

### 1. 基本環境を作る

```text
Start.bat
```

をダブルクリックします。

初回はVS Code、Python、uvなどの準備に数分かかります。

---

### 2. AIモデルを使う

```text
AI_CATALOG.bat
```

をダブルクリックします。

メニューから使いたいAIを選びます。

```text
1. YOLO / Ultralytics
2. Whisper
3. Hugging Face Transformers
4. SAM / Segment Anything
5. Diffusers
```

各AIの中で、次の操作を選べます。

```text
Install / Update
Run sample
Open project folder
```

---

## YOLOを試す例

1. `AI_CATALOG.bat` をダブルクリック
2. `1. YOLO / Ultralytics` を選ぶ
3. `1. Install / Update` を選ぶ
4. インストール完了後、`2. Run sample` を選ぶ
5. `projects/yolo-sample/yolo_result.jpg` が作られれば成功

---

## VS Codeでの注意

VS Code右上の再生ボタンは、違うPython環境を使ってしまうことがあります。
初心者は、まず `AI_CATALOG.bat` の `Run sample` を使ってください。

---

## 環境情報をAIに共有する

エラーが出た場合は、以下をダブルクリックします。

```text
SHARE_ENV_TO_AI.bat
```

以下が作られます。

```text
env_reports/AI_prompt_日時.txt
env_reports/env_report_日時.txt
env_reports/file_tree_日時.txt
```

AIに相談するときは、まず `AI_prompt_日時.txt` の内容を貼り付けてください。
必要に応じて `env_report_日時.txt` と `file_tree_日時.txt` も共有してください。

---

## GitHubに上げないもの

```text
vscode/
python/
cache/
models/
env_reports/
projects/*/.venv/
projects/**/runs/
*.pt
*.pth
*.onnx
*.safetensors
*.ckpt
*.bin
```

---

## 旧環境を使っている場合

Gitでcloneした人:

```powershell
git pull
Start.bat
AI_CATALOG.bat
```

Download ZIPで入れた人:

1. 最新版ZIPをダウンロード
2. ZIPを展開
3. `Start.bat` を実行
4. `AI_CATALOG.bat` を実行

---

# English

## Overview

This repository provides a **portable Python / VS Code / AI development environment** for Mimel Lab.

To avoid confusion for beginners, the root folder has only a few main entry points.

Use these files first:

```text
Start.bat
AI_CATALOG.bat
SHARE_ENV_TO_AI.bat
```

---

## Getting Started

### 1. Set up the base environment

Double-click:

```text
Start.bat
```

The first run may take several minutes because it prepares VS Code, Python, and uv.

---

### 2. Use AI tools

Double-click:

```text
AI_CATALOG.bat
```

Select an AI tool from the menu.

```text
1. YOLO / Ultralytics
2. Whisper
3. Hugging Face Transformers
4. SAM / Segment Anything
5. Diffusers
```

Each tool has a submenu.

```text
Install / Update
Run sample
Open project folder
```

---

## YOLO Example

1. Double-click `AI_CATALOG.bat`
2. Select `1. YOLO / Ultralytics`
3. Select `1. Install / Update`
4. After installation, select `2. Run sample`
5. If `projects/yolo-sample/yolo_result.jpg` is created, it worked

---

## VS Code Note

The Run button in VS Code may use the wrong Python environment.
Beginners should use `Run sample` from `AI_CATALOG.bat` first.

---

## Share Environment Information with AI

If an error occurs, double-click:

```text
SHARE_ENV_TO_AI.bat
```

It creates:

```text
env_reports/AI_prompt_timestamp.txt
env_reports/env_report_timestamp.txt
env_reports/file_tree_timestamp.txt
```

Paste `AI_prompt_timestamp.txt` to AI first.
Share `env_report_timestamp.txt` and `file_tree_timestamp.txt` if needed.
