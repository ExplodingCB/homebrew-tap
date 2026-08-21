cask "cleanmymewp" do
  version "0.4.1"
  sha256 "02301d172db393ac30e3d66d65750fa5de475dccedf614db7aafc1bf686031a3"

  url "https://github.com/ExplodingCB/cleanmymewp/releases/download/v#{version}/CleanMyMewp-#{version}.zip",
      verified: "github.com/ExplodingCB/cleanmymewp/"
  name "CleanMyMewp"
  desc "Native macOS cleaner: junk, duplicates, large files, uninstaller, and disk map"
  homepage "https://github.com/ExplodingCB/cleanmymewp"

  depends_on macos: ">= :sonoma"

  app "CleanMyMewp.app"

  # The app is ad-hoc signed (no paid Apple Developer account), so it is not notarized.
  # Clear the quarantine flag Homebrew's download picked up, or macOS refuses to open it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CleanMyMewp.app"],
                   sudo: false
  end

  uninstall quit: "com.chaseculbertson.CleanMyMewp"

  zap trash: [
    "~/Library/Application Support/CleanMyMewp",
    "~/Library/Preferences/com.chaseculbertson.CleanMyMewp.plist",
    "~/Library/Saved Application State/com.chaseculbertson.CleanMyMewp.savedState",
  ]

  caveats <<~EOS
    CleanMyMewp is ad-hoc signed rather than notarized, so most modules need
    Full Disk Access to see caches, other apps' containers, and system logs.
    Grant it in System Settings > Privacy & Security > Full Disk Access.

    The grant is tied to the exact app bundle, so you must re-grant it after
    every upgrade.
  EOS
end
