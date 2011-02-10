/*
 * Comet.fx
 *
 * Created on 12 Mar, 2009, 3:36:05 PM
 */

package deep;


import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.shape.Circle;
import javafx.scene.paint.Color;

/**
 * @author Ankit
 */

class Co extends Circle{
override var radius = 40;
override var stroke = Color.YELLOW;
}

public class Comet extends CustomNode{
    var i:Number=0;
    var pieces: Co[];
    var a:Co;
    override public function create():Node {
        while(i<6)
        { insert a into pieces}

        return Group{
            content: bind pieces;
        }
    }
}
