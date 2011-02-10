
package deep;

import javafx.animation.*;
import javafx.scene.*;
import java.util.Random;


public class Fireflower extends CustomNode {

    var acc : Number;
    var timeline : Timeline;
   public var part : Particle[];
    var random : Random;

    function update() : Void {
        insert
        Particle {
            x : 0
            y : 0
            vx : 0.3 *random.nextGaussian()
            vy : 0.3 *random.nextGaussian() - 1
            timer : 100
            acc : bind acc
    } into part;
        var i = sizeof part - 1;
        while( i >= 0 ) {
                part[i.intValue()].update();
            if( part[i.intValue()].isdead()) {
                delete part[i.intValue()];
            }
            i--;
        }
    }



    override public function create(): Node {
        random = new Random();
           timeline = Timeline {
            repeatCount: java.lang.Double.POSITIVE_INFINITY // HACK
            keyFrames :
                KeyFrame {
                    time : 15.6ms
                    action:
                        function() {
                            update();
                        }
                }
        };
         timeline.play();


 return Group {
            content : bind [
              part
            ]
        };
    }}
