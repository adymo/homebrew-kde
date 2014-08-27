require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopRuby < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'https://github.com/adymo/kdevelop-ruby/archive/kdevelop-4-7.zip'
  sha1 'a25bcdd0b6f6db82643f9e1b61524aab106cf065'

  depends_on 'kdevelop'
  kde_build_deps
end
