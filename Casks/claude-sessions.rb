cask "claude-sessions" do
  version "1.0.1"
  sha256 "da2ec3648a98c90c65b9ac42ce2df142b5a81bd9de8ba69d06fba2a6bdf22fdf"

  url "https://github.com/vasilievyakov/miracle-claude-sessions/releases/download/v#{version}/ClaudeSessions.app.zip"
  name "Claude Sessions"
  desc "Session browser for Claude Code with cost tracking and tool visualization"
  homepage "https://github.com/vasilievyakov/miracle-claude-sessions"

  depends_on macos: ">= :sonoma"

  app "ClaudeSessions.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ClaudeSessions.app"]
  end

  zap trash: [
    "~/Library/Caches/com.vasilievyakov.claudesessions",
    "~/Library/Preferences/com.vasilievyakov.claudesessions.plist",
  ]
end
