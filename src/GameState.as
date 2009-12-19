package
{
 import org.flixel.FlxSprite;
 import org.flixel.FlxState;
 import org.flixel.*;
 
 public class GameState extends FlxState
 {
  [Embed(source="../media/untitle.png")]
  protected var TitleImage:Class;
  
  [Embed(source="../media/tiles.png")] 
  protected var TechTilesImage:Class;
  
  protected var levelBlocks:Array = new Array();
  protected var player:Player = null;

  
  public function GameState()
  {
   this.add(new FlxSprite(0,0,TitleImage));
//   levelBlocks.add(this.add(new FlxBlock(0,0,8,8)));
   
    player = new Player();
    this.add(player);
    FlxG.follow(player,2.5);
    FlxG.followAdjust(0.5,0.0);
    FlxG.followBounds(0,0,640,640);

  }
  
  public override function update():void
  {
   super.update();
   FlxG.collideArray(levelBlocks, player);
  }

 }

 }
