require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Grantlee < BaseKdeFormula
  homepage 'http://grantlee.org/'
  version '0.5.1'
  url 'https://gitorious.org/grantlee/grantlee.git', :using => :git, :tag => "v0.5.1"
  head 'https://gitorious.org/grantlee/grantlee.git'

  kde_build_deps
  depends_on 'qt' => ["with-d-bus", "with-qt3support"]
end
