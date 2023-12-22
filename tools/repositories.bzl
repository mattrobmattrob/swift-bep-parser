"""Definitions for handling Bazel repositories used by this repo."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _maybe(repo_rule, name, **kwargs):
    """Executes the given repository rule if it hasn't been executed already.

    Args:
      repo_rule: The repository rule to be executed (e.g., `http_archive`.)
      name: The name of the repository to be defined by the rule.
      **kwargs: Additional arguments passed directly to the repository rule.
    """
    if not native.existing_rule(name):
        repo_rule(name = name, **kwargs)

def swift_bep_parser_dependencies(bzlmod_deps_only = False):
    """Fetches repositories that are dependencies of `swift-bep-parse`.

    Users should call this macro in their `WORKSPACE` to ensure that all of the
    dependencies of this repo are downloaded and that they are isolated
    from changes to those dependencies.

    Args:
      bzlmod_deps_only: If `True`, only non-bzlmod supporting dependencies are fetched.
        These are then added to the module graph via a module extension.
    """

    if not bzlmod_deps_only:
        # rules_python

        _maybe(
            http_archive,
            name = "rules_python",
            sha256 = "0a8003b044294d7840ac7d9d73eef05d6ceb682d7516781a4ec62eeb34702578",
            strip_prefix = "rules_python-0.24.0",
            url = "https://github.com/bazelbuild/rules_python/releases/download/0.24.0/rules_python-0.24.0.tar.gz",
        )

        # rules_swift

        _maybe(
            http_archive,
            name = "build_bazel_rules_swift",
            sha256 = "28a66ff5d97500f0304f4e8945d936fe0584e0d5b7a6f83258298007a93190ba",
            url = "https://github.com/bazelbuild/rules_swift/releases/download/1.13.0/rules_swift.1.13.0.tar.gz",
        )

        # rules_apple

        _maybe(
            http_archive,
            name = "build_bazel_rules_apple",
            sha256 = "34c41bfb59cdaea29ac2df5a2fa79e5add609c71bb303b2ebb10985f93fa20e7",
            url = "https://github.com/bazelbuild/rules_apple/releases/download/3.1.1/rules_apple.3.1.1.tar.gz",
        )

        # rules_xcodeproj

        _maybe(
            http_archive,
            name = "rules_xcodeproj",
            sha256 = "f5c1f4bea9f00732ef9d54d333d9819d574de7020dbd9d081074232b93c10b2c",
            url = "https://github.com/MobileNativeFoundation/rules_xcodeproj/releases/download/1.13.0/release.tar.gz",
        )

        # Buildifier

        _maybe(
            http_archive,
            name = "buildifier_prebuilt",
            sha256 = "f7093a960a8c3471552764892ce12cb62d9b72600fa4c8b08b2090c45db05ce8",
            strip_prefix = "buildifier-prebuilt-6.0.0.1",
            urls = [
                "http://github.com/keith/buildifier-prebuilt/archive/6.0.0.1.tar.gz",
            ],
        )

    # Bazel

    ## Protobuf

    _maybe(
        http_archive,
        name = "io_bazel",
        patch_args = ["-p1"],
        patches = [
            "@swift_bep_parser//tools:patches/0001-Make-build_event_stream_proto-public-visibility.patch",
        ],
        sha256 = "a56f2b1e81fe84df26d4245fde0765e3eb631075f12ab981bab105a42db26e2a",
        strip_prefix = "bazel-296af602cd2a27a9d10ce5f46c99b42b6ab4367b",
        urls = [
            "https://github.com/bazelbuild/bazel/archive/296af602cd2a27a9d10ce5f46c99b42b6ab4367b.tar.gz",
        ],
    )
