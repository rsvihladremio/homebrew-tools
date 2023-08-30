class DremioBatchExecute < Formula
  desc "dremio-batch-execute runs all sql statements provided in a file"
  homepage "https://github.com/rsvihladremio/statcapn"
  version "0.1.0"

  # Define the download URLs and corresponding SHA256 checksums for the binary releases
  url "https://github.com/rsvihladremio/dremio-batch-execute/releases/download/v#{version}/statcapn-darwin-amd64.zip"
  sha256 "8b70bf8ddfee3ca430c6a756ee46f9f073af2a190cf6e0d70201f50c44db71c3"

  if Hardware::CPU.arm?
    url "https://github.com/rsvihladremio/dremio-batch-execute/releases/download/v#{version}/statcapn-darwin-arm64.zip"
    sha256 "1e0c5398e92f7d2f756b52f1ca7c23bcffcb24ff296b68e5f66d3679771e0206"
  end

  def install
    bin.install "dremio-batch-execute" => "dremio-batch-execute"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/dremio-batch-execute", "-h"
  end
end
