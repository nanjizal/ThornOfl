package;
import layout.Layout;
import layout.LayoutItem;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.utils.ByteArray;
import openfl.Assets;
import openfl.Lib;

class Main extends Sprite {
    var clip:MovieClip;
    var layout:Layout;
    var turnRoundX = 700.;
    var forward = true;
    var speed = 2.;
    public function new () {
        super ();
        clip = Assets.getMovieClip ("swf-library:dragon");
        clip.x = 100.;
        clip.y = 100.;
        addChild (clip);
        addEventListener( Event.ENTER_FRAME, this_onEnterFrame );
    }
    function this_onEnterFrame( event: Event ): Void {
        var currentTime = Lib.getTimer();
        //trace( currentTime );
        if( forward ){
            clip.x+= speed;
        } else {
            clip.x-= speed;
        }
        clip.y += 3*(Math.random() - 0.5);
        if( clip.x > turnRoundX && forward ){
            clip.scaleX = -1.;
            forward = false;
        }
        if( clip.x < 0. && !forward ){
            clip.scaleX = 1.;
            forward = true;
        }
    }
}