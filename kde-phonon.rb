require 'formula'

class KdePhonon < Formula
  homepage 'http://phonon.kde.org/'
  url 'http://download.kde.org/stable/phonon/4.7.2/phonon-4.7.2.tar.xz'
  sha1 '2b98fa96cefbbef53d77dd0e6d830889da367c37'

  depends_on 'xz' => :build
  depends_on 'cmake' => :build
  depends_on 'automoc4' => :build
  depends_on 'qt' => ["with-d-bus", "with-qt3support"]
  depends_on 'glib' => :build

  keg_only "This package is already supplied by Qt and is only needed by KDE packages."

  def install
    inreplace 'cmake/FindPhononInternal.cmake',
        'BAD_ALLOCATOR AND NOT WIN32', 'BAD_ALLOCATOR AND NOT APPLE'
    system "cmake #{std_cmake_parameters} ."
    system "make install"
  end
end
