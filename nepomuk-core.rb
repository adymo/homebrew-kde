require File.join(File.dirname(__FILE__), 'base_kde_formula')

class NepomukCore < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.11.1/src/nepomuk-core-4.11.1.tar.xz'
  sha1 'a4ca9b755ffd667f8fd7277d0ef3355dbf9e0298'

  depends_on 'kdelibs'
  kde_build_deps
end
