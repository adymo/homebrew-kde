require 'formula'

class BaseKdeFormula < Formula

  def self.kde_build_deps
    depends_on 'cmake' => :build
    depends_on 'automoc4' => :build
    depends_on :x11
  end

  def kdedir
    "/usr/local/kde4"
  end
  def kdelibs_prefix
    Formula.factory('kdelibs').prefix
  end
  def qjson_prefix
    Formula.factory('qjson').prefix
  end
  def gettext_prefix
    Formula.factory('gettext').prefix
  end
  def docbook_prefix
    Formula.factory('docbook').prefix
  end
  def docbook_dtd
    "#{docbook_prefix}/docbook/xml/4.5"
  end
  def docbook_xsl
    "#{Formula.factory('docbook-xsl').prefix}/docbook-xsl"
  end

  def extra_cmake_args
    []
  end
  def extra_prefix_path
  end
  def kde_default_cmake_args
    s = extra_prefix_path
    if s.nil?
      s = kdedir
    else
      s += ":#{kdedir}"
    end
    cmake_args = [
      '..',
      #"-DCMAKE_FIND_FRAMEWORK=LAST",
      "-DCMAKE_INSTALL_PREFIX=#{kdedir}",
      #'-DCMAKE_BUILD_TYPE=None',
      '-Wdev --trace --debug-output',
      '-DKDE_DEFAULT_HOME=Library/Preferences/KDE',
      #"-DCMAKE_OSX_ARCHITECTURES='#{build_arch}'",
      #"-DCMAKE_PREFIX_PATH=#{s}:#{qjson_prefix}:#{gettext_prefix}",
      #"-DCMAKE_PREFIX_PATH=#{s}:#{gettext_prefix}",
      "-DCMAKE_PREFIX_PATH=#{gettext_prefix}",
      "-DDOCBOOKXML_CURRENTDTD_DIR=#{docbook_dtd}",
      "-DDOCBOOKXSL_DIR=#{docbook_xsl}",
      "-DBUILD_doc=FALSE",
      "-DBUNDLE_INSTALL_DIR=#{bin}"
    ]
    cmake_args + extra_cmake_args
  end

  def build_arch
    if build.universal?
      'i386;x86_64'
    elsif MacOS.prefer_64_bit?
      'x86_64'
    else
      'i386'
    end
  end

  def install
    ENV['MAKEFLAGS'] = "-j4"
    mkdir 'build'
    cd 'build'
    system "cmake", *kde_default_cmake_args
    system "make"
    system "make install"
    touch "#{prefix}/.installed"
  end

  def caveats; <<-EOS.undent
    Remember to run brew linkapps.
    EOS
  end

end
