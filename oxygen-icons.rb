require 'formula'

class OxygenIcons < Formula
  homepage 'http://www.oxygen-icons.org'
  url 'http://download.kde.org/stable/4.14.3/src/oxygen-icons-4.14.3.tar.xz'
  sha1 'ad459d986f6282fa11569a72e665c2dce0c1a3d9'

  depends_on 'cmake' => :build

  def install
    system "cmake #{std_cmake_parameters} ."
    system "make install"
  end
end