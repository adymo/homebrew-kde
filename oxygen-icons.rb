require 'formula'

class OxygenIcons < Formula
  homepage 'http://www.oxygen-icons.org'
  url 'http://download.kde.org/stable/4.13.0/src/oxygen-icons-4.13.0.tar.xz'
  sha1 'e43fd0a6ec385943ef4cef7e22c2770a924ff01c'
  
  depends_on 'cmake' => :build

  def install
    system "cmake #{std_cmake_parameters} ."
    system "make install"
  end
end