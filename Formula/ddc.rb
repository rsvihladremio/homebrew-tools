class Ddc < Formula
  desc "Collect logs of Dremio for analysis"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "3.2.3"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.3/ddc-mac-intel.zip"
      sha256 "0c6ac2181f4822091f38548f277ed7a1d4e20c6c3929d5bd3e517f43ddf79b67"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.3/ddc-mac-m-series.zip"
      sha256 "77cc631970091add5fc6b808bd762762a9954a8260919dfb7e044cd30846ac19"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.3/ddc-linux-amd64.zip"
      sha256 "0df5366fec7e42431fd1a80f3957aba52a6089fcb289706c639f66d89e369a61"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.3/ddc-linux-arm64.zip"
      sha256 "d2f016fa770562092a86a9a60a53fb041ce888ce2805c0068ee56697198824f2"
    end
  end

  def install
    libexec.install "bin/ddc" => "ddc"
    bin.write_exec_script libexec/"ddc"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/ddc", "version"
  end
end
