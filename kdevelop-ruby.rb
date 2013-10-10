require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopRuby < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'https://github.com/adymo/kdevelop-ruby/archive/kdevelop-4-5.zip'
  sha1 '3d38391dadec9debf88629965d85924965682ffa'

  depends_on 'kdevelop'
  kde_build_deps
end
