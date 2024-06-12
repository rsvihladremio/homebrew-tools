class Ddc < Formula
  desc "Collect logs of Dremio for analysis"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "3.1.1"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.1.1/ddc-mac-intel.zip"
      sha256 "7bcb09edf241ffa44e2374746f3df893b52c3ec09aa0c8533b686ebb2a504af3"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.1.1/ddc-mac-m-series.zip"
      sha256 "2b4c3be267990bac8f3af5b5fc066a8138defc5f264af942e45f490d4cfa9fe5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.1.1/ddc-linux-amd64.zip"
      sha256 "3ee9e12794c9ae402e493a4411f4e35e4230c3512800c23b541526f9dcdf3bfc"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.1.1/ddc-linux-arm64.zip"
      sha256 "40f0b8a65886a4dbe605804cf4827f1c218ba076504a87f61c8dd5c25c86e1c6"
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
