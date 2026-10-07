# ExplodingCB Homebrew tap

Homebrew casks for [ExplodingCB](https://github.com/ExplodingCB)'s macOS apps.

## Mewp

A free, open-source, native Swift/SwiftUI macOS cleaner — [source](https://github.com/ExplodingCB/mewp).

```sh
brew install --cask explodingcb/tap/mewp
```

Upgrade with `brew upgrade --cask mewp`, remove with `brew uninstall --cask mewp`,
and use `brew uninstall --zap --cask mewp` to also delete its preferences.

The app is ad-hoc signed rather than notarized, so the cask clears the quarantine flag in a
`postflight_steps` step. Most modules need Full Disk Access, which must be re-granted after each
upgrade because the grant is tied to the exact bundle.

Mewp was called CleanMyMewp until 0.5. The `cleanmymewp` cask is disabled; to switch over:

```sh
brew uninstall --cask cleanmymewp
brew install --cask explodingcb/tap/mewp
```

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

## Atoll Efficient

An unofficial fork of the [Atoll](https://github.com/Ebullioscopic/Atoll) notch app that keeps the
music controls, HUD and lock screen widgets without the battery drain or the memory spikes. Apple
silicon, macOS 14.6 or later — [source](https://github.com/ExplodingCB/atoll-efficient).

```sh
brew install --cask explodingcb/tap/atoll-efficient
```

Upgrade with `brew upgrade --cask atoll-efficient`, remove with `brew uninstall --cask atoll-efficient`,
and use `brew uninstall --zap --cask atoll-efficient` to also delete its preferences and caches.

The app is ad-hoc signed rather than notarized, so the cask clears the quarantine flag in a
`postflight_steps` step. Quit upstream Atoll before opening it, and expect macOS to ask for
Bluetooth and Accessibility access again after each upgrade. Answer the Bluetooth prompt at launch
before expecting the notch to appear.
