class AnycableGo < Formula
  VERSION = "0.4.2".freeze

  desc "Anycable Go WebSocket Server"
  homepage "https://github.com/anycable/anycable-go"
  url "https://github.com/anycable/anycable-go/archive/#{VERSION}.tar.gz"
  sha256 "1dd69a921bf07ceeff9a45887a2aadd1b21de9c320de894f9ee25ad3f27e9fec"

  head "https://github.com/anycable/anycable-go.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/anycable/anycable-go/").install Dir["*"]
    system "go", "build", "-o", "#{bin}/anycable-go", "-v", "github.com/anycable/anycable-go/"
  end

  test do
    assert_match VERSION, shell_output("#{bin}/anycable-go -version")
  end
end
