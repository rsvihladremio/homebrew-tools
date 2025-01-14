class Dqd < Formula
  desc "finds problems in Dremio"
  homepage "https://github.com/rsvihladremio/dqd"
  version "0.12.3"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.12.3/dqd-0.12.3-mac-intel.zip"
      sha256 "a7f831af44aa2af60e50cf000ad748e1661a00a4c216e79eb4322aa60576c185"
    end

    if Hardware::CPU.arm?
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.12.3/dqd-0.12.3-mac-apple-silicon.zip"
      sha256 "7eb30c3d656ea59e1d745925e70c3eccc9db53be3233f566f614c40e5fd1c3a3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.12.3/dqd-0.12.3-linux-amd64.zip"
      sha256 "5770a325d98007c21d682d4a0657acb14dfb73ddea55043fbb45e77604db41f5"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url ""
      sha256 ""
    end
  end

  def install
    libexec.install "dqd" => "dqd"
    bin.write_exec_script libexec/"dqd"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/dqd", "help"
  end
end
