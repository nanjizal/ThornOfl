package;
import openfl.Lib;
import openfl.events.Event;
import openfl.display.Sprite;
import video.SimpleVideoPlayer;
import sound.SoundController;
import visual.Dragon;
import visual.TestButton;
class Main extends Sprite {
    var dragon: Dragon;
    var soundController: SoundController;
    public function new () {
        super ();
        dragon = new Dragon( cast this );
        addEventListener( Event.ENTER_FRAME, this_onEnterFrame );
        drawButton( 50, 50, 0x00FF00 );
    }
    function drawButton( x: Float, y: Float, c: Int ){
        var testButton: TestButton = new TestButton( this, x, y, c );
        testButton.buttonDown = playMusic;
    }
    function playMusic(){
        soundController = new SoundController();
        soundController.playTiny();
    }
    function this_onEnterFrame( event: Event ): Void {
        var currentTime = Lib.getTimer();
        dragon.update();
    }
}