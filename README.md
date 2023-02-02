# Github Actions

## Actions

# gpg-sign

## Introduction

A Github Action helping with GPG signature creation.

## Example

    name: GPG sign

    on:
      workflow_dispatch:

    jobs:
      check:
        runs-on: ubuntu-latest
        steps:
          - name: Generate data to sign
            run: |
              date > data.txt

          - name: Sign
            id: gpg_sign
            uses: chevdor/actions/gpg-sign@v0
            with:
              key: ${{ secrets.GPG_PRIVATE_KEY }}
              file: data.txt

# gpg-verify

## Introduction

A Github Action helping with GPG signature verififcation.

## Example

    name: GPG verify

    on:
      workflow_dispatch:

    jobs:
      check:
        runs-on: ubuntu-latest
        steps:
          # This is assuming you do have a signature
          # already and the file that was signed

          - name: Verify signature OK
            id: gpg_verif
            uses: chevdor/actions/gpg-verify@v0
            with:
              key: ${{ secrets.GPG_PUBLIC_KEY }}
              sig_file: data.txt.asc

# GPG cheat-sheet

## Create a key

    ID=gha-signer
    gpg --batch --passphrase '' --quick-gen-key "$ID" default default
    gpg -K "$ID"

## Export the key as ASCII

    target=/tmp/$ID-private.key
    gpg --output $target --armor  --export-secret-keys "$ID"
    cat $target

or
gpg -a --export-secret-keys $ID | cat -e | sed 's/\\$/\\\n/g' | pbcopy

## Contributing

This project is using `asciidoc` for its documentation. You should **not** edit any mardown file (`.md`) as your changes would be dismissed.

Instead you should be editing the `.adoc` file and the markdown files will be generated. If you create a PR and do not have any of the required tooling, feel free to only edit the `.adoc.` files and I will generate the new `.md`.
