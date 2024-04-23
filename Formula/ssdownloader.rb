#  Copyright 2022 Ryan Svihla
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
class Ssdownloader < Formula

  desc "ssdownloader integrates Zendesk and SendSafely APIs to easily download tickets@"
  homepage "https://github.com/rsvihladremio/ssdownloader"
  license "Apache-2.0"
  version "0.4.11"
  on_macos do

    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v#{version}/ssdownloader-darwin-amd64.zip"
      sha256 "de65ef5e3fec99b83e369770ce60e1458b7e4d4394f0c653ed8fc0ba603fd6ce"
    end

    if Hardware::CPU.arm?
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v#{version}/ssdownloader-darwin-arm64.zip"
      sha256 "0b312f43eac0ba88adebb8731bfbb9084d7d69281b9afa77479ce1c5d5538e6a"
    end
  end

  on_linux do

    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v#{version}/ssdownloader-linux-amd64.zip"
      sha256 "583a4072752c67ee2e72d5ddb199c3166a81335cbc36adbda3faf9d98eddb324"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v#{version}/ssdownloader-linux-arm64.zip"
      sha256 "178b9394948502bc35dcbcbfbe5134b98803ca376b3ac0d25b41b695982fc1f5"
    end
  end

  def install
    bin.install "ssdownloader" => "ssdownloader"
  end
  test do
    # Add test logic here if applicable
    system "#{bin}/ssdownloader", "version"
  end

end
