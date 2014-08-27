require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopPython < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'http://download.kde.org/stable/kdevelop/4.7.0/src/kdev-python-1.7.0.tar.xz'
  sha1 '559dc7f8c3a69844af92eb581b7205346b2fcd10'

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
--- a/pythonlanguagesupport.cpp
+++ b/pythonlanguagesupport.cpp
@@ -186,10 +186,14 @@
     autopep8.setOverrideSample("class klass:\n def method(arg1,arg2):\n  a=3+5\n"
                                "def function(arg,*vararg,**kwargs): return arg+kwarg[0]\nfunction(3, 5, 7)");
     using P = SourceFormatterStyle::MimeHighlightPair;
-    autopep8.setMimeTypes(SourceFormatterStyle::MimeList{ P{"text/x-python", "Python"} });
+    SourceFormatterStyle::MimeList list;
+    list << P{"text/x-python", "Python"};
+    autopep8.setMimeTypes(list);
     autopep8.setContent("/usr/bin/pep8ify -w $TMPFILE");

-    return SourceFormatterItemList{SourceFormatterStyleItem{"customscript", autopep8}};
+    SourceFormatterItemList result;
+    result << SourceFormatterStyleItem{"customscript", autopep8};
+    return result;
 }

 KDevelop::ILanguage *LanguageSupport::language()
