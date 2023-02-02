# List available commands
default:
  @just --list --unsorted


# Generate the readme as .md
md:
  #!/usr/bin/env bash
  find . -name "README*.adoc" | while read -r fname; do
    folder=$(dirname "$fname")
    filename=$(basename "$fname")
    name="${filename/_src/}"
    name="${name%%.*}"
    asciidoctor -b docbook -a leveloffset=+1 -o - "$fname" | pandoc   --markdown-headings=atx --wrap=preserve -t markdown_strict -f docbook - > "$folder/$name.md"
  done


tag:
  #!/usr/bin/env bash
  latest=$(git tag | sort -Vr | head -n1)
  version=$(echo "$latest" |sed -E 's/v//g')
  bumped=$(semver-cli "$version" --increment minor)
  echo "Tagging v$bumped ..."
  git tag "v$bumped"
  git tag | sort -Vr | head -n10
