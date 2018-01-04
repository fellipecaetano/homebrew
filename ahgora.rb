require "language/node"

class Ahgora < Formula
  desc "A client for Ahgora, an application that manages working hours"
  homepage "https://github.com/ahgora-client"
  url "https://github.com/fellipecaetano/ahgora-client/archive/v1.0.0.tar.gz"
  sha256 "77cc1db3b3019243a4e86161e79da491878c9478fd115db817bb51a612267451"

  bottle :unneeded
  depends_on "node" => :recommended

  def install
    libexec.install Dir["*"]
    system "npm", "install", libexec, *Language::Node.local_npm_install_args
    (bin/"ahgora").write_env_script "#{libexec}/index.js", :PREFIX => HOMEBREW_PREFIX
  end
end
