class Brewgen < Formula
  desc "generate brew formulas more rapidly"
  homepage "https://github.com/rsvihladremio/brewgen"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/brewgen/releases/download/0.1.0/brewgen-0.1.0-amd64-apple-darwin.zip"
      sha256 "fe8e21164f8daeb51b4b8ec1d3d9462bf094f18d37b58179656510de4c63547f"
    end

    if Hardware::CPU.arm?
      url "https://github.com/rsvihladremio/brewgen/releases/download/0.1.0/brewgen-0.1.0-arm64-apple-darwin.zip"
      sha256 "053fbf08927919ca11df463808b40a0b79e87ada7ee6b4a7ad999657b4dba60d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/brewgen/releases/download/0.1.0/brewgen-0.1.0-amd64-unknown-linux-gnu.zip"
      sha256 "54b0b0b5895f7607a09185ce060d83c9f74843f714abe7eecb335f6193bfd45d"
    end
  end

  def install
    libexec.install "target/aarch64-apple-darwin/release/brewgen" => "brewgen"
    bin.write_exec_script libexec/"brewgen"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/brewgen", "help"
  end
end
