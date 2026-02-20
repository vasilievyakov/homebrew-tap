cask "claude-sessions" do
  version "1.0.0"
  sha256 "d38ff72e53bc980efe14fb84f03e2813dd72cbf32d060ca4bb1d4a740cdda8af"

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
