class AnycableGo < Formula
  desc "Anycable Go WebSocket Server"
  homepage "https://github.com/anycable/anycable-go"
  url "https://github.com/anycable/anycable-go/archive/v0.5.3.tar.gz"
  sha256 "be6026f96d9b5cf7a296a0147b94d9e081abb5c43ec41cce32ee3c8fc1bbe4c1"

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
