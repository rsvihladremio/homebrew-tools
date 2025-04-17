class Ddc < Formula
  desc "collect logs and metrics from dremio"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "3.3.4"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.3.4/ddc-mac-intel.zip"
      sha256 "ac665d2b82302149943eec48b6b484492fe96f41ed66cda53aa5cd46f199e2f0"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.3.4/ddc-mac-m-series.zip"
      sha256 "d1920f329696041e51908da9ba3cade497f0980b14fddc69b3ccdcaa19bc4fff"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.3.4/ddc-linux-amd64.zip"
      sha256 "de48ac15ad0cd52864fc16a0cbb2ffc49adac357d141b480a41972879d257f95"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.3.4/ddc-linux-arm64.zip"
      sha256 "f17b0c9835ad07a6a243ff2c95f0de2c5f395b23f0c2e4ec371eea03b479f820"
    end
  end
  version "3.3.3"

  def install
    libexec.install "bin/ddc" => "ddc"
    libexec.install "bin/ddc.yaml" => "ddc.yaml"
    bin.write_exec_script libexec/"ddc"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/ddc", "help"
  end
end
