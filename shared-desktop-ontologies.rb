require 'formula'

class SharedDesktopOntologies < Formula
  homepage 'http://sourceforge.net/apps/trac/oscaf/'
  url 'http://downloads.sourceforge.net/project/oscaf/shared-desktop-ontologies/0.11.0/shared-desktop-ontologies-0.11.0.tar.bz2'
  sha1 '16d971eb6227055e042b67a0fd79f8bc585b1900'

  depends_on 'cmake' => :build

  def install
    system "cmake #{std_cmake_parameters} ."
    system "make install"
  end
end
