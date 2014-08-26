require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Akonadi < BaseKdeFormula
  homepage 'http://pim.kde.org/akonadi/'
  url 'http://download.kde.org/stable/akonadi/src/akonadi-1.13.0.tar.bz2'
  sha1 '9d594b5840e2e5d90057a7e5d8545004a3476bc0'

  depends_on 'shared-mime-info'
  depends_on 'mysql'
  depends_on 'soprano'
  depends_on 'boost'
  depends_on 'qt' => ["with-d-bus", "with-qt3support"]

  kde_build_deps

  #def patches
  #  {:p0 => [
  #    "http://bugsfiles.kde.org/attachment.cgi?id=69519"
  #  ]}
  #end
  
end
