class Statcapn < Formula
  desc "Description of statcapn"
  homepage "https://github.com/rsvihladremio/statcapn"
  version "0.1.1"

  # Define the download URLs and corresponding SHA256 checksums for the binary releases
  url "https://github.com/rsvihladremio/statcapn/releases/download/v#{version}/statcapn-darwin-amd64.zip"
  sha256 "06206e0fddd948ccc27135957183fc61fe7c29b9751b97ab85250b6f8fda2a9b"

  if Hardware::CPU.arm?
    url "https://github.com/rsvihladremio/statcapn/releases/download/v#{version}/statcapn-darwin-arm64.zip"
    sha256 "3f8b77218ccd31238e0587873282160428af4a67c886e37d8e45aaae21ac61cd"
  end

  def install
    bin.install "statcapn" => "statcapn"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/statcapn", "--version"
  end
end
