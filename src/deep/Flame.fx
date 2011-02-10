/*
 * Flame.fx
 *
 * Created on 8 Mar, 2009, 12:49:44 PM
 */


/**
 * @author Ankit
 */

package deep;

import javafx.animation.Timeline;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.scene.transform.Scale;
import javafx.scene.transform.Translate;

/**
 * @author Ankit
 */
var ux: Number;
var textop: Number = 1;
var animflame = Timeline {
    repeatCount: Timeline.INDEFINITE
    keyFrames: [
           at(0s){ ux=>1 }
           at(.5s){ ux=>.5 }
           at(1s){ ux=>1 } 
    ]

}

var textopcontrol = Timeline {

    keyFrames: [
 at(0s){textop => 1}
 at(2s){textop => .66}
 at(5s){textop => 0}

    ]
}

public class Flame extends CustomNode {
    public var x: Number;
    public var y: Number;
    public override function create(): Node {
        animflame.play();
        textopcontrol.play();
        return Group {

            content: bind [
                ImageView {
                    image: Image {
                        url: "{__DIR__}resources/background.png"
                    }
  

                    onMouseMoved: function(
                        e : MouseEvent ): Void {
                        x = e.x - 5;
                        y = e.y - 10;
                    }
                },
                ImageView {
                    transforms: [
                        Translate{
                            x: bind x,
                            y: bind y
                        }
                        Scale {
                            x: bind ux,
                        }
                    ]
                    image: Image {
                        url: "{__DIR__}resources/flame.png"
                    }
                },
                Text {
                    font: Font {
                        size: 16

                    }
                    stroke: Color.WHITE
                    x: 50,
                    y: 300
                    content: "Bring the diya flame on the crackers & enjoy"
                    fill: Color.WHITE
                    opacity: bind textop;

                }
            ]
        };
    }


}


