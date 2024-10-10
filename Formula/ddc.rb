class Ddc < Formula
  desc "capturing logs and diags for dremio"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "3.2.7"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.7/ddc-mac-intel.zip"
      sha256 "3129e7b4e7ef3bedc010b8613843de5cab1de43b49c0e44fb259bc18e276bb67"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.7/ddc-mac-m-series.zip"
      sha256 "f1009fdc4c89d56d88be174f5f9319702e080190e46764c0fb4f1e55451819ea"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.7/ddc-linux-amd64.zip"
      sha256 "6ada9b5342780d88074f1be00be4a3a408f20513a2ef15725b8d51b24464a6f2"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.7/ddc-linux-arm64.zip"
      sha256 "e8e0ecfc9ad7bee7cdb95cef0603084a15cc1de8f2be7761ed7c8b6f26901fb1"
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
