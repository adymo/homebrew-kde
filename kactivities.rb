require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kactivities < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.13.0/src/kactivities-4.13.0.tar.xz'
  sha1 '4be8bf412c1288e60ee773b192922dccd40be042'

  depends_on 'kdelibs'
  kde_build_deps
end
