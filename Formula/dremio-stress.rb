class DremioStress < Formula
  desc "Simple tool to stress dremio via ODBC and REST interfaces"
  homepage "https://github.com/rsvihladremio/dremio-stress"
  version "0.1.0"

  # Define the download URLs and corresponding SHA256 checksums for the binary releases
  url "https://github.com/rsvihladremio/dremio-stress/releases/download/v#{version}/dremio-stress-mac-amd64.zip"
  sha256 "782cd6fc86eeb6b201ce45e3fc293dafe37b4f873ff5548ac1de6222ae6d7b96"

  def install
    bin.install "dremio-stress" => "dremio-stress"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/dremio-stress", "--version"
  end
end
