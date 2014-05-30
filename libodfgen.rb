require 'formula'

class Libodfgen < Formula
  homepage 'http://sf.net/p/libwpd/libodfgen/'
  url 'http://dev-www.libreoffice.org/src/libodfgen-0.1.0.tar.bz2'
  sha1 'e901a0aabaab83fbe8665f477e7f3655c5a38031'

  depends_on 'pkg-config' => :build
  depends_on 'boost' => :build
  depends_on 'libtool' => :build
  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libwpd'
  depends_on 'librevenge'
  depends_on 'libwpg'
  depends_on 'libetonyek'

  def install
    system "./configure", "--without-docs",
                          "--disable-dependency-tracking",
                          "--enable-static=no",
                          "--with-sharedptr=boost",
                          "--disable-werror",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
