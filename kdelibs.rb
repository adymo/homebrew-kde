require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Kdelibs < BaseKdeFormula
  homepage 'http://www.kde.org/'
  url 'http://download.kde.org/stable/4.14.3/src/kdelibs-4.14.3.tar.xz'
  sha256 'f8206da1106184ef0bd031b82701c4910b8dade331c4cdaf1cd9c6c5208cfd9e'

  kde_build_deps
  depends_on 'gettext'
  depends_on 'pcre'
  depends_on 'jpeg'
  depends_on 'giflib'
  depends_on 'libpng'
  depends_on 'soprano'
  depends_on 'shared-desktop-ontologies'
  depends_on 'shared-mime-info'
  depends_on 'attica'
  depends_on 'strigi'
  depends_on 'xz'
  depends_on 'docbook'
  depends_on 'docbook-xsl'
  depends_on 'd-bus'
  depends_on 'qt' => ["with-d-bus", "with-qt3support"]
  depends_on 'libdbusmenu-qt'
  depends_on 'aspell' => :optional
  depends_on 'enchant' => :optional

  def patches
    # macports patches.
    {:p1 => [
      "http://svn.macports.org/repository/macports/trunk/dports/kde/kdelibs4/files/add-bundles-to-path.patch",
      "http://svn.macports.org/repository/macports/trunk/dports/kde/kdelibs4/files/default-kde4-xdg-menu-prefix.patch",
      "http://svn.macports.org/repository/macports/trunk/dports/kde/kdelibs4/files/workaround-kdeinit4-crash.patch",
      "http://svn.macports.org/repository/macports/trunk/dports/kde/kdelibs4/files/patch-cmake-modules-FindKDE4-Internal.cmake.diff",
      "https://gist.githubusercontent.com/philacs/9297176/raw/08f340d94a91398507ad82a8af6227cc68f0ea29/kaboutdialog-osx-beautifier-kdelibs.diff"
    ]}
  end
  
  def extra_cmake_args
    [
      "-DWITH_ENCHANT=ON",
      "-DWITH_Soprano=ON",
      "-DWITH_lzma=OFF",
      "-DWITH_Avahi=OFF",
      "-DWITH_HSPELL=OFF",
      "-DWITH_FAM=OFF",
      "-DKJS_FORCE_DISABLE_PCRE=ON",
      "-DPCRE_CONFIG_STACKRECURSE=ON",
      "-DPCRE_CONFIG_UTF8=ON",
      "-DHAVE_PCRE_STACK=ON",
      "-DHAVE_PCRE_UTF8=ON"
    ]
    nil
  end

  #def extra_cmake_args
  #  Formula.factory('xz').prefix
  #end

  def install
    opoo "Compile qt formula first with: --with-qtdbus and --with-qt3support flags."
    puts <<-EOS.undent
      Enable QtDBus module (--with-qtdbus) and Qt3Support module (--with-qt3support)
      in qt formula first to avoid errors in kdevplatform and kdevelop formulas.
    EOS
    default_install
  end

  def caveats; <<-EOS.undent
      First add #{kdedir} path to your $KDEDIRS in your ~/.bash_profile file.
        export PATH=$PATH:#{kdedir}
        export KDEDIR=#{kdedir}
        export KDEDIRS="$KDEDIRS:$HOME/Library/Preferences/KDE:#{kdedir}"
  
      Now remember to run kbuildsycoca4 command, if you have some issues with kdevelop
      formula or kate formula about mime types, try to update mime types:
        $ update-mime-database #{kdedir}/share/mime
        $ kbuildsycoca4 --noincremental
        $ brew linkapps
    EOS
  end
end

# -----------------------------------------------------------------------------
# -- The following OPTIONAL packages could NOT be located on your system.
# -- Consider installing them to enable more features from this software.
# -----------------------------------------------------------------------------
#    * QCA2 (2.0.0 or higher)  <http://delta.affinix.com/qca>
#      Support for remote plasma widgets
#    * LibACL  <ftp://oss.sgi.com/projects/xfs/cmd_tars>
#      Support for manipulating access control lists
#      STRONGLY RECOMMENDED
#    * FAM  <http://oss.sgi.com/projects/fam>
#      File alteration notification support via a separate service
#      Provides file alteration notification facilities using a separate service.
#    * Grantlee (0.1.0 or higher)  <http://www.grantlee.org>
#      ModelEventLogger code generation (part of the ProxyModel test suite)
#      Grantlee is used for generating compilable code by the ModelEventLogger. Without Grantlee, the logger will do nothing.
#    * HSpell  <http://ivrix.org.il/projects/spell-checker/>
#      Spell checking support for Hebrew
#      Hebrew support can also be provided via Enchant, providing the correct Enchant backends are installed
#    * OpenEXR  <http://www.openexr.com>
#      Support for OpenEXR images
#    * Avahi  <http://avahi.org>
#      Facilities for service discovery on a local network (DNSSD)
#      Either Avahi or DNSSD is required for KDE applications to make use of multicast DNS/DNS-SD service discovery
# 
# -----------------------------------------------------------------------------
