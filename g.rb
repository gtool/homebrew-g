require "formula"

class G < Formula
  homepage "https://github.com/gtool/g"
  version "1.0.2"

  url "https://github.com/gtool/g/archive/v1.0.2.zip"
  sha1 "85f639f50f1f704586b99b2a0c7b2325a59b0bc5"

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
