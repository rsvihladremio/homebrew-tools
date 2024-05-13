class Ddc < Formula
  desc "Collect logs of Dremio for analysis"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "2.4.3"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-mac-intel.zip"
      sha256 "ce9077d39496e3980bdba8ce3545e7e28a0a12de858183296083f297f0b1d168"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-mac-m-series.zip"
      sha256 "3006323f425c02d1078fbe19340df71d0ca93d2e1ce66dc42dd4e9f68613c287"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-linux-amd64.zip"
      sha256 "3b07880a99ce7d42b8661c6321d4d4600d6e45cb6653274d210e2ae5a0f2ea24"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-linux-arm64.zip"
      sha256 "044f81e9981344239402e1b3c914876b040272497c30a629f1512e07e4747672"
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
