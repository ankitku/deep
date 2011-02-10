/*
 * Rocket.fx
 *
 * Created on 8 Mar, 2009, 12:49:44 PM
 */


/**
 * @author Ankit
 */

package deep;

import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.Node;
import javafx.scene.transform.Translate;



public class Rocket extends CustomNode {
    public var x: Number;
    public var y: Number;
    public override function create(): Node {
        return Group {
            content: [
                ImageView {
                    transforms: [
                        Translate{
                            x: bind x,
                            y: bind y
                        }
                    ]
                    image: Image {
                        url: "{__DIR__}resources/rocket.png"
                    }
                }
            ]
        };
    }


}