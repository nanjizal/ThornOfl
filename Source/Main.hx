package;
import layout.Layout;
import layout.LayoutItem;
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
class Main extends Sprite {
    var clip:MovieClip;
    var s0 = 'TAP_High_01.mp3';
    var s1 = 'TAP_High_01.ogg';
    var s2 = 'TAP_High_02.mp3';
    var s3 = 'TAP_High_02.ogg';
    var s4 = 'TAP_low_02.mp3';
    var s5 = 'TAP_low_02.ogg';
    var s6 = 'TAP_low01.mp3';
    var s7 = 'TAP_low01.ogg';
    var s8 = 'TAP01.wav';
    var s9 = 'TAP02.wav';
    var s10 = 'TAP03.wav';
    var s11 = 'TAPLow01.wav';
    var s12 = 'TAPLow02.wav';
    var s13 = 'TAPLow03.wav';
    var s14 = 'TAPLow04.wav';
    var s15 = 'TAPLow05.wav';
    var starsSound: String = 'AMBIENT -  MP3 TEST 1.mp3';//'stars.mp3';
    var soundController: SoundController;
    var layout:Layout;
    var turnRoundX = 700.;
    var forward = true;
    var speed = 2.;
    //var simpleVideoPlayer: SimpleVideoPlayer;
    //var simpleVideoPlayer2: SimpleVideoPlayer;
    public function new () {
        super ();
        clip = Assets.getMovieClip ("swf-library:dragon");
        clip.x = 100.;
        clip.y = 100.;
        addChild(clip);
        addEventListener( Event.ENTER_FRAME, this_onEnterFrame );
        drawButton( 50, 50, 0x00FF00 );
    }
    function drawButton( x: Float, y: Float, c: Int ){
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
    function mouseDown( event: MouseEvent ){
        trace( 'play music' );
        playMusic();
    }
    function playMusic(){
        soundController = new SoundController();
        soundController.playTiny();
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