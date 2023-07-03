class OpenCamp < Formula
  desc "Simple CLI for interacting with the recreation.gov API"
  homepage "https://github.com/opencamp-hq/cli"
  url "https://github.com/opencamp-hq/cli/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/opencamp-hq/cli"
    # Copy all files from their current location (GOPATH root)
    # to $GOPATH/src/github.com/opencamp-hq/cli
    bin_path.install Dir["*"]
    cd bin_path do
      # Install the compiled binary into Homebrew's `bin` - a pre-existing
      # global variable
      system "go", "build", "-o", bin/"opencamp", "."
    end
  end

  test do
    system "#{bin}/binary_name", "--version"
  end
end
