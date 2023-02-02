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
