require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Strigi < BaseKdeFormula
  homepage 'http://strigi.sourceforge.net/'
  url 'http://www.vandenoever.info/software/strigi/strigi-0.7.8.tar.bz2'
  sha1 '7250fb15109d33b0c49995a2cc3513ba7d937882'

  kde_build_deps
  depends_on 'clucene'
  depends_on 'd-bus'
  depends_on 'exiv2' => :optional

  def patches
    DATA
  end

  def extra_cmake_args
    "-DENABLE_EXPAT:BOOL=ON"
  end

  def install
    ENV['CLUCENE_HOME'] = HOMEBREW_PREFIX
    ENV['EXPAT_HOME'] = '/usr/'

    default_install
  end
end

__END__
--- a/libstreamanalyzer/plugins/endplugins/ffmpegendanalyzer.cpp
+++ b/libstreamanalyzer/plugins/endplugins/ffmpegendanalyzer.cpp
@@ -56,22 +56,22 @@
     signed char analyze(AnalysisResult& idx, ::InputStream* in);
 };
 
-STRIGI_MUTEX_DEFINE(mutex);
+STRIGI_MUTEX_DEFINE(strigi_mutex);
 
 static int
 lockmgr(void **mtx, enum AVLockOp op) {
   // pre-allocating a single mutex is the only way to get it to work without changing strigi_thread.h
-  assert( (*mtx == &mutex) || (op == AV_LOCK_CREATE) );
+  assert( (*mtx == &strigi_mutex) || (op == AV_LOCK_CREATE) );
   switch(op) {
   case AV_LOCK_CREATE:
-    *mtx = &mutex;
-    return !!STRIGI_MUTEX_INIT(&mutex);
+    *mtx = &strigi_mutex;
+    return !!STRIGI_MUTEX_INIT(&strigi_mutex);
   case AV_LOCK_OBTAIN:
-    return !!STRIGI_MUTEX_LOCK(&mutex);
+    return !!STRIGI_MUTEX_LOCK(&strigi_mutex);
   case AV_LOCK_RELEASE:
-    return !!STRIGI_MUTEX_UNLOCK(&mutex);
+    return !!STRIGI_MUTEX_UNLOCK(&strigi_mutex);
   case AV_LOCK_DESTROY:
-    STRIGI_MUTEX_DESTROY(&mutex);
+    STRIGI_MUTEX_DESTROY(&strigi_mutex);
     return 0;
   }
   return 1;
--- a/libstreamanalyzer/cmake/FindCLucene1.cmake
+++ b/libstreamanalyzer/cmake/FindCLucene1.cmake
@@ -5,3 +5,4 @@
 
 pkg_check_modules(CLUCENE1 libclucene-core)
 
+SET(CLUCENE1_LDFLAGS ${CLUCENE1_LDFLAGS} -lclucene-shared)
