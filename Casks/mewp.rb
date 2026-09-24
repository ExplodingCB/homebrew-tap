cask "mewp" do
  version "0.5.1"
  sha256 "e2ad2b5be5e4799e2de6c4bda9aba40dc0ab597546fcaa54f4e75f74fd0841eb"

  url "https://github.com/ExplodingCB/mewp/releases/download/v#{version}/Mewp-#{version}.zip"
  name "Mewp"
  desc "Cleaner for junk, duplicates, large files, apps, and disk usage"
  homepage "https://github.com/ExplodingCB/mewp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Mewp.app"

  # The app is ad-hoc signed (no paid Apple Developer account), so it is not notarized.
  # Clear the quarantine flag Homebrew's download picked up, or macOS refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Mewp.app"],
        writable_paths: ["Mewp.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.chaseculbertson.Mewp"

  # Includes the paths the app used while it was called CleanMyMewp.
  zap trash: [
    "~/Library/Application Support/CleanMyMewp",
    "~/Library/Application Support/Mewp",
    "~/Library/Preferences/com.chaseculbertson.CleanMyMewp.plist",
    "~/Library/Preferences/com.chaseculbertson.Mewp.plist",
    "~/Library/Saved Application State/com.chaseculbertson.CleanMyMewp.savedState",
    "~/Library/Saved Application State/com.chaseculbertson.Mewp.savedState",
  ]

  caveats <<~EOS
    Mewp is ad-hoc signed rather than notarized, so most modules need
    Full Disk Access to see caches, other apps' containers, and system logs.
    Grant it in System Settings > Privacy & Security > Full Disk Access.

    The grant is tied to the exact app bundle, so you must re-grant it after
    every upgrade.
  EOS
end
