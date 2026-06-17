# Raw verification logs / 生の検証ログ

Unedited tool output from the independent verification run. These are the source files behind [`../REPORT.html`](../REPORT.html); the machine-readable summary of truth is [`../report.json`](../report.json). Everything here was generated on public CI (GitHub Actions).

第三者検証ランの **無加工** の出力です。レポート本体は [`../REPORT.html`](../REPORT.html)、機械可読の正本は [`../report.json`](../report.json)。すべて GitHub Actions（公開CI）で生成しています。

## Folders / フォルダ

| Folder | What it holds | 内容 |
|---|---|---|
| [`hashes/`](hashes/) | Per-file hashes; source must equal destination | 全ファイルのハッシュ（コピー元＝コピー先のはず） |
| [`tools/`](tools/) | Independent third-party tool checks | 第三者ツールによる独立照合 |
| [`corruption/`](corruption/) | Deliberate-corruption detection test | わざと壊して検出できるかのテスト |
| [`environment/`](environment/) | Run environment & report integrity check | 実行環境とレポートの整合性チェック |
