require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdeRuntime < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.11.1/src/kde-runtime-4.11.1.tar.xz'
  sha1 '3457ffdbd1921bc6bc78cd8a9a463822d515b079'

  depends_on 'oxygen-icons'
  depends_on 'kde-phonon'
  depends_on 'kdelibs'
  depends_on 'nepomuk-core'
  depends_on 'kdepimlibs'
  depends_on 'kactivities'
  kde_build_deps

  def patches
    DATA
  end

  def extra_cmake_args
    phonon = Formula.factory 'kde-phonon'
    "-DPHONON_INCLUDE_DIR=#{phonon.include} -DPHONON_LIBRARY=#{phonon.lib}/libphonon.dylib"
  end
end

__END__
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -79,7 +79,7 @@
 # Background processes
 add_subdirectory(kpasswdserver)
 add_subdirectory(kdontchangethehostname)
-add_subdirectory(kglobalaccel)
+# add_subdirectory(kglobalaccel)
 add_subdirectory(knotify)
 add_subdirectory(ktimezoned)
