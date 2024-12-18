class Ddc < Formula
  desc "collect logs and metrics from dremio"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "3.2.8"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.8/ddc-mac-intel.zip"
      sha256 "2eb95cff73e6e6d4ed6e51eab09d3db0a9ddbe248a5780c4b703e35ac92f855c"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.8/ddc-mac-m-series.zip"
      sha256 "2f45406c58aaf1072d902dd2be1fef50e7a4ecc732861e725bc3c1a5b150565b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.8/ddc-linux-amd64.zip"
      sha256 "31e9802779e1f9f1fe9181973287195f7e00f576fc6310e944e3e35cef450d39"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.8/ddc-linux-arm64.zip"
      sha256 "74d436deb3dace15b6a3142b3768e130cb32f5221b4d9e5bc1cb393b5142edff"
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
