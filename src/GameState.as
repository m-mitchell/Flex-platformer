package
{
 import org.flixel.FlxSprite;
 import org.flixel.FlxState;
 import org.flixel.*;
 
 public class GameState extends FlxState
 {
  [Embed(source="../media/backgrounds/test.jpg")]
  protected var TitleImage:Class;
  
  [Embed(source="../media/tiles.png")] 
  protected var TechTilesImage:Class;
  
  protected var levelBlocks:Array = new Array();
  protected var player:Player = null;

  
  public function GameState()
  {
	 var background:FlxSprite = new FlxSprite(0, 0, TitleImage)
	 background.scrollFactor.x = background.scrollFactor.y = 0;
	 this.add(background);

	 var testBlock:FlxBlock = new FlxBlock(0, 16, 8, 8);
	 testBlock.loadGraphic(TechTilesImage);
	 this.add(testBlock); 
	 levelBlocks[0]=testBlock;
	 
   
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
