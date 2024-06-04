class Ddc < Formula
  desc "Collect logs of Dremio for analysis"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "3.0.0"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-mac-intel.zip"
      sha256 "7cd3dd4644fbb6b572c5f9f799a03a2918f0d9661bb2ce4811804b9a68b2fbe9"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-mac-m-series.zip"
      sha256 "ff2b6777a5906252ec5a44206da9803acaa53714c31d515ccbadabdae8f6c561"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-linux-amd64.zip"
      sha256 "80f8546179d3bf95b97f364cf44e4d70babef7de5fd0311fa6b5c576d14ec5ec"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-linux-arm64.zip"
      sha256 "b035c9b222aa059f6a09d5d55e334000987288e4e9c3d7d22d6fc123059dfa91"
    end
  end

  def install
    libexec.install "bin/ddc" => "ddc"
    libexec.install "bin/ddc.yaml" => "ddc.yaml"
    bin.write_exec_script libexec/"ddc"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/ddc", "version"
  end
end
