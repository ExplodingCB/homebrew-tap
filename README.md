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
