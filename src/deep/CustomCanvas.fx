/*
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER
 * Copyright 2009 Sun Microsystems, Inc. All rights reserved. Use is subject to license terms.
 *
 * This file is available and licensed under the following license:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   * Redistributions of source code must retain the above copyright notice,
 *     this list of conditions and the following disclaimer.
 *
 *   * Redistributions in binary form must reproduce the above copyright notice,
 *     this list of conditions and the following disclaimer in the documentation
 *     and/or other materials provided with the distribution.
 *
 *   * Neither the name of Sun Microsystems nor the names of its contributors
 *     may be used to endorse or promote products derived from this software
 *     without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*
 * CustomCanvas.fx
 *
 * Created on Sep 16, 2008, 3:36:41 PM
 */

package deep;

import javafx.animation.*;
import javafx.scene.*;
import javafx.scene.paint.*;
import javafx.scene.shape.*;
import javafx.scene.input.*;
import java.lang.Math;
import java.util.Random;

/**
 * @author Ankit Kumar
 */

public class CustomCanvas extends CustomNode {

    var acc : Number;
    var timeline : Timeline;
    var parts : Particle[];
    var random : Random;

    function update() : Void {
        insert
        Particle {
            x : 0
            y : 0
            vx : 0.4 * random.nextGaussian()
            vy : 0.4 * random.nextGaussian() + 4
            timer : 100
            acc : bind acc
        } into parts;
        var i = sizeof parts - 1;
        while( i >= 0 ) {
                parts
            [i.intValue()].update();
            if( parts
            [i.intValue()].isdead()) {
                delete parts[i.intValue()];
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
                    time : 20.6ms
                    action:
                        function() {
                            update();
                        }
                }
        };
         timeline.play();


 return Group {
            content : bind [
              parts
            ]
        };
    }}

