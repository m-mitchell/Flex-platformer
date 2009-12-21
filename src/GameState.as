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
	 
  protected var HUD:FlxLayer = new FlxLayer();
	 
  [Embed(source="../media/images/bar_status.png")]
  protected var imgStatusBar:Class;
  protected var sprStatusBar:FlxSprite;

  [Embed(source="../media/images/hp_bar.png")]
  protected var imgHpBar:Class;
  protected var sprHpBar:FlxSprite;
	 
  protected var player:Player;
  protected var enemies:Array = new Array();
 
  protected const HPBAR_WIDTH:Number = 65;
 
  public function GameState() {

    var background:FlxSprite = new FlxSprite(0, 0, TitleImage)
    background.scrollFactor.x = background.scrollFactor.y = 0;
    this.add(background);
 
    backgroundMusic.loadEmbedded(BgMain, true);
    backgroundMusic.play();

     player = new Player();
     this.add(player);
     FlxG.follow(player,2.5);
     FlxG.followAdjust(0.5,0.0);
     FlxG.followBounds(32, 32, (gameMap.widthInTiles-1)*32, (gameMap.heightInTiles-1)*32);
	 
    this.add(gameMap);

    for (var i:Number = 0; i <= 10; i++) {
    var myMonster:Monster = new  Monster(32+32*i, 128);
      enemies[i] = myMonster;
      this.add(myMonster);
    }

    HUD.scrollFactor.x = 0;
    HUD.scrollFactor.y = 0;
    this.add(HUD);

    // player status bar
    sprHpBar = new FlxSprite(FlxG.width-45, FlxG.height-9, imgHpBar)    
    this.add(sprHpBar);
    sprStatusBar = new FlxSprite(FlxG.width-90, FlxG.height-20, imgStatusBar);
    this.add(sprStatusBar);
	 
  }
  
  public override function update():void {

    super.update();
   
    // Check for collision between player's melee attack and enemy
    if(FlxG.keys.justPressed("X")) {
      player.attack();
      
      var dx:Number, dy:Number, distance:Number;
      var attackRange:Number = 32;
      var monsterInFront:Boolean = false;
      for each (var enemy:EnemyClass in enemies) {
        dx = (enemy.x - player.x);
	dy = (enemy.y - player.y);
	distance = Math.sqrt((dx * dx) + (dy * dy));
	monsterInFront = (player.facing == 0 && enemy.x <= player.x) || (player.facing == 1 && enemy.x >= player.x);
        
        if (distance < attackRange && monsterInFront == true) enemy.hurt(5);
      }

   }

   // Check for collision between tiles and player
   gameMap.collide(player);
   
   // Check for collisions between tiles and enemies
   for each (enemy in enemies) gameMap.collide(enemy);
   
   //Check for collision between player and enemies
   FlxG.overlapArray(enemies, player, playerEnemyCollide);
  
   // Update player health bar. TODO: need a global to fix magic variable for players health.
   sprHpBar.scale.x = Math.floor(player.health / 100 * HPBAR_WIDTH);
 
  }
  
  protected function playerEnemyCollide(enemy:EnemyClass, player:Player):void {
	player.hurt(5);
  }

 }

}
