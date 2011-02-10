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
 * Particle.fx
 *
 * Created on Sep 16, 2008, 3:37:07 PM
 */

package deep;

import javafx.scene.*;
import javafx.scene.image.*;
import javafx.scene.transform.*;
import java.lang.System;
import java.lang.Math;
import java.util.Random;
import javafx.scene.shape.Line;
import javafx.scene.paint.Color;

/**
 * @author joshua.marinacci@sun.com
 */

public class Particle extends CustomNode {
    public var x : Number;
    public var y : Number;
    public var vx : Number;
    public var vy : Number;
    public var timer : Number;
    public var acc : Number;
    
    override function create(): Node {
        return
        Line {
            startX: 0,
            startY: 0
            endX: 1,
            endY: 6
            strokeWidth: 1
            stroke: Color.YELLOW
            transforms: [
            Translate{ x : bind x, y : bind y } ]
            opacity: bind timer / 100
        };
    }
 
    public function update(): Void {
        timer -= 2.5;
        x += vx;
        y += vy;
        vx += acc;
    }
    
    public function isdead(): Boolean {
        return timer <= 0;
    }    
}
