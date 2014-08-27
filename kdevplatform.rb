require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kdevplatform < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.7.0/src/kdevplatform-1.7.0.tar.xz'
  sha1 '9fc196e7cb09ab33fd5cfbf5af19aa7c513efdc9'

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
@@ -472,7 +472,9 @@
         connect(d->m_watchers[project], SIGNAL(deleted(QString)),
                 this, SLOT(deleted(QString)));

+#ifndef Q_OS_MAC
         d->m_watchers[project]->addDir(project->path().toLocalFile(), KDirWatch::WatchSubDirs | KDirWatch:: WatchFiles );
+#endif
     }

     d->m_filters.add(project);
--- a/plugins/standardoutputview/outputwidget.cpp
+++ b/plugins/standardoutputview/outputwidget.cpp
@@ -422,7 +422,7 @@
         ? iface->previousHighlightIndex( index )
         : iface->nextHighlightIndex( index );

-    kDebug() << "selecting item" << select << index << newIndex;
+    // kDebug() << "selecting item" << select << index << newIndex;
     activateIndex(newIndex, view, iface);
 }
