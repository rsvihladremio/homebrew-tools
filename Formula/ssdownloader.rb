class Ssdownloader < Formula
  desc "retrieves all SendSafely uploads to a ticket"
  homepage "https://github.com/rsvihladremio/ssdownloader"
  version "0.4.13"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v0.4.13/ssdownloader-darwin-amd64.zip"
      sha256 "c7d2691f3d25fc3e8b91217dff14ac3dd934d764978d2496ea7ed0f00ac04988"
    end

    if Hardware::CPU.arm?
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v0.4.13/ssdownloader-darwin-arm64.zip"
      sha256 "3959086a446a010e92f48b14c83822eb622169c7ff0e3f45bb599e488e857679"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v0.4.13/ssdownloader-linux-amd64.zip"
      sha256 "3a12a12bf36a2e54ce9d26dde7b85a5c2ca59cc1f7152039cf1d4f0f62aef861"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v0.4.13/ssdownloader-linux-arm64.zip"
      sha256 "220b590b0cd2174d5bc9b779eea4d60ffda2fd524c81ecef5ad4d765bc68f99d"
    end
  end

  def install
    libexec.install "bin/ssdownloader" => "ssdownloader"
    bin.write_exec_script libexec/"ssdownloader"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/ssdownloader", "version"
  end
end