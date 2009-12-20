package 
{
 import org.flixel.*;
 import org.flixel.FlxGame;
 
 public class MyGame extends FlxGame 
 {
  public function MyGame():void
  {
   super(550, 400, MenuState/* SplashStateA */, 1);
   showLogo = false;
   help("Jump", "Shoot", "Nothing");
   useDefaultHotKeys = true;
  }
 }
}
