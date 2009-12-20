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
	 
	 protected var player:Player;
	 
	 protected var enemies:Array = new Array();

  
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
     FlxG.followBounds(0, 0, 640, 640);
	 
	 var myMonster:Monster = new  Monster(32, 128);
	 enemies[0] = myMonster;
	 this.add(myMonster);
	 
	 myMonster = new  Monster(64, 128);
	 enemies[1] = myMonster;
	 this.add(myMonster);

  }
  
  public override function update():void
  {
   super.update();
   
   		 if(FlxG.keys.justPressed("X"))
         {
	         player.attack();
 
			 var dx:Number, dy:Number, distance:Number;
			 var attackRange:Number = 20;
             for each (var enemy:EnemyClass in enemies)
            {
			 dx = (enemy.x - player.x);
			 dy = (enemy.y - player.y);
			 distance = Math.sqrt((dx*dx) + (dy*dy));
             if (distance < attackRange) enemy.hurt(5);
             }

         }
		 
   gameMap.collide(player);
   gameMap.collide(enemies[0]);
   gameMap.collide(enemies[1]);
  }

 }

 }
