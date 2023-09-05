class Ddc < Formula
    desc "collect logs of Dremio for analysis"
    homepage "https://github.com/dremio/dremio-diagnostic-collector"
    version "0.7.1"
  
    # Define the download URLs and corresponding SHA256 checksums for the binary releases
    url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-mac-intel.zip"
    sha256 "0b2210c84785198dafaf71ebac5b295081ecdc0c1cbbceebf1c0908e0aed7db6"

    if Hardware::CPU.arm?
        url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-mac-m-series.zip"
        sha256 "b8bda4595baa0c8466c3f44c6dd567846b4f56b340fa6b126f1b3537c42d8e41"
    end
  
    def install
      bin.install "ddc" => "ddc"
    end
  
    test do
      # Add test logic here if applicable
      system "#{bin}/ddc", "version"
    end
  end
