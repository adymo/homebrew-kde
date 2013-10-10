require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kdevplatform < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.5.1/src/kdevplatform-1.5.1.tar.bz2'
  sha1 'af3e78b55c4aec97e271bc06c59186cdf77fe3d1'

  def patches
    DATA
  end

  depends_on 'grantlee'
  depends_on 'kdelibs'
  kde_build_deps
end

__END__
--- a/project/abstractfilemanagerplugin.cpp
+++ b/project/abstractfilemanagerplugin.cpp
@@ -467,8 +467,9 @@
                 this, SLOT(created(QString)));
         connect(d->m_watchers[project], SIGNAL(deleted(QString)),
                 this, SLOT(deleted(QString)));
-
+#ifndef Q_OS_MAC
         d->m_watchers[project]->addDir(project->folder().toLocalFile(), KDirWatch::WatchSubDirs | KDirWatch:: WatchFiles );
+#endif
     }

     return projectRoot;
