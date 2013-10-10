require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopPgQt < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  head 'http://anongit.kde.org/kdevelop-pg-qt', using: :git
  version '1.0'

  depends_on 'kdelibs'
  depends_on 'bison'
  depends_on 'flex'
  depends_on 'flex_sdk'
  kde_build_deps
end
