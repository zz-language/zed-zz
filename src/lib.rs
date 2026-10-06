use zed_extension_api as zed;

struct ZedZz;

impl zed::Extension for ZedZz {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> zed::Result<zed::Command> {
        let command = worktree.which("zz-lsp").ok_or_else(|| {
            "zz-lsp not found in PATH. Install it with: \
             cargo build --release -p zz_lsp (from the zz repo), \
             then put the binary on your PATH."
                .to_string()
        })?;
        Ok(zed::Command {
            command,
            args: vec![],
            env: Default::default(),
        })
    }
}

zed::register_extension!(ZedZz);
