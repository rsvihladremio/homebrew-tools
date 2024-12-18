class Ssdownloader < Formula
  desc "download files from zendesk tickets and sendsafely links"
  homepage "https://github.com/rsvihladremio/ssdownloader"
  version "0.4.12"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v0.4.12/ssdownloader-darwin-amd64.zip"
      sha256 "189c8603427dc18e21e52600da094cb43aa616ed2b4a473131cf3178c45b5f73"
    end

    if Hardware::CPU.arm?
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v0.4.12/ssdownloader-darwin-arm64.zip"
      sha256 "225d811cc01a6ceb5bde1bfca596c3831f9f778a3980c48a27b526763f989a8d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v0.4.12/ssdownloader-linux-amd64.zip"
      sha256 "94d9bd5e36e619035a036399d99d5628e95a303bb55cee23ebaf78e0a9cfc6ba"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v0.4.12/ssdownloader-linux-arm64.zip"
      sha256 "cf31f2b30ffb116fe5f30f1ca2e26d50c581a30348cce6fe4f8b56bee16c2bc9"
    end
  end

  def install
    libexec.install "ssdownloader" => "ssdownloader"
    bin.write_exec_script libexec/"ssdownloader"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/ssdownloader", "version"
  end
end
