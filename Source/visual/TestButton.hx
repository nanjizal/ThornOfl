package visual;
// uncomplete
class TestButton extends Sprite {
    public function new( x: Float, y: Float, c: Int ){
        draw( x, y, c );
    }
    
    public function draw( x: Float, y: Float, c: Int ){
        var but = new Sprite();
        var g = but.graphics;
        g.beginFill( c, 1 );
        g.lineStyle( 0, c, 1 );
        g.drawRect( 0, 0, 70, 50 );
        g.endFill();
        addChild( but );
        but.x = x;
        but.y = y;
        but.addEventListener( MouseEvent.MOUSE_DOWN, mouseDown );
    }
}