require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Marble < BaseKdeFormula
  homepage 'http://marble.kde.org/'
  url "http://download.kde.org/stable/4.13.2/src/marble-4.13.2.tar.xz"
  sha1 "007dbe5abc646a1c54b2661fa417db8f63f45b3a"

  def patches
    # Preserve CMake files (needed by Digikam)
    {:p0 => 'https://gist.github.com/tlvince/7960812/raw/f96e2f2d1a681c6329da9fc9ac3dbf6c18577b0a/marble-homebrew-cmakelists.diff'}
  end

  def extra_cmake_args
    # Prevent 'marble-qt.app' from being installed in '/usr/local'
    "-DCMAKE_INSTALL_PREFIX=#{prefix}"
  end

  kde_build_deps
end

