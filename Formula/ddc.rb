class Ddc < Formula
  desc "collect logs and metrics from dremio"
  homepage "https://github.com/dremio/dremio-diagnostic-collector"
  version "3.4.0"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.4.0/ddc-mac-intel.zip"
      sha256 "613c8362791be4035dd483eba94b222defa11f9931a301099aac4f1fd656e8c2"
    end

    if Hardware::CPU.arm?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.4.0/ddc-mac-m-series.zip"
      sha256 "03061faba10e0c243878cf64cdbaaf82bd5ebb0e81452d49dc843fd512683602"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.4.0/ddc-linux-amd64.zip"
      sha256 "71bd0302276e18d759b0eb8b5a40d8acbbebcf3374412a7cebb4db4bcec1c00e"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/dremio/dremio-diagnostic-collector/releases/download/v3.4.0/ddc-linux-arm64.zip"
      sha256 "9c81783ea6705a7355f14c2e731a439a5f3b071a788c4f93e656017b47f719af"
    end
  end

  def install
    libexec.install "bin/ddc" => "ddc"
    libexec.install "bin/ddc.yaml" => "ddc.yaml"
    bin.write_exec_script libexec/"ddc"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/ddc", "help"
  end
end
