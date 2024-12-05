
## 2024-12-05 Cardano Constitution Draft

Resulting document from discussions on `2024-12-05`.
Edits were made to the [2024-12-04 draft](../2024-12-04/).

The constitution drafting is being done via a word processing tool.
The text is then exported into PDF files.
We take the PDF and convert to CIP-120 complaint documents containing markdown text styling.

### Files

#### Raw files

- [Draft converted to markdown](./draft-constitution-converted.md)
- [Draft converted to markdown text file](./draft-constitution-converted.md.txt)

#### PDFs

- [Draft PDF file](./draft-constitution.pdf)

### Hash

BLAKE2b-256 hash digest: `2a61e2f4b63442978140c77a70daab3961b22b12b63b13949a390c097214d1c5`

#### How-to

```shell
cardano-cli hash anchor-data --url https://raw.githubusercontent.com/IntersectMBO/draft-constitution/refs/heads/main/2024-12-05/cardano-constitution-1.txt
```

or

```shell
./scripts/hash.sh ./2024-12-05/cardano-constitution-1.txt
```