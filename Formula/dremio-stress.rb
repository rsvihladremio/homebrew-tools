class DremioStress < Formula
  desc "Simple tool to stress dremio via ODBC and REST interfaces"
  homepage "https://github.com/rsvihladremio/dremio-stress"
  version "0.3.0"

  # Define the download URLs and corresponding SHA256 checksums for the binary releases
  url "https://github.com/rsvihladremio/dremio-stress/releases/download/v#{version}/dremio-stress-mac-amd64.zip"
  sha256 "cbde2aa190c4e3a54f127e7fa169a0c60887d49df88a6980458850fbf1d8ba8c"

  def install
    bin.install "dremio-stress" => "dremio-stress"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/dremio-stress", "--version"
  end
end
