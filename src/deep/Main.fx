package deep;
/*
 * Main.fx
 *
 * Created on 4 Mar, 2009, 10:28:24 PM
 * Author AnKit Kumar, B.Tech Electrical Engg. IT-BHU Varanasi, India
 */

import deep.Chakri;
import deep.CustomCanvas;
import deep.Flame;
import deep.Flowerpot;
import deep.Rocket;
import javafx.animation.Interpolator;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.paint.Color;
import javafx.scene.Scene;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.scene.transform.Rotate;
import javafx.scene.transform.Scale;
import javafx.scene.transform.Transform;
import javafx.scene.transform.Translate;
import javafx.stage.Stage;


var width: Number=400;
var height: Number=620;
var ang: Number = 0;
var x: Number = width / 2;   //x,y used to animate rocket
var y: Number = height - 20;
var p: Number;                //p,q decide position of gases from class CustomCanvas
var q: Number;
var sx: Number = 0;          //sx,sy scale the fireworks images
var sy: Number = 0;
var r = Rocket{
};
var f = Flowerpot{
};
var c = Chakri{
};
var fuzzang: Number = 20;
var o1: Number = 0;
var o2: Number = 0;


var fuzzangcontrol = Timeline {         //animation of chakri and its gases
    repeatCount: Timeline.INDEFINITE
    keyFrames: [
        at(0s){ fuzzang => 0}
        at(.5s){ fuzzang => 360}
    ]
}



var explosionopacity = Timeline {           //animation of fireworks in the sky
    repeatCount: Timeline.INDEFINITE
    keyFrames: [
        at(0s){ o1 => 0}
        at(0s){ sx => .2}
        at(0s){ sy => .2}
        at(1s){ o1 => 1}
        at(2.5s){ o1 => .5}
        at(3s){ sx => 2}
        at(3s){ sy => 2}
        at(3s){o1=>0}
        at(3.2s){ sx => .2}
        at(3.2s){ sy => .2}
        at(3.2s){ o2 => 0}
        at(3.3s){ o2 => 1}
        at(4s){ sx => -1.5}
        at(4s){ sy => 1.5}
        at(4s){ o2 =>0}
    ]
}

var shoot = Timeline {        // controls animation of rocket & its gases

    keyFrames: [
        at(0s){p=> 204}
        at(0s){q=> 645}
        KeyFrame {

            time: 0s
            values: y =>
            height - 50
        },
     at(3s){p=> 204}
     at(3s){q=> -55 tween
        Interpolator.SPLINE(0.162,0.697,0.183,1.000)}
     at(3.01s){p=> -40}
        KeyFrame {
            time: 3s
            values: y => -80 tween
            Interpolator.SPLINE(0.162,0.697,0.183,1.000)
            action: function() {
                explosionopacity.play();

            }
        }
    ]

}




Stage {
    title: "Application title"
    width: width
    height: height + 100
    scene: Scene {
        fill: Color.BLACK

        content: [
            Group{
                content: [
                  Flame{               //diya flame
                       },

                    CustomCanvas{

                        transforms: [
                            Rotate {
                                pivotX: bind (p + 22.5),
                                pivotY: bind (q)
                                //22.5),
                                angle: bind fuzzang
                            },
                            Translate {
                                x: bind p,
                                y: bind q
                            },
                        ]

                    },

                    r = Rocket{
                        transforms: bind Transform.translate(x, y)

                        onMouseEntered: function( e: MouseEvent ):Void {
                             
                            fuzzangcontrol.stop();
                            fuzzang = 0;
                            shoot.play();

                        }
                    }

                ]

            },
            
            f = Flowerpot{
                onMouseEntered: function( e: MouseEvent ):Void {
                   
                    fuzzangcontrol.stop();
                    fuzzang = 180;
                    p = 70;
                    q = 610;
                }

            },
            c = Chakri{
                transforms: Rotate {
                    pivotX: 322.5,
                    pivotY: 622.5,
                    angle: bind fuzzang
                }
                onMouseEntered: function( e: MouseEvent ):Void {
                   
                    p = 300;
                    q = 622.5;
                    fuzzangcontrol.play();
                }
            },
            ImageView {
                transforms: [                          //explosion in sky #1
                    Translate{
                        x: 100,
                        y: -10
                    },
                    Scale {
                        x: bind sx,
                        y: bind sy
                    }
                ]
                image: Image {
                    url: "{__DIR__}resources/fw1.png"
                }
                opacity: bind o1;

            },
            ImageView {                               
                transforms: [
                    Translate{
                        x: 225,
                        y: 80
                    },
                    Scale {
                        x: bind sx,
                        y: bind sy
                    }
                ]
                image: Image {                            //explosion in sky #2
                    url: "{__DIR__}resources/fw2.png"
                }
                opacity: bind o2;
            }
            
        ]
    }


}

