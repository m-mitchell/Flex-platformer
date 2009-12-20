package
{
     import org.flixel.*;
 
     public class Monster extends EnemyClass
     {
		
     [Embed(source="../media/images/monster.png")] 
     protected var image:Class;
	 
	 [Embed(source="../media/sound/ouch.mp3")] 
     protected var SndHurt:Class;
	 
	 [Embed(source="../media/sound/dead.mp3")] 
     protected var SndDead:Class;
  
     public function Monster(x:Number, y:Number)
     {
         super(x, y, image);		 
		 health = 20;

     } 
	
	
     public override function update():void
     {
         super.update();
     }
	 

	 public override function hurt(Damage:Number):void
     {

		 if ((health-Damage) > 0) FlxG.play(SndHurt);
		 else if(!dead) FlxG.play(SndDead);
		 
		 super.hurt(Damage);
     }
 }
}

