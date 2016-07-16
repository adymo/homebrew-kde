require 'formula'

class Attica < Formula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/attica/attica-0.4.2.tar.bz2'
  sha1 '5ae4adcb99db839902b70afd3d1cc7fd471bacd7'
  
  depends_on 'cmake' => :build
  depends_on 'qt' => ["with-d-bus", "with-qt3support"]

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end
end
