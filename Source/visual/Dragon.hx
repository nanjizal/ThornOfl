package visual;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.Graphics;
import openfl.events.MouseEvent;
import openfl.utils.ByteArray;
import openfl.Assets;
import openfl.Lib;
import video.SimpleVideoPlayer;
import sound.SoundController;
class Dragon {
    var turnRoundX = 700.;
    var forward = true;
    var speed = 2.;
    var clip: MovieClip;
    public function new( scope: Sprite ){
        clip = Assets.getMovieClip ("swf-library:dragon");
        clip.x = 100.;
        clip.y = 100.;
        scope.addChild(clip);
    }
    public function update(){
        backforward();
    }
    function backforward(){
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