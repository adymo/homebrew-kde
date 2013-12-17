require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kdevelop < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.6.0/src/kdevelop-4.6.0.tar.xz'
  sha1 '2b723c3e16c41dbcd9817336893eff85712cb11d'
  depends_on 'kdevplatform'
  depends_on 'kde-runtime'
  kde_build_deps

  def patches
    DATA
  end

end

__END__
--- a/languages/cpp/tests/CMakeLists.txt
+++ b/languages/cpp/tests/CMakeLists.txt
@@ -103,7 +103,6 @@
     kdev4cppduchain
     kdev4cpprpp
     kdev4cppparser
-    kdevcpplanguagesupport
     ${KDEVPLATFORM_INTERFACES_LIBRARIES}
     ${KDEVPLATFORM_PROJECT_LIBRARIES}
     ${KDE4_THREADWEAVER_LIBRARIES}
