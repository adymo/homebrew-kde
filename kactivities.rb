require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kactivities < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.11.1/src/kactivities-4.11.1.tar.xz'
  sha1 '3f0ca0c366ba377075ba36c2417497ad0829cf1a'

  depends_on 'kdelibs'
  kde_build_deps
end
