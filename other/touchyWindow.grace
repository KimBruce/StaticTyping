dialect "objectdraw"

// program that responds to a mouse press with a simple textual display
object{
    inherit graphicApplicationSize (400 @ 400) 
    textAt (20 @ 20) with ("Press mouse in this window") on (canvas)

    // When the user presses mouse, write: I'm touched
    // on canvas at coordinates (180, 200)
    method onMousePress (mousePoint) {
        textAt (180 @ 200) with ("I'm touched") on (canvas)
    }

    // When mouse is released, erase the canvas
    method onMouseRelease (mousePoint) {
        canvas.clear
    }

    // create window and start graphics
    startGraphics
}