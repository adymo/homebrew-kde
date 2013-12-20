require 'formula'

class Libodfgen < Formula
  homepage 'http://sf.net/p/libwpd/libodfgen/'
  url 'http://dev-www.libreoffice.org/src/libodfgen-0.0.4.tar.bz2'
  sha1 '78deefd6b9db4a97c90bec16b0ab139ed187892a'

  depends_on 'pkg-config' => :build
  depends_on 'libwpd'
  depends_on 'libwpg'
  depends_on 'libetonyek'
  depends_on 'librevenge'

  def install
    system "./autogen.sh"
    system "./configure", "--without-docs",
                          "--disable-dependency-tracking",
                          "--enable-static=no"
    system "make install"
  end
end
