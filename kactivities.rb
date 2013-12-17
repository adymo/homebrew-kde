require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kactivities < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.11.4/src/kactivities-4.11.4.tar.xz'
  sha1 '627875e631e03ea0a2dc04b4780e694918dd0b54'

  depends_on 'kdelibs'
  kde_build_deps
end
