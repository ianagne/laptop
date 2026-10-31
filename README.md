# laptop
A [Thoughtbot-inspired](https://github.com/thoughtbot/laptop) setup script to configure a OSX machine for web development.  If run multiple times, the script will upgrade and update existing packages.

## Working in Amp orbs

Orbs run Debian, so do not execute `./laptop` there. Homebrew, macOS settings,
dotfiles, and the language runtimes it installs belong on the target Mac, not in
the orb. This repository has no application dependencies or backing services.

`.agents/setup` installs ShellCheck only if missing. Amp caches the installed
tools in project snapshots so later orbs can reuse them. `.agents/resume` only
checks that ShellCheck is available, without installing anything on wake.

Run static checks from the repository root:

```sh
bash -n laptop
shellcheck laptop
shellcheck .agents/setup .agents/resume
```

The existing `laptop` script has ShellCheck diagnostics, including Bash/Zsh
syntax under a `/bin/sh` shebang. These checks do not validate macOS provisioning;
that requires a disposable Mac.

## Runtime setup with mise

The private `ianagne/dotfiles` repository must include `brew "mise"` in its
`Brewfile` and activate mise in `zshrc` with `eval "$(mise activate zsh)"`
instead of adding asdf shims to `PATH`. Apply those changes before running this
installer. An existing `~/.dotfiles` checkout is not updated automatically;
update it before rerunning laptop. GitHub SSH access is required for a fresh
dotfiles clone.

The installer uses [mise](https://mise.jdx.dev/getting-started.html) to install
the latest stable Ruby, Erlang, Elixir, and Node.js, recording exact global
versions with `mise use --global --pin`. Reruns select the latest releases again
and reuse installations when the version has not changed. Erlang is installed
before Elixir. RubyGems, Bundler, and the global agent-browser npm package run
through `mise exec`, without depending on interactive shell activation. Bun
continues to use its own installer.

Python remains available through mise, but no global Python is installed, just
as the old setup registered its plugin without installing a version. Use
`mise use --global python@latest` if a global Python is wanted. Existing project
`.tool-versions` files work with mise, and the installer enables idiomatic Ruby,
Python, Node.js, and Elixir version files to replace `legacy_version_file = yes`.

rcm copies the dotfiles using the repository's `rcrc`, including on the first
run. Accept its overwrite prompt for the managed `~/.zshrc` after reviewing any
local changes. Keep machine-specific shell setup in `~/.zshrc.local`. Mise
activation belongs at the end of the managed `zshrc`, after that local file and
its Homebrew initialization. The installer does not source the copied
interactive zsh configuration. Open a new terminal after setup.
It leaves mise's generated global configuration
outside rcm management so `rcup` does not overwrite selected versions.

Existing asdf installs, gems, npm packages, and custom global versions are not
copied or deleted. Reinstall any additional tools or packages needed under mise.
Check local shell overrides for asdf/rbenv initialization and remove those
entries before using mise. Once tools work in a new terminal, old `~/.asdf` and
`~/.asdfrc` can be removed manually. Terraform stays Homebrew-managed; its shell
completion must use the installed command rather than an old asdf path.

See the documented [`mise use`](https://mise.jdx.dev/cli/use.html),
[Erlang](https://mise.jdx.dev/lang/erlang.html), and
[Elixir](https://mise.jdx.dev/lang/elixir.html) behavior for installation details.
