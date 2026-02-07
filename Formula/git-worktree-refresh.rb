class GitWorktreeRefresh < Formula
  desc "Scan directories for git repos, fetch remotes in parallel, show worktree status"
  homepage "https://github.com/npenkov/git-worktree-refresh"
  url "https://github.com/npenkov/git-worktree-refresh/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "cbadb1167fd7c9976bc8c8b83c68c1c25ba22d7afd6dd2a5c700cdac66082552"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "git-worktree-refresh", shell_output("#{bin}/git-worktree-refresh --help")
  end
end
