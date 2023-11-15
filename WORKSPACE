load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Python

http_archive(
    name = "rules_python",
    sha256 = "0a8003b044294d7840ac7d9d73eef05d6ceb682d7516781a4ec62eeb34702578",
    strip_prefix = "rules_python-0.24.0",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.24.0/rules_python-0.24.0.tar.gz",
)

load("@rules_python//python:repositories.bzl", "py_repositories")

py_repositories()

# rules_apple

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "34c41bfb59cdaea29ac2df5a2fa79e5add609c71bb303b2ebb10985f93fa20e7",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/3.1.1/rules_apple.3.1.1.tar.gz",
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

# rules_swift

http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "28a66ff5d97500f0304f4e8945d936fe0584e0d5b7a6f83258298007a93190ba",
    url = "https://github.com/bazelbuild/rules_swift/releases/download/1.13.0/rules_swift.1.13.0.tar.gz",
)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

# rules_xcodeproj

http_archive(
    name = "rules_xcodeproj",
    sha256 = "f5c1f4bea9f00732ef9d54d333d9819d574de7020dbd9d081074232b93c10b2c",
    url = "https://github.com/MobileNativeFoundation/rules_xcodeproj/releases/download/1.13.0/release.tar.gz",
)

load(
    "@rules_xcodeproj//xcodeproj:repositories.bzl",
    "xcodeproj_rules_dependencies",
)

xcodeproj_rules_dependencies()

load("@bazel_features//:deps.bzl", "bazel_features_deps")

bazel_features_deps()

# iOS/macOS

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

# Bazel

## Protobuf

http_archive(
    name = "io_bazel",
    patch_args = ["-p1"],
    patches = [
        "//tools:patches/0001-Make-build_event_stream_proto-public-visibility.patch",
    ],
    sha256 = "a56f2b1e81fe84df26d4245fde0765e3eb631075f12ab981bab105a42db26e2a",
    strip_prefix = "bazel-296af602cd2a27a9d10ce5f46c99b42b6ab4367b",
    urls = [
        "https://github.com/bazelbuild/bazel/archive/296af602cd2a27a9d10ce5f46c99b42b6ab4367b.tar.gz",
    ],
)

## GRPC

http_archive(
    name = "com_google_googleapis",
    patch_args = ["-p1"],
    patches = [
        "//tools:patches/0002-Add-swift-build-proto.patch",
    ],
    sha256 = "fb410aac4f2a5622528ed60812ca79812a81dabc1d30be799be9f1ad6ed78435",
    strip_prefix = "googleapis-f02530723b94cca98756b7e14d542444e591ee32",
    urls = [
        "https://github.com/googleapis/googleapis/archive/f02530723b94cca98756b7e14d542444e591ee32.tar.gz",
    ],
)

load("@com_google_googleapis//:repository_rules.bzl", "switched_rules_by_language")

# Disable all languages since we just want the gRPC proto.
switched_rules_by_language(
    name = "com_google_googleapis_imports",
)

# Buildifier

http_archive(
    name = "buildifier_prebuilt",
    sha256 = "f7093a960a8c3471552764892ce12cb62d9b72600fa4c8b08b2090c45db05ce8",
    strip_prefix = "buildifier-prebuilt-6.0.0.1",
    urls = [
        "http://github.com/keith/buildifier-prebuilt/archive/6.0.0.1.tar.gz",
    ],
)

load("@buildifier_prebuilt//:deps.bzl", "buildifier_prebuilt_deps")

buildifier_prebuilt_deps()

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

load("@buildifier_prebuilt//:defs.bzl", "buildifier_prebuilt_register_toolchains")

buildifier_prebuilt_register_toolchains()

# Swiftlint

http_archive(
    name = "SwiftLint",
    build_file_content = """
load("@bazel_skylib//rules:native_binary.bzl", "native_binary")

native_binary(
    name = "swiftlint",
    src = "bin/swiftlint",
    out = "swiftlint",
    visibility = ["//visibility:public"],
)
""",
    sha256 = "abe7c0bb505d26c232b565c3b1b4a01a8d1a38d86846e788c4d02f0b1042a904",
    strip_prefix = "SwiftLintBinary.artifactbundle/swiftlint-0.50.3-macos",
    url = "https://github.com/realm/SwiftLint/releases/download/0.50.3/SwiftLintBinary-macos.artifactbundle.zip",
)
