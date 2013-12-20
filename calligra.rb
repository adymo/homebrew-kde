require File.join(File.dirname(__FILE__), 'base_kde_formula')

class Eigen2 < BaseKdeFormula
  homepage 'http://eigen.tuxfamily.org/'
  url 'http://bitbucket.org/eigen/eigen/get/2.0.17.tar.bz2'
  sha1 '461546be98b964d8d5d2adb0f1c31ba0e42efc38'
end

class Calligra < BaseKdeFormula
  homepage 'http://www.calligra.org/'
  version '2.8'
  #url 'http://download.kde.org/stable/calligra-2.7.3/calligra-2.7.3.tar.xz'
  #sha1 'd689cedd838a5b0f81f3a50ba6dfb5f7d35d9f08'
  url 'git://anongit.kde.org/calligra.git', :branch => 'calligra/2.8'
  head 'git://anongit.kde.org/calligra.git', :branch => 'master'

  depends_on 'cmake' => :build
  depends_on 'automoc4' => :build
  depends_on 'pkg-config' => :build
  depends_on 'boost' => :build

  depends_on 'oxygen-icons'
  depends_on 'kdelibs'
  depends_on 'qca'
  depends_on 'gsl'
  depends_on 'little-cms2'
  depends_on 'glew'
  depends_on 'fftw'
  #depends_on 'opencolorio'
  depends_on 'exiv2'
  depends_on 'kdepimlibs' => :optional
  depends_on 'libodfgen' => :optional
  depends_on 'libwps' => :optional
  depends_on 'libvisio' => :optional
  depends_on 'mariadb' => :optional
  depends_on 'freetds' => :optional
  depends_on 'openjpeg' => :optional
  depends_on 'vc' => :optional
  depends_on 'openexr' => :optional
  depends_on 'exiv2' => :optional
  depends_on 'poppler' => [:optional, 'with-qt4']
  depends_on 'libpqxx' => :optional
  depends_on 'pstoedit' => :optional
  #depends_on 'xbase' => :optional
  #depends_on 'opengtl' => :optional
  #depends_on 'libqtgtl' => :optional

  def install
    Eigen2.new.brew do
      mkdir 'eigen-build' do
        args = std_cmake_args
        args << "-DCMAKE_BUILD_TYPE=Release"
        args << "-Dpkg_config_libdir='#{lib}'" << ".."
        system "cmake", *args
        system "make install"
      end
    end

    mkdir 'calligra-build' do
      args = kde_default_cmake_args
      args << "-DPRODUCTSET=osx"
      args << ".."
      system "cmake", *args
      ENV.j4
      system "make install"
      touch "#{prefix}/.installed"
    end
  end
end
