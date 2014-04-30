require File.join(File.dirname(__FILE__), 'base_kde_formula')

class NepomukCore < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.13.0/src/nepomuk-core-4.13.0.tar.xz'
  sha1 '44e65063138088be91f03c8bb7ff8be7cd255984'

  depends_on 'kdelibs'
  kde_build_deps
end
