require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopPython < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/kdev-python/1.6.1/src/kdev-python-v1.6.1-py3.tar.xz'
  sha1 '9fcb3250fe966ed86c26493ff4b341373c7ed018'

  def patches
    DATA
  end

  depends_on 'kdevelop'
  kde_build_deps
end

__END__
--- a/parser/CMakeLists.txt
+++ b/parser/CMakeLists.txt
@@ -16,7 +16,7 @@
     ${KDE4_KDECORE_LIBS}
     ${KDEVPLATFORM_LANGUAGE_LIBRARIES}
     ${QT_QTCORE_LIBRARY}
-    ${kdevpython_BINARY_DIR}/python-src/libpython2.7-kdevelop.so
+    ${kdevpython_BINARY_DIR}/python-src/libpython2.7.255.dylib
     PARENT_SCOPE
 )
 
@@ -25,7 +25,7 @@
     ${KDE4_KDECORE_LIBS}
     ${KDEVPLATFORM_LANGUAGE_LIBRARIES}
     ${QT_QTCORE_LIBRARY}
-    ${kdevpython_BINARY_DIR}/python-src/libpython2.7-kdevelop.so
+    ${kdevpython_BINARY_DIR}/python-src/libpython2.7.255.dylib
 )
 
 add_dependencies(kdev4pythonparser parser)
--- a/python-src/CMakeLists.txt
+++ b/python-src/CMakeLists.txt
@@ -1,5 +1,5 @@
 add_custom_command(
-    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/libpython2.7-kdevelop.so
+    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/libpython2.7.255.dylib
     COMMAND /bin/bash ${CMAKE_CURRENT_SOURCE_DIR}/configure --enable-shared --without-pymalloc WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
     COMMAND /usr/bin/env make -C ${CMAKE_CURRENT_BINARY_DIR}
 )
@@ -7,8 +7,8 @@
 add_custom_target(
     parser
     COMMAND cmake -E echo
-    DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/libpython2.7-kdevelop.so
+    DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/libpython2.7.255.dylib
 )

-install(FILES ${CMAKE_CURRENT_BINARY_DIR}/libpython2.7-kdevelop.so.1.0 DESTINATION ${LIB_INSTALL_DIR})
+install(FILES ${CMAKE_CURRENT_BINARY_DIR}/libpython2.7.255.dylib DESTINATION ${LIB_INSTALL_DIR})

--- a/python-src/configure
+++ b/python-src/configure
@@ -553,8 +553,8 @@
 # Identity of this package.
 PACKAGE_NAME='python'
 PACKAGE_TARNAME='python'
-PACKAGE_VERSION='2.7-kdevelop'
-PACKAGE_STRING='python 2.7-kdevelop'
+PACKAGE_VERSION='2.7.255'
+PACKAGE_STRING='python 2.7.255'
 PACKAGE_BUGREPORT='http://bugs.python.org/'
 PACKAGE_URL=''
 
@@ -2699,7 +2699,7 @@
 mv confdefs.h.new confdefs.h
 
 
-VERSION="2.7-kdevelop"
+VERSION="2.7.255"
 
 
 SOVERSION=1.0
