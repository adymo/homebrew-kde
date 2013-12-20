require 'formula'

class Vc < Formula
  homepage 'http://code.compeng.uni-frankfurt.de/projects/vc/'
  url 'git://code.compeng.uni-frankfurt.de/vc.git', :branch => '0.7'
  head 'git://code.compeng.uni-frankfurt.de/vc.git', :branch => 'master'

  depends_on 'cmake' => :build

  def install
    mkdir 'build' do
      system "cmake", "..", "-DBUILD_TESTING=OFF", *std_cmake_args
      system "make"
      system "make install"
    end
  end
end
