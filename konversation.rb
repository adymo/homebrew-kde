require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Konversation < BaseKdeFormula
  homepage 'http://konversation.kde.org/'
  url 'http://download.kde.org/stable/konversation/1.5/src/konversation-1.5.tar.xz'
  sha1 '3955a43758750b63d84299a9d9a5933b73e5492b'

  depends_on 'kdelibs'
  depends_on 'kde-runtime'
  kde_build_deps
end
