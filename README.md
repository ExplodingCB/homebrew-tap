# ExplodingCB Homebrew tap

Homebrew casks for [ExplodingCB](https://github.com/ExplodingCB)'s macOS apps.

## CleanMyMewp

A free, native Swift/SwiftUI macOS cleaner — [source](https://github.com/ExplodingCB/cleanmymewp).

```sh
brew install --cask explodingcb/tap/cleanmymewp
```

Upgrade with `brew upgrade --cask cleanmymewp`, remove with `brew uninstall --cask cleanmymewp`,
and use `brew uninstall --zap --cask cleanmymewp` to also delete its preferences.

The app is ad-hoc signed rather than notarized, so the cask clears the quarantine flag in a
`postflight` step. Most modules need Full Disk Access, which must be re-granted after each
upgrade because the grant is tied to the exact bundle.

## TV Remote

Control your Apple TV from your Mac with a Siri Remote–style app — [source](https://github.com/ExplodingCB/tv-remote).

```sh
brew install --cask explodingcb/tap/tv-remote
```

Upgrade with `brew upgrade --cask tv-remote`, remove with `brew uninstall --cask tv-remote`,
and use `brew uninstall --zap --cask tv-remote` to also delete its settings and Apple TV pairing.

Like CleanMyMewp, the app is ad-hoc signed rather than notarized, so the cask clears the
quarantine flag in a `postflight` step. It depends on `uv`, which it uses to set up
[pyatv](https://pyatv.dev) on first launch.
