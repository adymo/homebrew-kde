require "formula"

class KdelibsStripped < Formula
  homepage "http://quickgit.kde.org/?p=clones/kdelibs/rempt/kdelibs-stripped.git"
  url "https://downloads.sourceforge.net/project/kdelibs-stripped/kdelibs-stripped-4.12.zip"
  sha1 "1c1f4365b7db0bdb1e225e63235e77a604ce7ee8"
end
class Calligra < Formula
  homepage "http://www.calligra.org/"
  #url "http://download.kde.org/unstable/calligra-2.7.90/calligra-2.7.90.tar.xz"
  #sha1 "d689cedd838a5b0f81f3a50ba6dfb5f7d35d9f08"
  head "git://anongit.kde.org/calligra.git", :branch => "master"

  depends_on "cmake" => :build
  depends_on "automoc4" => :build
  depends_on "pkg-config" => :build
  depends_on "boost" => :build
  depends_on "xz" => :build

  depends_on "oxygen-icons"
  depends_on "qca"
  depends_on "gsl"
  depends_on "little-cms2"
  depends_on "glew"
  depends_on "fftw"
  depends_on "exiv2"
  #depends_on "opencolorio"
  depends_on "kdepimlibs" => :optional
  depends_on "mariadb" => :optional
  depends_on "freetds" => :optional
  depends_on "openjpeg" => :optional
  depends_on "vc" => :optional
  depends_on "openexr" => :optional
  depends_on "poppler" => [:optional, "with-qt4"]
  depends_on "libpqxx" => :optional
  #depends_on "xbase" => :optional
  #depends_on "opengtl" => :optional
  #depends_on "libqtgtl" => :optional

  # filters
  depends_on "libodfgen" => :optional
  depends_on "libwpd" => :optional
  depends_on "libwpg" => :optional
  depends_on "libwps" => :optional
  depends_on "libvisio" => :optional
  depends_on "libetonyek" => :optional
  depends_on "pstoedit" => :optional

  def install
    cmake_args = std_cmake_args
    cmake_args << ".."
    cmake_args << "-DCMAKE_PREFIX_PATH=/usr/local/opt/gettext"
    #cmake_args << "-DQCA2_INCLUDE_DIR=/usr/local/opt/qca/lib/"
    cmake_args << "-DOPENEXR_INCLUDE_DIR=/usr/local/include/OpenEXR/"
    cmake_args << "-DKDE4_BUILD_TESTS=off"
    cmake_args << "-DBUILD_doc=false"
    cmake_args << "-DKDE_DEFAULT_HOME=Library/Preferences/Calligra"

    kdedirs = "KDEDIRS=#{prefix}"

    KdelibsStripped.new("kdelibs-stripped", Pathname.new(__FILE__).expand_path, :stable).brew do
      mkdir "build" do
        system "export #{kdedirs}"
        system "cmake", *cmake_args, "-DBUNDLE_INSTALL_DIR=."
        system "make", "install"
      end
    end

    mkdir "build" do
      system "export #{kdedirs}"
      system "cmake", *cmake_args,
                      "-DBUNDLE_INSTALL_DIR=#{bin}",
                      "-DPRODUCTSET=OSX"
      system "make", "install"
    end
  end
end
