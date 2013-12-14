require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Strigi < BaseKdeFormula
  homepage 'http://strigi.sourceforge.net/'
  url 'http://www.vandenoever.info/software/strigi/strigi-0.7.8.tar.bz2'
  sha1 '7250fb15109d33b0c49995a2cc3513ba7d937882'

  kde_build_deps
  depends_on 'clucene'
  depends_on 'd-bus'
  depends_on 'exiv2' => :optional

  def patches
    if MacOS.version >= :mavericks
      # Fix "reference to 'mutex' is ambiguous" error
      # MacPorts issue: https://trac.macports.org/ticket/41152
      {:p0 => 'https://trac.macports.org/raw-attachment/ticket/41152/patch-libstreamanalyzer-plugins-endplugins-ffmpegendanalyzer.cpp.diff'}
    end
  end

  def extra_cmake_args
    "-DENABLE_EXPAT:BOOL=ON"
  end

  def install
    ENV['CLUCENE_HOME'] = HOMEBREW_PREFIX
    ENV['EXPAT_HOME'] = '/usr/'

    default_install
  end
end
