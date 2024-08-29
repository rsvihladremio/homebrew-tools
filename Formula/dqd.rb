class Dqd < Formula
  desc "identifies problems in dremio"
  homepage "https://github.com/rsvihladremio/dqd"
  version "0.11.4"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.11.4/dqd-0.11.4-mac-intel.zip"
      sha256 "d2290934012829b1d4a6487aabc8b437e0386533ed30df7fde47b355f52af4fe"
    end

    if Hardware::CPU.arm?
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.11.4/dqd-0.11.4-mac-apple-silicon.zip"
      sha256 "0df01e581e105a0b821d10078083f2bcb0245337141b4e8f52617533076a7b20"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.11.4/dqd-0.11.4-linux-amd64.zip"
      sha256 "dff5c6a133724682b5c9adcbeedeb6684a5e487e7f483314a85f2589a704a6e7"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.11.4/dqd-0.11.4-linux-arm64.zip"
      sha256 "52e0239c369a78cc5c7db7a0dc6ed31ea822a083ee98a83deb39d664c73ab6d0"
    end
  end

  def install
    libexec.install "bin/dqd" => "dqd"
    bin.write_exec_script libexec/"dqd"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/dqd", "help"
  end
end
