require File.join(File.dirname(__FILE__), 'base_kde_formula')

class NepomukCore < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.14.3/src/nepomuk-core-4.14.3.tar.xz'
  sha1 '503eaa3f4386f0547af95aa6c4ad816b281ffd6e'

  depends_on 'kdelibs'
  kde_build_deps
end
