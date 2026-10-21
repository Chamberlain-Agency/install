class Locke < Formula
  desc "Save chats and continue work through your connected Google Drive"
  homepage "https://locke.chamberlain.agency/"
  url "https://github.com/Chamberlain-Agency/install/releases/download/locke-0.4.33/locke-0.4.33.zip"
  version "0.4.33"
  sha256 "f81a414f46b8347616e0f7e6cc9cc9d4030a5bdb43945a6ee101c0710dcff2fa"
  license :cannot_represent
  depends_on "node"
  def install
    libexec.install buildpath.children
    (bin/"locke").write <<~EOS
      #!/bin/sh
      exec "#{Formula["node"].opt_bin}/node" "#{opt_libexec}/runtime/launcher.mjs" "$@"
    EOS
    (bin/"locke").chmod 0755
  end
  def caveats
    "Installation: https://locke.chamberlain.agency/install.md"
  end
end
