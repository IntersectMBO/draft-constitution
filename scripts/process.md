
## Run scripts

### 1. PDF -> Txt

Set the datalab API key.

```shell
export DATALAB_API_KEY=""
```

Run the converter script.

```shell
./scripts/pdf-to-txt.sh /path/to/path.pdf /output/path/file.txt
```

### 2. One sentence per line

```shell
./scripts/one-sentence-per-line.sh /path/to/input.txt /path/to/output.txt
```

### 3. 80 Characters per line

```shell
./scripts/80-chars-per-line.sh /path/to/input.txt /path/to/output.txt
```

### 4. Remove formatting from headings

```shell
./scripts/remove-formatting-from-headings.sh /path/to/input.txt /path/to/output.txt
```

### 5. Manual fixes

Go through and clean it up!!

### 6. Check that its good

Check if any CIP120 rules are broken.

```shell
./scripts/check/cip-120-rules.sh /path/to/input.txt
```

Check where CIP120 rules are broken.

```shell
./scripts/check/cip-120-specific.sh /path/to/input.txt
```

### 7. Hash the doc

```shell
./scripts/hash.sh /path/to/input.txt
```