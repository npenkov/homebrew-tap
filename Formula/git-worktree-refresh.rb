class GitWorktreeRefresh < Formula
  desc "Scan directories for git repos, fetch remotes in parallel, show worktree status"
  homepage "https://github.com/npenkov/git-worktree-refresh"
  url "https://github.com/npenkov/git-worktree-refresh/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "f4745c639b03074698d2e4ea59b1ab9a005bd9b5a959f925ab28828e0cab683e"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    out_dir = Dir["target/release/build/git-worktree-refresh-*/out"].first
    man1.install "#{out_dir}/git-worktree-refresh.1"
  end

  test do
    assert_match "git-worktree-refresh", shell_output("#{bin}/git-worktree-refresh --help")
  end
end
