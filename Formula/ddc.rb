class Ddc < Formula
  desc "Collect logs of Dremio for analysis"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "3.1.2"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.1.2/ddc-mac-intel.zip"
      sha256 "3fa00277a6673824d593921efc00c5cccfc5e616bd7b945e86aa59ee0465ba5e"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.1.2/ddc-mac-m-series.zip"
      sha256 "c56f148638e44e8e059d27925c74b8e40d9bd995dd4ef1bb0549533018ab600a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.1.2/ddc-linux-amd64.zip"
      sha256 "0aca442873f3d90e3f5c513836768de6b07ae44af084423ad01e55221ac424d2"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.1.2/ddc-linux-arm64.zip"
      sha256 "b0dccc27958eebd7dff954aefc6ea5531b5795eb30b3a3bec1624a69a75f4147"
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
