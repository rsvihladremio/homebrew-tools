class Ddc < Formula
  desc "collect logs and metrics from dremio"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "3.3.3"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.3.3/ddc-mac-intel.zip"
      sha256 "aea0604a83ccf81ec39f9d86437dc5b3770a5ad3a5a2e900cf05fcff688cfd4f"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.3.3/ddc-mac-m-series.zip"
      sha256 "928c8a3a68bfe523384c6ccf9119418bf20aaf0e4d91812cebe611fecb9ee467"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.3.3/ddc-linux-amd64.zip"
      sha256 "d68e946a02b83eb95b4aa48e0de6abf9b9d6be999058161cf9303ad0010c9895"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.3.3/ddc-linux-arm64.zip"
      sha256 "2192b4e15467a08eeabf98eccaaec5d09a594e56c8d731d58f56fa0fa69af4ad"
    end
  end

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
