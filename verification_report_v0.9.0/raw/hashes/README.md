# hashes — source vs. destination / ハッシュ（コピー元 vs コピー先）

Per-file checksums. For a correct copy, every source hash equals its destination hash.

全ファイルのチェックサム。正しいコピーなら、各ファイルのコピー元とコピー先のハッシュは一致します。

| File | What it is | 説明 |
|---|---|---|
| `source_xxh128.tsv` / `dest_xxh128.tsv` | XXH3-128 of every file (source / destination) | 全ファイルの XXH3-128（元 / 先） |
| `source_sha256.tsv` / `dest_sha256.tsv` | SHA-256 of every file (source / destination) | 全ファイルの SHA-256（元 / 先） |
| `hashdeep_source_manifest.txt` | hashdeep manifest of the source set | hashdeep による元のマニフェスト |
| `hashdeep_audit.txt` | hashdeep audit: source vs. destination | hashdeep の監査（元 vs 先） |
