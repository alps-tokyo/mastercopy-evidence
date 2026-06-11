# Master Copy — Independent Verification Evidence

Proof that [Master Copy](https://mastercopy.alps.tokyo) copies your files **correctly**, checked **with independent third-party tools — not by Master Copy itself**. Verified on every release and published here.

> 🇯🇵 [Master Copy](https://mastercopy.alps.tokyo) が「正しくコピーできている」ことを、**Master Copy 自身を使わず、独立した第三者の検証ツールで確認した記録**です。リリースごとに検証し、ここに公開します。

---

## An impartial test — by design

This check is built so it **cannot be rigged to pass**. The verdict is not ours to give — it comes from independent tools, on data anyone can regenerate, and it is designed to **fail when a copy is wrong**.

- **An impartial judge** — pass/fail is decided by an unrelated, independent third-party tool ([hashdeep](https://github.com/jessek/hashdeep)), not by Master Copy. We do not grade our own work.
- **A different yardstick** — files are re-checked with **SHA-256**, a different algorithm from the xxHash that Master Copy uses internally. We do not measure with our own ruler.
- **Built to fail when wrong** — a deliberately corrupted file *must* be caught: the audit reports a mismatch and the gate fails. This is a test that *can* fail, not one rigged to always print "100%".
- **Nothing hidden** — the raw logs, the scripts, and the data-generation steps are all public. Anyone can re-run the check and try to prove it wrong.
- **Tamper-evident** — every report is SHA-256 signed, so any later edit is detectable.

> 🇯🇵 **不正に「合格」できないよう設計された、公平な検査です。** 合否を決めるのは私たちではなく、独立したツールと、誰でも再生成できるデータ。そして**コピーが間違っていれば落ちる**ように作られています。
> - **中立な判定者** — 合否は無関係な独立した第三者ツール（hashdeep）が決める。売り手が自分の仕事を採点しない。
> - **別のものさし** — 内部の xxHash とは違う **SHA-256** で測り直す。自分のものさしで測らない。
> - **間違っていれば落ちる設計** — わざと壊したファイルは必ず検出され、不一致としてゲートが落ちる。常に「100%」と出す検査ではなく、*落ちうる*検査。
> - **隠さない** — 生ログ・スクリプト・データ生成手順をすべて公開。誰でも再実行し、反証を試せる。
> - **改竄を検出** — 各レポートは SHA-256 署名付きで、後からの編集を検出できる。

---

## Repository layout

```
verification_report_<version>/
├── REPORT.html            # One-page result — start here
├── report.json            # Machine-readable details + SHA-256 signature
├── verify_signature.sh    # Tamper check (jq + shasum)
├── verification_guide.md  # How to verify it yourself
├── README.md              # Summary for that version
└── raw/                   # Raw logs (hashdeep audit, corruption test, environment…)
```

| Version | Notes |
|---|---|
| `verification_report_v1` | First release (independent check via xxhsum, ~141 GB real footage) |
| `verification_report_v0.9.0` | Updated to hashdeep `-audit` as the primary check (publishing in progress) |

> 🇯🇵 `REPORT.html`＝ペラ一の結果（まずこれ）／`report.json`＝詳細＋署名／`raw/`＝生ログ。バージョンごとに `verification_report_<version>/` に置きます。

---

## Verify it yourself

Don't take our word for it — reproduce it.

**1. Is the report untampered?**
```bash
cd verification_report_<version>
bash verify_signature.sh        # "Signature valid" = not tampered
```

**2. What was actually verified?**
```bash
jq '.independent_audit, .corruption_detection, .signature' report.json
# independent_audit.mismatch == 0   -> every file matched, per a third-party tool
# corruption_detection              -> proof that corruption is caught
```

`raw/` contains every original log (the full hashdeep audit output, etc.), unedited.

> 🇯🇵 鵜呑みにせず、自分で再現してください。①`verify_signature.sh` で改竄チェック（"Signature valid" なら未改竄）。②`report.json` の `independent_audit.mismatch == 0` が「第三者ツールで全ファイル一致」。`raw/` に未編集の全元ログ。

---

## What is / isn't verified

- ✅ **Integrity** — an independent third-party tool re-hashes every file with a different algorithm and finds no mismatch.
- ✅ **Corruption detection** — a file deliberately damaged *in the copy path* is caught and reported (originals are never altered).
- ✅ **MHL validity** — generated MHL is validated with the official implementation ([ascmhl](https://github.com/ascmitc/mhl)).
- ⚠️ Copy and verification are **not perfectly simultaneous** — verification trails the copy (most tools verify *after* copying; Master Copy verifies *as* it copies).
- ℹ️ The product's source is closed (commercial), so this evidence verifies the **released product, not the code**. That is exactly why the test is built to be independent: because the judge, the algorithm, and the data are all external and public, the result stands on its own — not on trusting us.

> 🇯🇵 ✅完全性（独立した第三者ツールが別アルゴで全照合・不一致なし）／✅破損検出（コピー経路で壊したファイルを検出・原本は壊さない）／✅MHL妥当性（公式実装ascmhlで検証）。⚠️コピーと検証は**完全な同時ではなく追走**（多くのツールはコピー後検証）。ℹ️本体ソースは商用のため非公開なので、この記録は**製品（リリースビルド）**を検証します。だからこそ検査を独立に作っている — 判定者・アルゴリズム・データがすべて外部で公開だから、結果は私たちを信用するかどうかに依存しません。

---

## Third-party tools used

- [hashdeep / md5deep](https://github.com/jessek/hashdeep) — SHA-256 manifest audit (primary independent check)
- [xxHash / xxhsum](https://github.com/Cyan4973/xxHash) — hash cross-check
- [rsync](https://github.com/RsyncProject/rsync) — difference check
- [ascmhl](https://github.com/ascmitc/mhl) — ASC MHL official reference implementation

---

*Master Copy — "Faster than Finder, Safer than Fort Knox."*
