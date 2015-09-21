require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kdevelop < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.7.0/src/kdevelop-4.7.0.tar.xz'
  sha1 '6c4becf482956334975886963ba0acf158f2aa15'
  depends_on 'kdevplatform'
  depends_on 'kde-runtime'
  kde_build_deps

  def patches
    DATA
  end
end

__END__
--- a/languages/cpp/codegen/adaptsignatureassistant.cpp
+++ b/languages/cpp/codegen/adaptsignatureassistant.cpp
@@ -18,6 +18,8 @@

 #include "adaptsignatureassistant.h"

+#include <utility>
+
 #include <interfaces/icore.h>
 #include <interfaces/ilanguagecontroller.h>
 #include <language/assistant/renameaction.h>
@@ -33,6 +35,7 @@
 #include "cppduchain.h"
 #include "qtfunctiondeclaration.h"

+
 using namespace KDevelop;
 using namespace Cpp;

@@ -94,7 +97,9 @@
   m_otherSideId = {};
   m_otherSideTopContext = {};
   m_otherSideContext = {};
-  m_oldSignature = {};
+  Signature tempSignature;
+  //m_oldSignature = {};
+  std::swap(m_oldSignature, tempSignature);
   m_document = {};
   m_view.clear();
 }
