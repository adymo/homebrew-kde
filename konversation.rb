require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Konversation < BaseKdeFormula
  homepage 'http://konversation.kde.org/'
  url 'http://download.kde.org/stable/konversation/1.5.1/src/konversation-1.5.1.tar.xz'
  sha1 '1b69db93d2c0a38b631dd92065fa6e7490ffbfbe'

  depends_on 'kdelibs'
  depends_on 'kde-runtime'
  kde_build_deps
end
