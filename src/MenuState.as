package
{
 import org.flixel.*;
 
 public class MenuState extends FlxState
 {
  [Embed(source="../media/title.jpg")]
  protected var TitleImage:Class;
  
  public function MenuState()
  {
   this.add(new FlxSprite(0,0,TitleImage));
  }
  
  public override function update():void
  {
    super.update();
    if (FlxG.keys.justPressed("X"))
    FlxG.switchState(GameState);
  }

 }
}
