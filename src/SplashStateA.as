package
{
 import org.flixel.*;
 
 public class SplashStateA extends FlxState
 {
	 
  [Embed(source="../media/sound/splash.mp3")] 
  protected var SndSplash:Class;
  
  [Embed(source="../media/images/splash.jpg")]
  protected var SplashImage:Class;
  protected var SplashScreen:FlxSprite = new FlxSprite(0, 0, SplashImage);
  
  protected var Action:Number = 0;
  protected var Timer:Number = 0;
  
  protected const Delay:Number = 100;
  
  public function SplashStateA()
  {
	  SplashScreen.alpha = 0;
	  this.add(SplashScreen);
	  FlxG.play(SndSplash);
  }
  
  public override function update():void
  {
    super.update();
	
	// Fade in splash screen
    if (Action == 0) {
		if (SplashScreen.alpha == 1){
		     Action = 1;
		} else {
			SplashScreen.alpha = SplashScreen.alpha + .01;
			
		}
    // Track time until fade out
	} else if (Action == 1) {
		Timer++;
		if(Timer >= Delay){
		     Action = 2;
		}
	// Fade out splash screen
	} else if (Action == 2) {
		if (SplashScreen.alpha == 0) {
			 FlxG.switchState(MenuState);
		} else {
		     SplashScreen.alpha = SplashScreen.alpha - .01;
		}
	}
  }
  
 }
}
