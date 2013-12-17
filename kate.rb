require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kate < BaseKdeFormula
  homepage 'http://kate-editor.org'
  url 'http://download.kde.org/stable/4.11.4/src/kate-4.11.4.tar.xz'
  sha1 'a6428ad1ae569c6be9192e2fe1db3cd844a257fc'

  depends_on 'kdelibs'
  depends_on 'kde-runtime'
  kde_build_deps
end
