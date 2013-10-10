require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kate < BaseKdeFormula
  homepage 'http://kate-editor.org'
  url 'http://download.kde.org/stable/4.11.1/src/kate-4.11.1.tar.xz'
  sha1 '42fa2138526b288a1717fa0c7ac713e90e92670e'

  depends_on 'kdelibs'
  depends_on 'kde-runtime'
  kde_build_deps
end
