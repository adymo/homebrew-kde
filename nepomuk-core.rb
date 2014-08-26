require File.join(File.dirname(__FILE__), 'base_kde_formula')

class NepomukCore < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.14.0/src/nepomuk-core-4.14.0.tar.xz'
  sha1 'a7e337060ee7b8925ede888faca4d73b36031a74'

  depends_on 'kdelibs'
  kde_build_deps
end
