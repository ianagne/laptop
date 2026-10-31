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
