# GitHub運用メモ

## 推奨運用

このリポジトリは「環境構築スクリプト」を配布するためのものです。
VS Code本体やPython本体は、GitHubリポジトリに含めず、初回実行時に公式配布元からダウンロードします。

## 理由

- VS Code本体やPython本体はサイズが大きい
- Gitリポジトリに大きなバイナリを入れるとcloneが遅くなる
- 更新時に差分管理が効きにくい
- 研究室メンバー全員のclone負荷が大きくなる

## リポジトリ作成後の手順

```powershell
git init
git add .
git commit -m "Initial PyDevCatalog lab setup"
git branch -M main
git remote add origin https://github.com/YOUR_ORG/YOUR_REPO.git
git push -u origin main
```

## 学生向け案内文

```text
1. GitHubからこのリポジトリをZIPでダウンロードしてください。
2. 展開したフォルダ内の Start.bat を実行してください。
3. 初回だけVS Code、Python、拡張機能の導入に時間がかかります。
4. VS Codeが開いたら、projects/hello-python/main.py を実行してください。
```

## 更新方針

- スクリプトやテンプレートを更新したら通常のGit pushで共有
- VS Code本体の更新機能は将来 `tools/update-vscode.ps1` として追加予定
- Pythonパッケージの標準セットは `catalog/catalog.json` または `requirements-lab.txt` に寄せる
