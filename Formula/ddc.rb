class Ddc < Formula
  desc "capturing logs and diags for dremio"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "3.2.5"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.5/ddc-mac-intel.zip"
      sha256 "7eedba516d416d9bd9394f48b14a3ddb39aac498548b3870fa892f2b2e4330ec"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.5/ddc-mac-m-series.zip"
      sha256 "754632a36a8360b59c4aba2a83acd97a61632bb130590a5af9f4c3d43e820dde"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.5/ddc-linux-amd64.zip"
      sha256 "701a17064ab9f6d307466da2f25ce7921fd578f7a623c459dc2560b989a7b583"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.5/ddc-linux-arm64.zip"
      sha256 "c4f121baea1f24532ba6e681766ca2ebf223b64e1b439059884b5b759e787d78"
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
