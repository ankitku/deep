/*
 * Chakri.fx
 *
 * Created on 19 Mar, 2009, 11:23:08 AM
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

public class Chakri extends CustomNode{
    public var x: Number;
    public var y: Number;

    public override function create(): Node {
        return Group {
            content: [
                ImageView {
                    transforms: [
                        Translate{
                            x: 300,
                            y: 600
                        }
                    ]
                    image: Image {
                        url: "{__DIR__}resources/chakri.png"
                    }
                }
            ]
        };
    }




}
