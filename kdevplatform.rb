require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kdevplatform < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.6.0/src/kdevplatform-1.6.0.tar.xz'
  sha1 '8ed8ccb63b64a3675716f1ad14b4a73fcbf4133d'

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
--- a/util/google/sparsehash/sparseconfig.h
+++ b/util/google/sparsehash/sparseconfig.h
@@ -5,13 +5,13 @@
 #define GOOGLE_NAMESPACE ::google

 /* the location of <hash_fun.h>/<stl_hash_fun.h> */
-#define HASH_FUN_H "hash_fun.h"
+#define HASH_FUN_H <functional>

 /* the location of <hash_map> */
 #define HASH_MAP_H <ext/hash_map>

 /* the namespace of hash_map/hash_set */
-#define HASH_NAMESPACE __gnu_cxx
+#define HASH_NAMESPACE std

 /* the location of <hash_set> */
 #define HASH_SET_H <ext/hash_set>
