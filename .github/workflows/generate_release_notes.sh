#!/bin/bash

set -exuo pipefail

# This script generates release notes for a release.
# It uses the new tag and archive to generate a workspace snippet.
# It is primarily used by the `create_release.yml` workflow.
# Args:
#  - The first argument is the new version number.

readonly new_version=$1
readonly release_archive="swift-bep-parser.$new_version.tar.gz"

sha=$(shasum -a 256 "$release_archive" | cut -d " " -f1)

cat <<EOF
### Bzlmod Snippet

\`\`\`bzl
bazel_dep(name = "swift_bep_parser", version = "$new_version")
\`\`\`
EOF
