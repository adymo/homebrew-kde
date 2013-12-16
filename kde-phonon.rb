require 'formula'

class KdePhonon < Formula
  homepage 'http://phonon.kde.org/'
  url 'http://download.kde.org/stable/phonon/4.6.0/src/phonon-4.6.0.tar.xz'
  sha1 'd8dbc188b58c6dd9c6a73d3742a25291e647bb95'

  depends_on 'xz' => :build
  depends_on 'cmake' => :build
  depends_on 'automoc4' => :build
  depends_on 'qt'
  depends_on 'glib' => :build

  keg_only "This package is already supplied by Qt and is only needed by KDE packages."

  def install
    inreplace 'cmake/FindPhononInternal.cmake',
        'BAD_ALLOCATOR AND NOT WIN32', 'BAD_ALLOCATOR AND NOT APPLE'
    system "cmake #{std_cmake_parameters} ."
    system "make install"
  end
end
