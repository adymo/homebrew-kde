require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Grantlee < BaseKdeFormula
  homepage 'http://grantlee.org/'
  version '0.5.1'
  url 'https://gitorious.org/grantlee/grantlee/archive/v0.5.1.tar.gz'
  sha1 '4da30724c5330fe0612ea2ebcfabbe11a036c019'

  kde_build_deps
  depends_on 'qt' => ["with-d-bus", "with-qt3support"]
end
