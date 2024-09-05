class Dqd < Formula
  desc "identifies problems in dremio"
  homepage "https://github.com/rsvihladremio/dqd"
  version "0.12.1"

  on_macos do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.12.1/dqd-0.12.1-mac-intel.zip"
      sha256 "44963a3ba7ac405b6016bebacb995c0404c08255e5c3a40afd7484b565d50533"
    end

    if Hardware::CPU.arm?
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.12.1/dqd-0.12.1-mac-apple-silicon.zip"
      sha256 "ca92ab9090f93f3257b15af99a9c765a36139fc6d3b79fe00506e92d87ba66ce"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/dqd/releases/download/v0.12.1/dqd-0.12.1-linux-amd64.zip"
      sha256 "ce23a601d7c7a7eb4b38eab1a2ac40159b74bf62f3b9518fe7c694bbd4282420"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url ""
      sha256 ""
    end
  end

  def install
    libexec.install "dqd" => "dqd"
    bin.write_exec_script libexec/"dqd"
  end

  test do
    # Add test logic here if applicable
    system "#{bin}/dqd", "help"
  end
end
