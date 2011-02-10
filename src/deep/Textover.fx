/*
 * Textover.fx
 *
 * Created on 21 Mar, 2009, 11:41:06 PM
 */

package deep;

import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;

/**
 * @author Ankit
 */
var o:Number = 1;
var texteffect = Timeline {

    keyFrames: [
        at(0s) {o=>0}
        at(.5s) {o=>1}
        at(3.5s) {o=>0}
    ]
}


public class Textover extends CustomNode {

    public override function create(): Node {
        texteffect.play();
        return Group {
            content: [
                Text {
                    font: Font {
                        size: 16

                    }
                    stroke: Color.WHITE
                    x: 50,
                    y: 310
                    content: "bring the diya on the crackers and enjoy!!"
                    opacity: bind o;
                }]
        };
    }


}
