class DDC < Formula
    desc "collect logs of Dremio for analysis"
    homepage "https://github.com/dremio/dremio-diagnostic-collector"
    version "0.7.0"
  
    # Define the download URLs and corresponding SHA256 checksums for the binary releases
    url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-mac-intel.zip"
    sha256 "4e69b8f92cff9224822e7e7efce421e51f5acb383df7f6ed504c445971e87fb1"

    if Hardware::CPU.arm?
        url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v#{version}/ddc-mac-m-series.zip"
        sha256 "0cb0df5acb618db21614676c7aa43759c89c74df0ad39f2171cc5f2610030645"
    end
  
    def install
      bin.install "ddc" => "ddc"
    end
  
    test do
      # Add test logic here if applicable
      system "#{bin}/ddc", "version"
    end
  end