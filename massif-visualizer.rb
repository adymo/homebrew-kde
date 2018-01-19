require File.join(File.dirname(__FILE__), 'base_kde_formula')

class MassifVisualizer < BaseKdeFormula
  homepage 'http://milianw.de/tag/massif-visualizer'
  url 'http://download.kde.org/unstable/massif-visualizer/0.3.90/src/massif-visualizer-0.3.90.tar.xz'
  sha256 '9940fa90137ca5eef08b9ec220825fadbf03db423a670a2c7fe3edab271d9922'

  depends_on 'kdelibs'
  kde_build_deps

  def patches
    DATA
  end
end

__END__
--- a/kdchart/src/KDChartPercentPlotter_p.cpp
+++ b/kdchart/src/KDChartPercentPlotter_p.cpp
@@ -185,12 +185,12 @@

                 data.first = leftY + ( rightY - leftY ) * ( xValue - leftX ) / ( rightX - leftX );
                 // if the result is a valid value, let's assign the index, too
-                if( !ISNAN( data.first ) )
+                if( !ISNAN( (double)data.first ) )
                     data.second = left.second;
             }

             // sum it up
-            if( !ISNAN( yValues[ column ].first ) )
+            if( !ISNAN( (double)(yValues[ column ].first) ) )
                 yValueSums[ xValue ] += yValues[ column ].first;
         }
     }
