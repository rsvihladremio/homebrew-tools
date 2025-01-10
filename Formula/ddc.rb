class Ddc < Formula
  desc "collect logs and metrics from dremio"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "3.3.1"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.3.1/ddc-mac-intel.zip"
      sha256 "a2e3ad64215402455c4c580b58fc0bac23b6adf6d3723fbc1281c607d1125f33"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.3.1/ddc-mac-m-series.zip"
      sha256 "8c9e8cf412eeb776dd9f6b48ad74dbf04b739e90d155c930332bc3fab67670c7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.3.1/ddc-linux-amd64.zip"
      sha256 "bfcaebf71f91645939fd45f4e6c08f3262b32b9b28ec05fda0fd57cbca94987e"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.3.1/ddc-linux-arm64.zip"
      sha256 "b4f985ca403c58cd83375268149cc4322959750dae6cad278577bbb3c8d69616"
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
