require "formula"

class G < Formula
  homepage "https://github.com/gtool/g"
  version "1.0.1"

  url "https://github.com/gtool/g/archive/v1.0.1.zip"
  sha1 "f9a3e525b2f6b9648bd7a67db3c2a69316359a6f"

  def install
    bin.install Dir['bin/**']
    libexec.install Dir['libexec/**']
    share.install Dir['share/**']
    (prefix/'completions').install Dir['completions/**']
  end

  def caveats; <<-EOS.undent
  To enable autocompletion make the following steps:

  Bash users:

    echo 'eval "$(g init -)"' >> ~/.bash_profile
    exec bash

  Zsh users:

    echo 'eval "$(g init -)"' >> ~/.zshenv
    source ~/.zshenv

  More information here: https://github.com/gtool/g
    EOS
  end

  test do
    assert_equal `#{bin}/g h`.split("\n").first, 'Usage: g h [subcommand]'
  end
end
