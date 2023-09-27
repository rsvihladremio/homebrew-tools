class Statcapn < Formula
  desc "JDK 8 gclog analyzer and reporter"
  homepage "https://github.com/rsvihladremio/gclog"
  version "0.2.1"

  # Define the download URLs and corresponding SHA256 checksums for the binary releases
  url "https://github.com/rsvihladremio/gclog/releases/download/v#{version}/v#{version}-x86_64-apple-darwin.zip"
  sha256 "1cd081f9657ca8b0c138a7d64edc9af75d0e4b068f390960f7656b05381c7857"

  if Hardware::CPU.arm?
    url "https://github.com/rsvihladremio/gclog/releases/download/v#{version}/v#{version}-aarch64-apple-darwin.zip"
    sha256 "6ae6ee93196f23dadd1e7f9e2813d33b19fc0a1f07cf46fa6b6e01188e7b27b0"
  end

  def install
    bin.install "statcapn" => "statcapn"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/statcapn", "--version"
  end
end
