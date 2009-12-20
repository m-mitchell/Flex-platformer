package
{
     import org.flixel.*;
 
     public class Monster extends EnemyClass
     {
		
     [Embed(source="../media/images/monster.png")] 
     protected var image:Class;
  
     public function Monster(x:Number, y:Number)
     {
         super(x, y, image);
   
         drag.x = RUN_SPEED * 8;
         acceleration.y = GRAVITY_ACCELERATION;
         maxVelocity.x = RUN_SPEED;
         maxVelocity.y = JUMP_ACCELERATION;
		 
		 health = 20;

     } 
	
	
     public override function update():void
     {
         super.update();
     }
 }
}

