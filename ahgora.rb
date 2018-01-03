require "language/node"

class Ahgora < Formula
  desc "A client for Ahgora, an application that manages working hours"
  homepage "https://github.com/ahgora-client"
  url "https://github.com/fellipecaetano/ahgora-client/archive/v0.1.2.tar.gz"
  sha256 "33917b8a1a579ac7bd6351abac549caada39a546785d287e7a86ef969f1797c1"

  bottle :unneeded
  depends_on "node" => :recommended

  def install
    libexec.install Dir["*"]
    system "npm", "install", *Language::Node.local_npm_install
    (bin/"ahgora").write_env_script "#{libexec}/index.js", :PREFIX => HOMEBREW_PREFIX
  end
end
