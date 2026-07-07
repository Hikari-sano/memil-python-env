# PyDevCatalog for Lab

研究室メンバー全員が、GitHubから同じ Python + VS Code ポータブル開発環境を構築するためのスターターです。

## 目的

- Windows PCにVS CodeやPythonを個別インストールしなくても使えるようにする
- 研究室メンバー全員でPythonバージョン、VS Code拡張、初期設定を揃える
- 新入生が `git clone` またはZIPダウンロード後に `Start.bat` を押すだけで始められるようにする

## 初回セットアップ

### 方法A: Gitが使える場合

```powershell
git clone https://github.com/YOUR_ORG/YOUR_REPO.git
cd YOUR_REPO
.\Start.bat
```

### 方法B: Gitが使えない場合

1. GitHubのリポジトリページを開く
2. `Code` → `Download ZIP`
3. ZIPを展開
4. `Start.bat` を実行

## 初回実行時に作成されるもの

```text
vscode/              # VS Code ZIP版。Git管理しない
vscode/data/         # VS Codeポータブルモード用データ
python/              # uv と uv管理Python。Git管理しない
cache/               # ダウンロードキャッシュ。Git管理しない
projects/hello-python # サンプルプロジェクト
```

## 管理者・運用者向け

### GitHubに置くもの

GitHubリポジトリには、以下だけを置きます。

- `Start.bat`
- `tools/bootstrap.ps1`
- `catalog/catalog.json`
- `catalog/templates/`
- `README.md`
- `.gitignore`

VS Code本体、Python本体、`.venv`、キャッシュはGitHubに置きません。初回起動時に取得します。

### VS Code拡張機能を増やす

`tools/bootstrap.ps1` の `$Extensions` に拡張機能IDを追加してください。

例:

```powershell
$Extensions = @(
    "ms-ceintl.vscode-language-pack-ja",
    "ms-python.python",
    "ms-python.vscode-pylance",
    "ms-python.debugpy",
    "charliermarsh.ruff",
    "ms-toolsai.jupyter"
)
```

### Pythonバージョンを変える

`tools/bootstrap.ps1` 内の `3.12` を変更してください。

```powershell
& $UvExe python install 3.12
& $UvExe venv (Join-Path $HelloDir ".venv") --python 3.12
```

### 研究室用パッケージを自動導入する

`tools/bootstrap.ps1` の `.venv` 作成後に、以下のように追加できます。

```powershell
& $UvExe pip install --python (Join-Path $HelloDir ".venv\Scripts\python.exe") numpy pandas matplotlib scipy jupyter
```

## 注意

- 初回実行時はインターネット接続が必要です。
- VS Code ZIP版は自動更新されません。
- 大きなバイナリをGitリポジトリにコミットしないでください。
- 研究室のプロキシ環境では、PowerShellの `Invoke-WebRequest` や `Invoke-RestMethod` が失敗する場合があります。

## トラブルシュート

### PowerShellの実行がブロックされる

`Start.bat` は `-ExecutionPolicy Bypass` を付けて起動しますが、学校・研究室PCのポリシーで禁止されている場合があります。管理者に確認してください。

### VS Code拡張機能の導入に失敗する

ネットワーク制限が原因のことがあります。VS Code起動後、拡張機能画面から手動で導入してください。

### リポジトリが大きくなりすぎた

`vscode/`, `python/`, `cache/`, `.venv/` がGit管理に入っていないか確認してください。
