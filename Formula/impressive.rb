class Impressive < Formula
  desc "Create and edit native Bricks websites"
  homepage "https://impressive.chamberlain.agency/"
  url "https://github.com/Chamberlain-Agency/install/releases/download/impressive-0.4.0-unified.51/impressive-0.4.0-unified.51.zip"
  version "0.4.0-unified.51"
  sha256 "a74c7b42b50681af2d9c13f4cac3de777bd597a58593890ba443b1066d5ee468"
  license :cannot_represent
  depends_on "node"
  depends_on "python@3.13"
  def install
    libexec.install buildpath.children
    (bin/"impressive").write <<~EOS
      #!/bin/sh
      exec "#{Formula["node"].opt_bin}/node" "#{opt_libexec}/helpers/cli.cjs" "$@"
    EOS
    (bin/"impressive").chmod 0755
  end
end
