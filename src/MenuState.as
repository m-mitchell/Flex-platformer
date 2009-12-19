package
{
 import org.flixel.*;
 
 public class MenuState extends FlxState
 {
  [Embed(source="../media/images/title.jpg")]
  protected var TitleImage:Class;
  
  [Embed(source="../media/music/main.mp3")] 
  protected var BgMain:Class;
  
  public function MenuState()
  {
   this.add(new FlxSprite(0, 0, TitleImage));
   this.add(new FlxText((550 - 70) / 2, (400 - 20) / 2, 70, "X TO START"));
   FlxG.play(BgMain);
  }
  
  public override function update():void
  {
    super.update();
    if (FlxG.keys.justPressed("X"))
    FlxG.switchState(GameState);
  }

 }
}
