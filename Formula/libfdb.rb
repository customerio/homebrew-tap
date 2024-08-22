class Libfdb < Formula
    desc "FDB Client Libraries"
    homepage "https://apple.github.io/foundationdb/"
    url "https://github.com/apple/foundationdb/releases/download/7.3.26/FoundationDB-7.3.26_arm64.pkg"
    sha256 "86c77e3593760c11d54805b30c9015997e17df464d24291aad54a76473078eea"
    license "Apache-2.0"

    def install
      system "pkgutil", "--expand-full", buildpath/"FoundationDB-7.3.26_arm64.pkg", buildpath/"contents"

      bin.install "contents/FoundationDB-clients.pkg/Payload/usr/local/bin/fdbcli"
      include.install Dir["contents/FoundationDB-clients.pkg/Payload/usr/local/include/foundationdb"]
      lib.install "contents/FoundationDB-clients.pkg/Payload/usr/local/lib/libfdb_c.dylib" => shared_library("libfdb_c")

      bin.install_symlink
    end
end
