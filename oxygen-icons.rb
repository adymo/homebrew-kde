require File.join(File.dirname(__FILE__), 'base_kde_formula')

class OxygenIcons < BaseKdeFormula
  homepage 'http://www.oxygen-icons.org'
  url 'http://download.kde.org/stable/4.11.4/src/oxygen-icons-4.11.4.tar.xz'
  sha1 '52350a2c230142b078dc5dfe95503ec82025c34d'

  kde_build_deps
end
