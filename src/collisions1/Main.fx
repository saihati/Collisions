package collisions1;

import javafx.application.Frame;
import javafx.application.Stage;
import javafx.scene.geometry.Rectangle;
import javafx.scene.paint.Color;
import javafx.input.MouseEvent;
import java.lang.System;

var colide = Color.WHITE;

function checkcollision():Void {
    if (
        (rec1.getBoundsX() > rec2.getBoundsX() + rec2.getWidth()) or
        (rec1.getBoundsX() + rec1.getWidth() < rec2.getBoundsX()) or 
        (rec1.getBoundsY() > rec2.getBoundsY() + rec2.getHeight()) or 
        (rec1.getBoundsY() + rec1.getHeight() < rec2.getBoundsY())
    ) {
        colide = Color.WHITE
    } else {
        colide = Color.DARKGRAY
    }
}

var rec1: MovableRectangle = MovableRectangle {
    x: 10, y: 10, width: 50, height: 60, fill: Color.RED
    onMove: function(e:MouseEvent):Void {
        checkcollision()
    }
}

var rec2: MovableRectangle = MovableRectangle {
    x: 100, y: 100, width: 70, height: 30, fill: Color.BLUE
    onMove: function(MouseEvent):Void {
        checkcollision()
    }
}

Frame {
    title: "Rectangular Collisions", width: 400, height: 300
    closeAction: function() { 
        java.lang.System.exit( 0 ); 
    }
    visible: true

    stage: Stage {
        fill: bind colide
        content: [rec1, rec2]
    }
}