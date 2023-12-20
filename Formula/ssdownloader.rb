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
  version "0.4.10"
  on_macos do

    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v#{version}/ssdownloader-darwin-amd64.zip"
      sha256 "b2860d395a9077a3835ef87ba78e6f57a2b0e8d795d3466dafd7b436a0051d2a"
    end

    if Hardware::CPU.arm?
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v#{version}/ssdownloader-darwin-arm64.zip"
      sha256 "3f055824d261bc4bfc9350b707f444545f398aa9a3d2113fa9db6573fd85ffd9"
    end
  end

  on_linux do

    if Hardware::CPU.intel?
      # Define the download URLs and corresponding SHA256 checksums for the binary releases
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v#{version}/ssdownloader-linux-amd64.zip"
      sha256 "16b253d52722ee70850b9b95528c61375df5af23017628fb06def489770c9672"
    end

    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rsvihladremio/ssdownloader/releases/download/v#{version}/ssdownloader-linux-arm64.zip"
      sha256 "bbaeb3a595a5e3406f61ae7d4c50d4360d0fba249db88afa15b58fd3e48a6979"
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
