class Dockyard < Formula
  desc "TUI for browsing and applying Starship prompt presets"
  homepage "https://github.com/MerrickWykman/dockyard"
  version "1.0.1"

  # After each release, update the version above and replace the SHA256 values
  # below with the checksums printed in the "Print SHA256 checksums" step of
  # the release workflow run.

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/MerrickWykman/dockyard/releases/download/v#{version}/dockyard-mac-arm64"
      sha256 "c687b4c2714a044a3d902a5bad359a9a4d4c241507b1c0f1171ca02693ad8c61"
    else
      url "https://github.com/MerrickWykman/dockyard/releases/download/v#{version}/dockyard-mac-amd64"
      sha256 "9d49d8bffa525a549c7c667efbcf2b0f6c6e4f86feb9d4252a877d1e1e928e27"
    end
  end

  on_linux do
    url "https://github.com/MerrickWykman/dockyard/releases/download/v#{version}/dockyard-linux-amd64"
    sha256 "2e0dace8f0605de6d8b30932f63ec5582f6a1878d339d9a138cd059fc66afc7d"
  end

  def install
    if OS.mac?
      bin.install "dockyard-mac-arm64" => "dockyard" if Hardware::CPU.arm?
      bin.install "dockyard-mac-amd64" => "dockyard" if Hardware::CPU.intel?
    else
      bin.install "dockyard-linux-amd64" => "dockyard"
    end
  end

  test do
    system "#{bin}/dockyard", "--version"
  end
end
