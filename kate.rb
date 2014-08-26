require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kate < BaseKdeFormula
  homepage 'http://kate-editor.org'
  url 'http://download.kde.org/stable/4.14.0/src/kate-4.14.0.tar.xz'
  sha1 '3b8bead7f5cbfa754ba31f27ddcf6f330decf4d3'

  depends_on 'kdelibs'
  depends_on 'kde-runtime'
  kde_build_deps

  def patches
    DATA
  end
end

__END__
--- a/kwrite/kwritemain.h
+++ b/kwrite/kwritemain.h
@@ -44,7 +44,7 @@
 class KRecentFilesAction;
 class KSqueezedTextLabel;

-class KWrite : public KParts::MainWindow
+class KTEXTEDITOR_EXPORT KWrite : public KParts::MainWindow
 {
   Q_OBJECT


