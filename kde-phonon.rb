require 'formula'

class KdePhonon < Formula
  homepage 'http://phonon.kde.org/'
  url 'http://download.kde.org/stable/phonon/4.8.3/src/phonon-4.8.3.tar.xz'
  sha1 'aac5dc44ae4821e6165c6735b9c6063dd111ac03'

  depends_on 'xz' => :build
  depends_on 'cmake' => :build
  depends_on 'automoc4' => :build
  depends_on 'qt' => ["with-d-bus", "with-qt3support"]
  depends_on 'glib' => :build

  keg_only "This package is already supplied by Qt and is only needed by KDE packages."

  def install
    inreplace 'cmake/FindPhononInternal.cmake',
        'BAD_ALLOCATOR AND NOT WIN32', 'BAD_ALLOCATOR AND NOT APPLE'
    system "cmake", ".", *std_cmake_args
    system "make install"
  end
end
