class Simlane < Formula
  desc "One iOS simulator + Metro lane per git worktree for parallel React Native work"
  homepage "https://github.com/ChoiHyeongu/simlane"
  url "https://github.com/ChoiHyeongu/simlane/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "20abfe1b1a789b275222b5f34e4f9c49f49435a058772e5a0e6016f36df4c81e"
  license "MIT"

  depends_on "jq"
  depends_on :macos
  depends_on "tmux"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/simlane"
  end

  def caveats
    <<~EOS
      Link the Claude Code skill and register the session hooks:
        simlane setup --hooks
      To remove them later: rm ~/.claude/skills/simlane, and delete the
      "simlane claude-hook" entries from ~/.claude/settings.json.
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/simlane --version").strip
  end
end
