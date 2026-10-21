<div align="center">

# Overcraft Homebrew Tap

Official [Homebrew](https://brew.sh) tap for [Overcraft](https://overcraft.dev)'s apps.

</div>

## Available packages

| Package | Type | Description |
|---------|------|-------------|
| [`overterm`](https://github.com/Overcraft-hq/overterm) | Cask | A macOS terminal for working with AI agents, built on libghostty |

## Install

```bash
brew install --cask overcraft-hq/tap/overterm
```

or, tap once and use the short name:

```bash
brew tap overcraft-hq/tap
brew install --cask overterm
```

Apple silicon, macOS 13 or later. Overterm isn't notarized yet: the first
time, open it with right-click → **Open** (on macOS 15: System Settings →
Privacy & Security → **Open Anyway**).

## Upgrade

```bash
brew upgrade --cask overterm
```

## Uninstall

```bash
brew uninstall --cask overterm          # the app
brew uninstall --cask --zap overterm    # …and its settings, sessions and caches
```

## Releasing a new version

After the [Release workflow](https://github.com/Overcraft-hq/overterm/actions/workflows/release.yml)
has published `v<version>` with its DMG:

```bash
./scripts/bump.sh v1.0.1     # version + sha256 from the release's DMG
git commit -am "overterm 1.0.1" && git push
```

## Links

- [Overterm](https://github.com/Overcraft-hq/overterm) · [overterm.overcraft.dev](https://overterm.overcraft.dev)
- [Overcraft](https://overcraft.dev)
