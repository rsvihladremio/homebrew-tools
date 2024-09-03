class Dqd < Formula
  desc "identifies problems in dremio"
  homepage "https://github.com/rsvihladremio/dqd"
  version "0.12.0"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.12.0/dqd-0.12.0-mac-intel.zip"
      sha256 "39a3cd1fcd272a3d8ace24d8ca0776e59ef561447b45434a228eea37872ed526"
    end

    if Hardware::CPU.arm?
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.12.0/dqd-0.12.0-mac-apple-silicon.zip"
      sha256 "3f7276cc5589e2b6a5d7cbb81dd65aab4622ff9770d6378c8b1aae392b71fbe4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.12.0/dqd-0.12.0-linux-amd64.zip"
      sha256 "b932745e9803f506818c80de11c39ff65f49c0b3b263967ba277e8e5e91d81d5"
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
    system "#{bin}/dqd", "version"
  end
end
