require "formula"

class G < Formula
  homepage "https://github.com/gtool/g"
  version "1.0.0"

  url "https://github.com/gtool/g/archive/v1.0.0.zip"
  sha1 "3753a1f9068270504ee661945049c71116ff99a2"

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
