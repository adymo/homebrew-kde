require File.join(File.dirname(__FILE__), 'base_kde_formula')

class OxygenIcons < BaseKdeFormula
  homepage 'http://www.oxygen-icons.org'
  url 'http://download.kde.org/stable/4.11.1/src/oxygen-icons-4.11.1.tar.xz'
  sha1 '3c80c53eec1cb14b309d068be66775d9d8d7d38d'

  kde_build_deps
end
