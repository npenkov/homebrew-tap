class GitWorktreeRefresh < Formula
  desc "Scan directories for git repos, fetch remotes in parallel, show worktree status"
  homepage "https://github.com/npenkov/git-worktree-refresh"
  url "https://github.com/npenkov/git-worktree-refresh/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "243bda082e3e90ae579bfbb3aae5f5ac18cc6d69d42249eefa1cacdc3e59045b"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "git-worktree-refresh", shell_output("#{bin}/git-worktree-refresh --help")
  end
end
