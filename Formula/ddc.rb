class Ddc < Formula
    desc "collect logs of Dremio for analysis"
    homepage "https://github.com/dremio/dremio-diagnostic-collector"
    version "0.8.3"

    on_macos do

      if Hardware::CPU.intel?
        # Define the download URLs and corresponding SHA256 checksums for the binary releases
        url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-mac-intel.zip"
        sha256 "b5544b5f7e93435a2116861c9f585674c8ce2659467640fc2f92bc3b0b358354"
      end

      if Hardware::CPU.arm?
          url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-mac-m-series.zip"
          sha256 "6501f918f03baa3441fef92bb5ba7d5f5d54d120e95352b88ce3a459f2b244df"
      end
    end

    on_linux do

      if Hardware::CPU.intel?
        # Define the download URLs and corresponding SHA256 checksums for the binary releases
        url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-linux-amd64.zip"
        sha256 "a42cf1b4a53e3d57e21dc16eb8e8ae113eae5803b1490d8d5d4173076eaae9b8"
      end

      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
          url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-linux-arm64.zip"
          sha256 "28e13ca44480c84996147d588bdecde30cb23f18dc8c83459012605db635b03a"
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
