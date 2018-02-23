

/*
 * DragGroup.fx
 *
 * Created on 30/10/2008, 10:06:56
 */

package collisions1;

import javafx.input.MouseEvent;
import javafx.scene.geometry.Rectangle;

public class MovableRectangle extends Rectangle {
    private attribute startX = 0.0;
    private attribute startY = 0.0;

    public attribute onMove = function(e:MouseEvent):Void {}
 
    override attribute onMousePressed = function(e:MouseEvent):Void {
        startX = e.getDragX()-translateX;
        startY = e.getDragY()-translateY;
        onMove(e);
    }
 
    override attribute onMouseDragged = function(e:MouseEvent):Void {
        translateX = e.getDragX()-startX;
        translateY = e.getDragY()-startY;
        onMove(e);
    }
}
