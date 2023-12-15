"""Defines a module extension for loading non-bzlmod dependencies for the swift_bep_parser module."""

load("//tools:repositories.bzl", "swift_bep_parser_dependencies")

def _non_bzlmod_enabled_deps_impl(_):
    swift_bep_parser_dependencies(
        bzlmod_deps_only = True,
    )

non_bzlmod_enabled_deps = module_extension(implementation = _non_bzlmod_enabled_deps_impl)
