require 'formula'

class Libetonyek < Formula
  homepage 'http://www.freedesktop.org/wiki/Software/libetonyek/'
  url 'http://dev-www.libreoffice.org/src/libetonyek-0.0.3.tar.xz'
  sha1 '8831621fb585aec5747a55cc0030e4ab646afb0f'

  depends_on 'pkg-config' => :build
  depends_on 'boost' => :build
  depends_on 'libtool' => :build
  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libwpd'

  def install
    system "./autogen.sh"
    system "./configure", "--without-docs",
                          "--disable-dependency-tracking",
                          "--enable-static=no",
                          "--disable-werror",
                          "--disable-tests",
                          "--prefix=#{prefix}"
    system "make"
    ENV.deparallelize # Needs a serialized install
    system "make install"
  end
end
