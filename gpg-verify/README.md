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
