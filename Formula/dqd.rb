class Dqd < Formula
  desc "identifies problems in dremio"
  homepage "https://github.com/rsvihladremio/dqd"
  version "0.12.2"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.12.2/dqd-0.12.2-mac-intel.zip"
      sha256 "3dbc6f930160371ebb59027d9a6258203915e52f04d098a59b5b16782e70430c"
    end

    if Hardware::CPU.arm?
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.12.2/dqd-0.12.2-mac-apple-silicon.zip"
      sha256 "fd87c1866151aa447d7f338e903a1262feccb8e5ed812c78d34a764953725881"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.12.2/dqd-0.12.2-linux-amd64.zip"
      sha256 "28ea4f0daa639d9d3b7211744b3d7b188573b4f662b615419bfda229cefde6f0"
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
