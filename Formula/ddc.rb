class Ddc < Formula
    desc "collect logs of Dremio for analysis"
    homepage "https://github.com/dremio/dremio-diagnostic-collector"
    version "0.7.3"

    on_macos do

      if Hardware::CPU.intel?
        # Define the download URLs and corresponding SHA256 checksums for the binary releases
        url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-mac-intel.zip"
        sha256 "dca14af7fbd7dd113d414b14e1e10ddb92706966ac25e4d2be0d5f608050400e"
      end

      if Hardware::CPU.arm?
          url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-mac-m-series.zip"
          sha256 "5c2f5f8073fa0c4fa875c1ddf23f59161a9cc68f62d87a1a9290d9a7f4f50e6f"
      end
    end

    on_linux do

      if Hardware::CPU.intel?
        # Define the download URLs and corresponding SHA256 checksums for the binary releases
        url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-linux-amd64.zip"
        sha256 "b5f3372bd2e4641e4917bad63dba41cac0d8495cbf83622ef3bc53fa30816dd0"
      end

      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
          url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-linux-arm64.zip"
          sha256 "5545fe8c674c8f4f3311ee8523db8e9759bdeb515fd0a3aabcf0b2f07e0a5f7d"
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
