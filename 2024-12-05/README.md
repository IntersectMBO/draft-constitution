
## Delegate Endorsed Cardano Constitution - 2024-12-05

These resulting documents are from discussions on `2024-12-05` across the
Cardano Constitutional Convention.

Edits were made to the [2024-12-04 draft](../2024-12-04/) from delegate
discussions in addition to a few technical fixes, to reach this draft.
Which was then endorsed via on-chain vote.

### Files

- [Final raw document file](./cardano-constitution.txt)

- [Document converted to markdown (best for reading)](./draft-constitution-converted.md)

### Hash

BLAKE2b-256 hash digest:
`2a61e2f4b63442978140c77a70daab3961b22b12b63b13949a390c097214d1c5`

#### How-to Check the hash

##### Easy Way

Please see
[Instructions to **verify** the constitution hash](https://docs.google.com/document/d/1xmDkMrL6ebaLNBsysiNQrtABcVnYBmsteQQcsrzGOpo/edit?tab=t.0#heading=h.bxb46qftdspf).

##### CLI Way

Using straight Cardano CLI pull from repo (no repo cloning needed).

```shell
cardano-cli hash anchor-data --url https://raw.githubusercontent.com/IntersectMBO/draft-constitution/refs/heads/main/2024-12-05/cardano-constitution-1.txt
```

Using Cardano CLI with local repo.

```shell
cardano-cli hash anchor-data --file-text ./2024-12-05/cardano-constitution-1.txt
```

Using hashing script (which uses Cardano CLI and b2sum).

```shell
./scripts/hash.sh ./2024-12-05/cardano-constitution-1.txt
```
