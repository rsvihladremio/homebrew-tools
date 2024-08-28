class Ddc < Formula
  desc "Collect logs of Dremio for analysis"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "3.2.1"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.1/ddc-mac-intel.zip"
      sha256 "35d1e81343263fe5b2db6d2d8b1543c6d00f91b64fa86f486dae98a29aec7fdf"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.1/ddc-mac-m-series.zip"
      sha256 "a1413cd46141e6cd06214b52a00d8ab3091e235b31780c7528f5e860ea957370"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.1/ddc-linux-amd64.zip"
      sha256 "29eb2fe863aee950c42d2fe9a60caac1f6d0cc8bef1b4f08cb24aa3c46db521e"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.2.1/ddc-linux-arm64.zip"
      sha256 "86ea7721b588169af6191c09fe834d9d0ad902cc8de33f03ec30a2e6ee58a05a"
    end
  end

  def install
    libexec.install "bin/ddc" => "ddc"
    bin.write_exec_script libexec/"ddc"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/ddc", "version"
  end
end
