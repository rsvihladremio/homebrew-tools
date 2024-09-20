class Ddc < Formula
  desc "capturing logs and diags for dremio"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "3.2.6"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.6/ddc-mac-intel.zip"
      sha256 "caacbc0aac2f6a6bd0593ae7d595ce64b5326aa9c964a16e5475655f767e1290"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.6/ddc-mac-m-series.zip"
      sha256 "e3dc48405c083eb8048e5cdd2f1f291f235eeb86dbe868940f2f715e7b1c29a9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.6/ddc-linux-amd64.zip"
      sha256 "161fa451972cef104b41b6bac429d92255e87f820acee1df40efa27c1a5644d1"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.6/ddc-linux-arm64.zip"
      sha256 "4a016f269aef1c6934c0d904b6b3ea193533064df29a545069ea21f864995c6e"
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
