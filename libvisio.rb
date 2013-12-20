require 'formula'

class Libvisio < Formula
  homepage 'http://www.freedesktop.org/wiki/Software/libvisio/'
  url 'http://dev-www.libreoffice.org/src/libvisio-0.0.31.tar.xz'
  sha1 'c494799dac0931c97ec3e45569f92dcae2969b89'

  depends_on 'pkg-config' => :build
  depends_on 'libwpd'
  depends_on 'libwpg'
  depends_on 'icu4c'

  def install
    icu4c = Formula.factory('icu4c')
    system "./configure", "--without-docs",
                          "-disable-dependency-tracking",
                          "--enable-static=no",
                          "--prefix=#{prefix}:#{icu4c.prefix}"
    # Separate steps or install can fail due to folders not existing
    system "make"
    ENV.j1
    system "make install"
  end
end
