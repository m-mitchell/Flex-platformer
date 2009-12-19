package
{
 import org.flixel.FlxSprite;
 import org.flixel.FlxState;
 import org.flixel.*;
 
 public class GameState extends FlxState
 {
  [Embed(source="../media/images/backgrounds/test.jpg")]
  protected var TitleImage:Class;
  
  [Embed(source="../media/images/tiles.png")] 
  protected var TechTilesImage:Class;
  
  [Embed(source="../media/music/main.mp3")] 
  protected var BgMain:Class;
  
  protected var levelBlocks:Array = new Array();
  protected var player:Player = null;

  
  public function GameState()
  {
	 var background:FlxSprite = new FlxSprite(0, 0, TitleImage)
	 background.scrollFactor.x = background.scrollFactor.y = 0;
	 this.add(background);
	 FlxG.play(BgMain);

	 for (var i:Number = 0; i <= 10; i++) {
		 var testBlock:FlxBlock = new FlxBlock(0+32*i, 32*(i+1), 32, 32);
	     testBlock.loadGraphic(TechTilesImage);
	     this.add(testBlock); 
	     levelBlocks[i]=testBlock;
	 }
   
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
