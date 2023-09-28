class DremioStress < Formula
  desc "Simple tool to stress dremio via ODBC and REST interfaces"
  homepage "https://github.com/rsvihladremio/dremio-stress"
  version "0.2.1"

  # Define the download URLs and corresponding SHA256 checksums for the binary releases
  url "https://github.com/rsvihladremio/dremio-stress/releases/download/v#{version}/dremio-stress-mac-amd64.zip"
  sha256 "21e7224392725ea1479ddc9175b0f44edcdb4c6bed96bea7d6b5e736da8207d2"

  def install
    bin.install "dremio-stress" => "dremio-stress"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/dremio-stress", "--version"
  end
end
