require 'formula'

class OxygenIcons < Formula
  homepage 'http://www.oxygen-icons.org'
  url 'http://download.kde.org/stable/4.12.2/src/oxygen-icons-4.12.2.tar.xz'
  sha1 '5675835df6bacad7231ad21f1839a4fc753289ff'
  
  depends_on 'cmake' => :build

  def install
    system "cmake #{std_cmake_parameters} ."
    system "make install"
  end
end