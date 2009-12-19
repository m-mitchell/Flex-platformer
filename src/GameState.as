package
{
 import org.flixel.*;
 
 public class GameState extends FlxState
 {
  [Embed(source="../media/images/backgrounds/test.jpg")]
  protected var TitleImage:Class;
  
  [Embed(source="../media/images/tiles.png")] 
  protected var TilesImage:Class;
  
  [Embed(source="../media/music/main.mp3")] 
  protected var BgMain:Class;
  protected var backgroundMusic:FlxSound = new FlxSound();
  
     [Embed(source = "../media/maps/0.txt", mimeType = "application/octet-stream")]
	 protected var mapData:Class;
	 protected var gameMap:FlxTilemap = new FlxTilemap(new mapData, TilesImage, 32);

  
  public function GameState()
  {
	 var background:FlxSprite = new FlxSprite(0, 0, TitleImage)
	 background.scrollFactor.x = background.scrollFactor.y = 0;
	 this.add(background);

	 backgroundMusic.loadEmbedded(BgMain, true);
	 backgroundMusic.play();
	 
	 this.add(gameMap);

   
     player = new Player();
     this.add(player);
     FlxG.follow(player,2.5);
     FlxG.followAdjust(0.5,0.0);
     FlxG.followBounds(0,0,640,640);

  }
  
  public override function update():void
  {
   super.update();
   gameMap.collide(player);
  }

 }

 }
