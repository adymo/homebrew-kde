require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Akonadi < BaseKdeFormula
  homepage 'http://pim.kde.org/akonadi/'
  url 'http://download.kde.org/stable/akonadi/src/akonadi-1.12.1.tar.bz2'
  sha1 '1ad560a83f08521592b1041c49b5415ffbb2581b'

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
