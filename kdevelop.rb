require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kdevelop < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.5.1/src/kdevelop-4.5.1.tar.bz2'
  sha1 'e27b77bca0b4c466f66b24167ec416f20b353f6f'
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
