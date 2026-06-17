# corruption — detection test / 破損検出テスト

Files are deliberately damaged, then every tool must catch every corruption.

ファイルをわざと壊し、各ツールが全件を検出できるかを確認します。

| File | What it is | 説明 |
|---|---|---|
| `corruption_plan.tsv` | which files were damaged, and how (byte-flip / truncate / append) | どのファイルをどう壊したか（byte-flip / truncate / append） |
| `corruption_matrix.tsv` | which tool detected which corruption | どのツールがどの破損を検出したか |
