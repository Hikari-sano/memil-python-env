# memil-python-env

**日本語** | [English](#english)

---

# 日本語

## これは何ですか？

`memil-python-env` は、研究・開発で使うための **Windows用ポータブル Python / VS Code / AI 開発環境** です。

Pythonや仮想環境に詳しくない人でも、できるだけ迷わず使えるように、基本操作は `.bat` ファイルをダブルクリックする形にしています。

この環境では、Python本体として **WinPython** を使います。
Condaやuvは使いません。
AIモデルやツールごとに、WinPythonから専用の `.venv` を自動作成します。

```text
WinPythonのみ + AIごとの .venv
```

---

## 最初に覚えるファイル

基本的に、初心者が使う入口はこの5つです。

```text
WINPYTHON_SETUP.bat
Start.bat
AI_CATALOG.bat
ORGANIZE_FILES.bat
SHARE_ENV_TO_AI.bat
```

| ファイル | 何をするもの？ |
|---|---|
| `WINPYTHON_SETUP.bat` | WinPythonを入れる場所を作り、WinPythonが正しく配置されているか確認します。 |
| `Start.bat` | VS Codeと基本Pythonプロジェクトを起動します。最初に環境を準備するときに使います。 |
| `AI_CATALOG.bat` | YOLO、Whisper、Jupyter、numpy、FFmpegなどをメニューから導入・実行します。 |
| `ORGANIZE_FILES.bat` | 散らかったファイルを安全に整理します。削除はしません。 |
| `SHARE_ENV_TO_AI.bat` | エラーが出たときに、環境情報とファイル構造をAIや担当者へ共有するためのレポートを作ります。 |

---

## 導入手順：超初心者向け

### 手順1：GitHubからダウンロードする

Gitが分からない人は、以下の方法で大丈夫です。

1. GitHubのリポジトリページを開きます。
2. 緑色の `Code` ボタンを押します。
3. `Download ZIP` を押します。
4. ダウンロードしたZIPファイルを右クリックします。
5. `すべて展開` を押します。
6. 展開されたフォルダを開きます。

展開後、次のようなファイルが見えればOKです。

```text
WINPYTHON_SETUP.bat
Start.bat
AI_CATALOG.bat
ORGANIZE_FILES.bat
SHARE_ENV_TO_AI.bat
README.md
```

---

### 手順2：WinPythonを準備する

まず、以下をダブルクリックします。

```text
WINPYTHON_SETUP.bat
```

このファイルは、WinPythonの準備を手伝うための補助ツールです。
実行すると、次のことを行います。

1. `winpython/` フォルダを作ります。
2. WinPythonのダウンロードページを開きます。
3. WinPythonを `winpython/` に展開するよう案内します。
4. `winpython/WPy64-xxxx/python/python.exe` があるか確認します。

---

### 手順3：WinPythonをダウンロードする

開いたページから、Windows 64bit版のWinPythonをダウンロードしてください。

AI系ライブラリとの相性を考えると、可能なら **Python 3.12系のWinPython** をおすすめします。

---

### 手順4：WinPythonを `winpython/` に展開する

重要なのは、最終的なフォルダ構造です。

正しい例：

```text
memil-python-env/
└─ winpython/
   └─ WPy64-xxxx/
      └─ python/
         └─ python.exe
```

`Start.bat` は、この `python.exe` を探します。

間違った例：

```text
winpython/
└─ python.exe
```

```text
winpython/
└─ Downloads/
   └─ WPy64-xxxx/
      └─ python/
         └─ python.exe
```

---

### 手順5：WinPythonを確認する

WinPythonを展開したら、もう一度以下を実行してください。

```text
WINPYTHON_SETUP.bat
```

成功すると、WinPythonが見つかったことが表示されます。

---

### 手順6：基本環境を起動する

次に、以下をダブルクリックします。

```text
Start.bat
```

`Start.bat` は次のことを行います。

```text
1. winpython/ 内の python.exe を探す
2. VS Code ZIP版を準備する
3. projects/hello-python を作る
4. hello-python 用の .venv を作る
5. VS Codeを起動する
```

初回は数分かかることがあります。
黒い画面が出ても、閉じずに待ってください。

---

### 手順7：AIカタログを開く

次に、以下をダブルクリックします。

```text
AI_CATALOG.bat
```

以下のようなメニューが表示されます。

```text
1. YOLO / Ultralytics
2. Whisper
3. Hugging Face Transformers
4. SAM / Segment Anything
5. Diffusers
6. Jupyter / JupyterLab
7. Common Python packages
8. FFmpeg
9. Open projects folder
10. Exit
```

数字を入力して `Enter` を押します。

---

## 最初に試すおすすめ：YOLO

### YOLOとは？

YOLOは、画像の中にある人・車・物などを見つけるためのAIです。
最初の動作確認におすすめです。

### YOLOを導入する

1. `AI_CATALOG.bat` をダブルクリックします。
2. `1. YOLO / Ultralytics` を選びます。
3. `1. Install / Update` を選びます。
4. インストールが終わるまで待ちます。

### YOLOを実行する

インストール後、同じYOLOメニューで次を選びます。

```text
2. Run sample
```

成功すると、以下の画像が作られます。

```text
projects/yolo-sample/yolo_result.jpg
```

この画像ができていれば、YOLOの導入と実行は成功です。

---

## Jupyterを使う

JupyterLabを使う場合は、`AI_CATALOG.bat` で以下を選びます。

```text
6. Jupyter / JupyterLab
```

導入：

```text
1. Install / Update
```

起動：

```text
2. Start JupyterLab
```

ノートブック用フォルダ：

```text
projects/jupyter-sample/notebooks/
```

---

## numpyなどの基本パッケージを入れる

`numpy`、`pandas`、`matplotlib` などをまとめて入れたい場合は、`AI_CATALOG.bat` で以下を選びます。

```text
7. Common Python packages
```

導入される主なパッケージ：

```text
numpy
pandas
matplotlib
scipy
scikit-learn
pillow
opencv-python
jupyter
ipykernel
openpyxl
tqdm
seaborn
```

---

## FFmpegを入れる

FFmpegは、音声・動画処理に使う外部ツールです。
Whisperで音声ファイルを扱う場合などに必要になることがあります。

`AI_CATALOG.bat` で以下を選びます。

```text
8. FFmpeg
```

その中で、以下を選びます。

```text
1. Check / Install FFmpeg with winget
```

インストール後、確認する場合：

```text
2. Check FFmpeg version
```

---

## ファイル整理をする

ファイル整理が苦手な人は、以下をダブルクリックしてください。

```text
ORGANIZE_FILES.bat
```

このファイルは、研究用フォルダを自動で作り、ルート直下に置かれたファイルを安全に整理します。

作られる主なフォルダ：

```text
projects/
├─ _inbox/
├─ _shared/
│  ├─ data/
│  │  ├─ raw/
│  │  └─ processed/
│  ├─ outputs/
│  ├─ notebooks/
│  ├─ scripts/
│  ├─ docs/
│  ├─ figures/
│  ├─ tables/
│  ├─ audio/
│  ├─ video/
│  └─ images/
└─ _archive/
```

ルート直下に置かれたCSV、画像、PDF、ノートブック、音声ファイルなどは、以下に移動されます。

```text
projects/_inbox/YYYY-MM-DD/
```

重要な環境フォルダやスクリプトは動かしません。
ファイルは削除しません。

初心者向けルール：

```text
どこに置けばいいか分からないファイルは、あとで ORGANIZE_FILES.bat を押せば整理されます。
```

---

## VS Codeでの注意

VS Code右上の再生ボタンを押すと、意図しないPython環境で実行される場合があります。

初心者は、まず `AI_CATALOG.bat` の中の `Run sample` を使ってください。

慣れてきたら、各プロジェクト内の `.vscode/settings.json` や `.venv` を使って、VS Codeから直接実行できます。

---

## エラーが出たとき

エラーが出ても、黒い画面をすぐ閉じないでください。

次の手順を行ってください。

1. 黒い画面のエラー文をコピーします。
2. 以下をダブルクリックします。

```text
SHARE_ENV_TO_AI.bat
```

3. `env_reports/` フォルダが開きます。
4. 以下のファイルが作られます。

```text
AI_prompt_日時.txt
env_report_日時.txt
file_tree_日時.txt
```

5. `AI_prompt_日時.txt` を開きます。
6. 困っている内容を書き足します。
7. AIまたは担当者に共有します。

`env_report` には環境情報が、`file_tree` にはファイル構造が入ります。
ファイルの中身は収集しませんが、ファイル名やフォルダ名は含まれるので、外部共有前に確認してください。

---

## GitHubに上げないもの

以下はPC上に自動生成されるものなので、GitHubには上げません。

```text
winpython/
vscode/
python/
cache/
models/
env_reports/
logs/
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

## 旧環境を使っている人

### Gitで入れた人

PowerShellで環境フォルダを開き、以下を実行します。

```powershell
git pull
```

その後、以下を順番に実行します。

```text
WINPYTHON_SETUP.bat
Start.bat
AI_CATALOG.bat
```

### Download ZIPで入れた人

1. GitHubから最新版ZIPをもう一度ダウンロードします。
2. ZIPを展開します。
3. `WINPYTHON_SETUP.bat` を実行します。
4. WinPythonを `winpython/` に展開します。
5. `Start.bat` を実行します。
6. `AI_CATALOG.bat` を実行します。

古い環境で作業したファイルを残したい場合は、古いフォルダの `projects/` を新しいフォルダへコピーしてください。

---

## よくある質問

### Condaは使っていますか？

使っていません。

```text
Conda: 使わない
uv: 使わない
WinPython: 使う
```

### Pythonを自分でインストールする必要はありますか？

通常のPythonインストーラーで入れる必要はありません。
WinPythonを `winpython/` に展開します。

### どのファイルから始めればいいですか？

最初はこの順番です。

```text
WINPYTHON_SETUP.bat
Start.bat
AI_CATALOG.bat
```

ファイルが散らかったら：

```text
ORGANIZE_FILES.bat
```

エラーが出たら：

```text
SHARE_ENV_TO_AI.bat
```

---

# English

## What is this?

`memil-python-env` is a **portable Python / VS Code / AI development environment** for Mimel Lab / Memil Lab.

It is designed so that beginners can start research and development mostly by double-clicking `.bat` files.

This environment uses **WinPython** as the only base Python runtime.
It does not use Conda or uv.
Each AI tool creates its own `.venv` from WinPython.

```text
WinPython only + one .venv per AI tool
```

---

## Main entry files

```text
WINPYTHON_SETUP.bat
Start.bat
AI_CATALOG.bat
ORGANIZE_FILES.bat
SHARE_ENV_TO_AI.bat
```

| File | Purpose |
|---|---|
| `WINPYTHON_SETUP.bat` | Helps place and check WinPython. |
| `Start.bat` | Sets up VS Code and the basic Python project. |
| `AI_CATALOG.bat` | Installs and runs AI tools such as YOLO, Whisper, Jupyter, numpy, and FFmpeg. |
| `ORGANIZE_FILES.bat` | Safely organizes loose files and creates a research folder layout. |
| `SHARE_ENV_TO_AI.bat` | Creates environment and file-tree reports for troubleshooting. |

---

## Beginner setup steps

### Step 1: Download this repository

If you do not know Git, use Download ZIP.

1. Open the GitHub repository page.
2. Click the green `Code` button.
3. Click `Download ZIP`.
4. Right-click the downloaded ZIP file.
5. Click `Extract All`.
6. Open the extracted folder.

---

### Step 2: Set up WinPython

Double-click:

```text
WINPYTHON_SETUP.bat
```

This helper:

1. Creates the `winpython/` folder.
2. Opens the WinPython download page.
3. Guides you to extract WinPython into `winpython/`.
4. Checks whether `winpython/WPy64-xxxx/python/python.exe` exists.

Expected layout:

```text
memil-python-env/
└─ winpython/
   └─ WPy64-xxxx/
      └─ python/
         └─ python.exe
```

---

### Step 3: Start the environment

Double-click:

```text
Start.bat
```

This checks WinPython, prepares VS Code, creates `projects/hello-python`, and opens VS Code.

---

### Step 4: Open the AI catalog

Double-click:

```text
AI_CATALOG.bat
```

Menu:

```text
1. YOLO / Ultralytics
2. Whisper
3. Hugging Face Transformers
4. SAM / Segment Anything
5. Diffusers
6. Jupyter / JupyterLab
7. Common Python packages
8. FFmpeg
9. Open projects folder
10. Exit
```

---

## Recommended first test: YOLO

1. Double-click `AI_CATALOG.bat`.
2. Select `1. YOLO / Ultralytics`.
3. Select `1. Install / Update`.
4. Wait until installation completes.
5. Select `2. Run sample`.

If successful, this file is created:

```text
projects/yolo-sample/yolo_result.jpg
```

---

## Jupyter

Select:

```text
6. Jupyter / JupyterLab
```

Install:

```text
1. Install / Update
```

Start:

```text
2. Start JupyterLab
```

Notebook folder:

```text
projects/jupyter-sample/notebooks/
```

---

## Common Python packages

Select:

```text
7. Common Python packages
```

This installs common packages such as:

```text
numpy
pandas
matplotlib
scipy
scikit-learn
opencv-python
jupyter
openpyxl
```

---

## FFmpeg

Select:

```text
8. FFmpeg
```

FFmpeg is used for audio and video processing. It may be required by Whisper.

---

## File organization

If files become messy, double-click:

```text
ORGANIZE_FILES.bat
```

It creates a clean research folder layout under `projects/` and moves loose user files from the root folder into:

```text
projects/_inbox/YYYY-MM-DD/
```

It does not delete files.
It does not move important environment folders such as `tools/`, `docs/`, `projects/`, `vscode/`, or `winpython/`.

---

## When an error occurs

Do not close the black console window immediately.

1. Copy the error message.
2. Double-click:

```text
SHARE_ENV_TO_AI.bat
```

3. Open the `env_reports/` folder.
4. Share these files with AI or lab support if needed:

```text
AI_prompt_timestamp.txt
env_report_timestamp.txt
file_tree_timestamp.txt
```

---

## Files not committed to GitHub

```text
winpython/
vscode/
python/
cache/
models/
env_reports/
logs/
projects/*/.venv/
projects/**/runs/
*.pt
*.pth
*.onnx
*.safetensors
*.ckpt
*.bin
```
