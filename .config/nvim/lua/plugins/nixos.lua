-- On NixOS, every LSP server, formatter, linter and debugger these LazyVim
-- extras need is provided natively by Nix (nixos-config's configuration.nix,
-- environment.systemPackages) instead of Mason: many Mason-downloaded
-- binaries are generic Linux builds that fail with "Could not start
-- dynamically linked executable" on NixOS. Mason is disabled here so it
-- doesn't try. macOS is unaffected -- this file is a no-op there.
--
-- The language list has to be kept in sync by hand in two places: the
-- extras enabled below, and the package list in nixos-config's
-- configuration.nix. If you enable a new lang extra, add its tools there too.
if not vim.uv.fs_stat("/etc/NIXOS") then
  return {}
end

return {
  { "mason-org/mason.nvim", enabled = false },
  { "mason-org/mason-lspconfig.nvim", enabled = false },
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },
}
