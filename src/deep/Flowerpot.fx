/*
 * Flowerpot.fx
 *
 * Created on 14 Mar, 2009, 1:07:49 PM
 */



package deep;

import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.Node;
import javafx.scene.transform.Translate;

/**
 * @author Ankit
 */


public class Flowerpot extends CustomNode {
    public var x: Number  = 100;
    public var y: Number = 600;

    public override function create(): Node {
        return Group {
            content: [
                ImageView {
                    transforms: Translate {
                        x: bind x,
                        y: bind y
                    }
                    image: Image {
                        url: "{__DIR__}resources/anar.png"
                    }
                }
            ]
        };
    }


}