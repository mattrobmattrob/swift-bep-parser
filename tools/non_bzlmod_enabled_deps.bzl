"""Defines a module extension for loading dependencies for the swift_bep_parser module that dont support bzlmod."""

load("//tools:repositories.bzl", "swift_bep_parser_dependencies")

def _non_bzlmod_enabled_deps_impl(_):
    swift_bep_parser_dependencies(
        bzlmod_deps_only = True,
    )

non_bzlmod_enabled_deps = module_extension(implementation = _non_bzlmod_enabled_deps_impl)
