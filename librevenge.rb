require 'formula'

class Librevenge < Formula
  homepage 'http://sf.net/p/libwpd/librevenge/'
  version '0.0.0git'
  url 'git://git.code.sf.net/p/libwpd/librevenge', :branch => 'master'

  depends_on 'pkg-config' => :build
  depends_on 'boost' => :build

  def install
    system "./autogen.sh"
    system "./configure", "--without-docs",
                          "--disable-dependency-tracking",
                          "--enable-static=no",
                          "--disable-werror"
    system "make install"
  end
end
