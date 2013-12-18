require File.join(File.dirname(__FILE__), 'base_kde_formula')

class KdevelopRuby < BaseKdeFormula
  homepage 'http://kdevelop.org/'
  url 'https://github.com/adymo/kdevelop-ruby/archive/kdevelop-4-6.zip'
  sha1 'e1afd9ef104ec77528e00d1175f6e1e2ff301551'

  depends_on 'kdevelop'
  kde_build_deps
end
