require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopRuby < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'https://github.com/adymo/kdevelop-ruby/archive/kdevelop-4-7.zip'
  sha1 'ffaf1e16de9744f4e6da710622fc970f5b746ba9'

  depends_on 'kdevelop'
  kde_build_deps
end
