require 'formula'

class OxygenIcons < Formula
  homepage 'http://www.oxygen-icons.org'
  url 'http://download.kde.org/stable/4.14.0/src/oxygen-icons-4.14.0.tar.xz'
  sha1 'bc3d640258504c418e0445c25760b917f5f437cc'
  
  depends_on 'cmake' => :build

  def install
    system "cmake #{std_cmake_parameters} ."
    system "make install"
  end
end