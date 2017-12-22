class AnycableGo < Formula
  desc "Anycable Go WebSocket Server"
  homepage "https://github.com/anycable/anycable-go"
  url "https://github.com/anycable/anycable-go/archive/v0.5.3.tar.gz"
  sha256 "7b548685a5470a3ccddbbbafcdc83f35005f2955d4af11c1005f6b6c1ddec01c"

  head "https://github.com/anycable/anycable-go.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/anycable/anycable-go/").install Dir["*"]
    system "go", "build", "-ldflags", "-X main.version=#{version}", "-o", "#{bin}/anycable-go", "-v", "github.com/anycable/anycable-go/"
  end

  test do
    assert_match /#{version}/, shell_output("#{bin}/anycable-go -version")
  end
end
