class Ddc < Formula
  desc "collect logs of Dremio for analysis"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "2.4.2"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-mac-intel.zip"
      sha256 "e3f52ae39ecc32f5d5cde4e28c0f24d9f4b369b4da4550f43b5bb2d1e8b63a88"
    end

    if Hardware::CPU.arm?
        url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-mac-m-series.zip"
        sha256 "852c180e414c98abbea0ff8d86f47f9899161a0d8a49ad99da1af3b7e0cca09e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-linux-amd64.zip"
      sha256 "a21f238fa1b47820775929640e5450033752482bde5b93dde790235f4606445c"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-linux-arm64.zip"
        sha256 "f1d983013a47dbb395bd9e1bf84d718f3bcd959e882e68b5d273cb0a48a084bf"
    end

  end

  def install
    bin.install "ddc" => "ddc"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/ddc", "version"
  end
end
