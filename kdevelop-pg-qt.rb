require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopPgQt < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'git://anongit.kde.org/kdevelop-pg-qt'
  sha1 '7c2b77c7e81d82368285ea38cf1b5cf8160a46f0'

  depends_on 'kdelibs'
  kde_build_deps
end
