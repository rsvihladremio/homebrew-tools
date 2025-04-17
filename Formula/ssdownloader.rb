class Ssdownloader < Formula
  desc "retrieves all SendSafely uploads to a ticket"
  homepage "https://github.com/rsvihladremio/ssdownloader"
  version "0.4.14"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v0.4.14/ssdownloader-darwin-amd64.zip"
      sha256 "7601e4e9018b29d7341c382e30dc1bc225d58870158611bf468e2d69345c2b2d"
    end

    if Hardware::CPU.arm?
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v0.4.14/ssdownloader-darwin-arm64.zip"
      sha256 "db9b09d9c096af03ecf33fc08bfd933ecb2630bf050e4205cb856d420a73562e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v0.4.14/ssdownloader-linux-amd64.zip"
      sha256 "9ef9a7b9ac324d246f096556f4b0aac97ef8a38b11085e298d96637e866d0f40"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v0.4.14/ssdownloader-linux-arm64.zip"
      sha256 "f886da877506171a0acbe1792ad22063238993b1601960fd66056d31a90985f7"
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
