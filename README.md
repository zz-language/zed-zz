# zed-zz

Zed extension for [ZZ](https://github.com/zz-language/zz). Docs: <https://zz-lang.pages.dev>.

Provides: tree-sitter highlighting (via `zz-language/tree-sitter-zz`), snippets, and `zz-lsp` (diagnostics, completion with signatures, hover, go-to-definition, formatting).

## Requirements

`zz-lsp` on your `PATH`:

```bash
cargo build --release -p zz_lsp   # from the zz repo
cp target/release/zz-lsp ~/.zz/bin/   # any dir on PATH works
```

Without it the extension still highlights, but the language server (and its "binary missing" error) won't start. Or pin an explicit path in Zed settings:

```json
{ "lsp": { "zz-lsp": { "binary": { "path": "/abs/path/to/zz-lsp" } } } }
```

## Install (dev, unpublished)

Zed → Extensions → `Install Dev Extension` → select this directory. Needs Rust + `wasm32-wasip2` target (Zed installs it automatically with rustup) and wasi-sdk for the grammar build (Zed downloads it, or set `WASI_SDK_PATH`).

## Layout

```text
extension.toml          id/version, grammar + language_server registration, snippets
Cargo.toml / src/lib.rs minimal host: spawns `zz-lsp` from PATH
languages/zz/config.toml name, .zz suffix, // comments, brackets
languages/zz/highlights.scm queries ported from tree-sitter-zz (Zed capture set)
snippets/zz.json        same set as vscode-zz (func/struct/match/http/...)
```

## Notes

- Grammar pinned to a tree-sitter-zz commit in `extension.toml`; bump `rev` to update highlighting.
- `zz-lsp` must match your compiler version or completions go stale — rebuild both together.
