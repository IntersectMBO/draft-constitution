
## Delegate Endorsed Cardano Constitution - 2024-12-05

These resulting documents are from discussions on `2024-12-05` across the
Cardano Constitutional Convention.

Edits were made to the [2024-12-04 draft](../2024-12-04/) from delegate
discussions in addition to a few technical fixes, to reach this draft.
Which was then endorsed via on-chain vote.

### Files

- [Final raw document file](./cardano-constitution-1.txt)

- [Document converted to markdown (best for reading)](./draft-constitution-converted.md)

### File hosted

IPFS (URI that goes to chain): ipfs://bafkreiazhhawe7sjwuthcfgl3mmv2swec7sukvclu3oli7qdyz4uhhuvmy

IPFS with dweb gateway: https://bafkreiazhhawe7sjwuthcfgl3mmv2swec7sukvclu3oli7qdyz4uhhuvmy.ipfs.dweb.link

IPFS with ipfs.io gateway: https://ipfs.io/ipfs/bafkreiazhhawe7sjwuthcfgl3mmv2swec7sukvclu3oli7qdyz4uhhuvmy

IPFS with web3 storage gateway: https://bafkreiazhhawe7sjwuthcfgl3mmv2swec7sukvclu3oli7qdyz4uhhuvmy.ipfs.w3s.link

Github: https://raw.githubusercontent.com/IntersectMBO/draft-constitution/refs/heads/main/2024-12-05/cardano-constitution-1.txt

### Hash

BLAKE2b-256 hash digest (hash that goes on-chain):
`2a61e2f4b63442978140c77a70daab3961b22b12b63b13949a390c097214d1c5`

#### How-to Check the hash

##### Easy Way (no commandline)

Please see
[Instructions to **verify** the constitution hash](https://docs.google.com/document/d/1xmDkMrL6ebaLNBsysiNQrtABcVnYBmsteQQcsrzGOpo/edit?tab=t.0#heading=h.bxb46qftdspf).

##### Using command line

Using Cardano CLI, pull file from IPFS via dweb gateway.

```shell
cardano-cli hash anchor-data --url https://bafkreiazhhawe7sjwuthcfgl3mmv2swec7sukvclu3oli7qdyz4uhhuvmy.ipfs.dweb.link
```

Using Cardano CLI, pull file from github.

```shell
cardano-cli hash anchor-data --url https://raw.githubusercontent.com/IntersectMBO/draft-constitution/refs/heads/main/2024-12-05/cardano-constitution-1.txt
```

Using Cardano CLI, with local repo.

```shell
cardano-cli hash anchor-data --file-text ./2024-12-05/cardano-constitution-1.txt
```

Using pre-made [hashing script](../scripts/hash.sh) (which uses Cardano CLI and b2sum), with local repo.

```shell
./scripts/hash.sh ./2024-12-05/cardano-constitution-1.txt
```
