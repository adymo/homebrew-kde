require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Marble < BaseKdeFormula
  homepage 'http://marble.kde.org/'
  url 'http://download.kde.org/stable/4.11.4/src/marble-4.11.4.tar.xz'
  sha1 '7569630e8b2fdaafb2fdf6da79aa165ead17e842'

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
