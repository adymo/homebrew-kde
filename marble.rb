require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Marble < BaseKdeFormula
  homepage 'http://marble.kde.org/'
  url 'http://download.kde.org/stable/4.11.4/src/marble-4.11.4.tar.xz'
  sha1 '7569630e8b2fdaafb2fdf6da79aa165ead17e842'

  kde_build_deps
end
