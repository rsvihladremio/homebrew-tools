class DremioStress < Formula
  desc "Simple tool to stress dremio via ODBC and REST interfaces"
  homepage "https://github.com/rsvihladremio/dremio-stress"
  version "0.2.0"

  # Define the download URLs and corresponding SHA256 checksums for the binary releases
  url "https://github.com/rsvihladremio/dremio-stress/releases/download/v#{version}/dremio-stress-mac-amd64.zip"
  sha256 "886bee7c7e539e726442d5a1f33df00970431c850f42fc3d502024e36b7c2921"

  def install
    bin.install "dremio-stress" => "dremio-stress"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/dremio-stress", "--version"
  end
end
