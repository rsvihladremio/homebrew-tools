class Ddc < Formula
  desc "captures diagnostics from Dremio"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "3.2.4"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.4/ddc-mac-intel.zip"
      sha256 "b9ae1e9b0f380377cde2efffda3c8debd004dd925e1cae9be6c274151ce53e30"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.4/ddc-mac-m-series.zip"
      sha256 "ff9fdc4b5c9a868f7f3fcc377e2543546e996d09de2d1f9eb0a4a401cf42ac6e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.4/ddc-linux-amd64.zip"
      sha256 "abc1f1ca633eefe7f2019664abfcccf4556df87f81feb994c0948136024d7ebd"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.4/ddc-linux-arm64.zip"
      sha256 "65d03a9b16139bd4f8b80b48fa825eb52ff4aad4e35b4fea19bc9f4c73040485"
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
