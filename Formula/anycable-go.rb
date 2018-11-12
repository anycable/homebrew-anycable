class AnycableGo < Formula
  desc "Anycable Go WebSocket Server"
  homepage "https://github.com/anycable/anycable-go"
  url "https://github.com/anycable/anycable-go/archive/v0.6.0.tar.gz"
  sha256 "92277be386ca76b9e575d9d1301189cf2915fce7ceb2a2a00b0b3c6d25e36d3c"

  head "https://github.com/anycable/anycable-go.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/anycable/anycable-go/").install Dir["*"]
    system "go", "build", "-ldflags", "-X main.version=#{version}", "-o", "#{bin}/anycable-go", "-v", "github.com/anycable/anycable-go/"
  end

  test do
    assert_match /#{version}/, shell_output("#{bin}/anycable-go -v")
  end
end
