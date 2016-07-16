require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdeRuntime < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.14.3/src/kde-runtime-4.14.3.tar.xz'
  sha1 'd25357bf7e5d3922ce0c9b60921fb2fd738b7251'

  depends_on 'oxygen-icons'
  depends_on 'kde-phonon'
  depends_on 'kdelibs'
  depends_on 'nepomuk-core'
  depends_on 'kdepimlibs'
  depends_on 'kactivities'
  depends_on 'libgcrypt'
  kde_build_deps

  def patches
    DATA
  end

  def extra_cmake_args
    phonon = Formula.factory 'kde-phonon'
    %W[-DPHONON_INCLUDE_DIR=#{phonon.include} -DPHONON_LIBRARY=#{phonon.lib}/libphonon.dylib]
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

--- a/kwalletd/kwalletd.h
+++ b/kwalletd/kwalletd.h
@@ -184,7 +184,7 @@
	void processTransactions();
	void activatePasswordDialog();
 #ifdef Q_WS_X11
-        void connectToScreenSaver();
+#        void connectToScreenSaver();
 #endif

    private:
