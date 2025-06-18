class Ddc < Formula
  desc "collect logs and metrics from dremio"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "3.5.0"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.5.0/ddc-mac-intel.zip"
      sha256 "0ac1a4e93663d324ced79b1d30327a2f30847b2ca99bb59373826d77dda8b6cf"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.5.0/ddc-mac-m-series.zip"
      sha256 "1592b28eee2a6d6bcee5bf86fc5fde6a16c21c96dcc69bbfbc19a33a5cf428e9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.5.0/ddc-linux-amd64.zip"
      sha256 "29017c3fab2eb94fa1d1eea8dd620e8361e7d0346883ed8e4d89a0f3dcd2b58c"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.5.0/ddc-linux-arm64.zip"
      sha256 "fe9e0da9723a50154ce124935114bbc6139103814f327a70906ec3a4623d1383"
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
