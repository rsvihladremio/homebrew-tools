class Brewgen < Formula
  desc "generate brew formulas more rapidly"
  homepage "https://github.com/rsvihladremio/brewgen"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/brewgen/releases/download/0.1.0/brewgen-0.1.0-amd64-apple-darwin.zip"
      sha256 "b65f28ebd24e5da8cc9fe8ac52b270d75f198516ce08f14b9004a0c519a1b7b2"
    end

    if Hardware::CPU.arm?
      url "https://github.com/rsvihladremio/brewgen/releases/download/0.1.0/brewgen-0.1.0-arm64-apple-darwin.zip"
      sha256 "fa81f13c98dcbf948a8840c2a33e0e25707b141c3cf5685f9a6919e061660372"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/brewgen/releases/download/0.1.0/brewgen-0.1.0-amd64-unknown-linux-gnu.zip"
      sha256 "1ec42485cba72d700d697ab049679119411e3933fd42d382103eeee91ff0d08c"
    end
  end

  def install
    libexec.install "brewgen" => "brewgen"
    bin.write_exec_script libexec/"brewgen"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/brewgen", "help"
  end
end
