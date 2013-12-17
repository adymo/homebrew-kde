require File.join(File.dirname(__FILE__), 'base_kde_formula')

class NepomukCore < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.11.4/src/nepomuk-core-4.11.4.tar.xz'
  sha1 '982e3de5e6a2a18fadb9a11f44fdc302f3b6f5e0'

  depends_on 'kdelibs'
  kde_build_deps
end
