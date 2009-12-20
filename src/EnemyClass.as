package
{
     import org.flixel.*;
 
     public class EnemyClass extends FlxSprite
     {
     protected static const RUN_SPEED:int = 80;
     protected static const GRAVITY_ACCELERATION:Number = 420;
     protected static const JUMP_ACCELERATION:Number = 250;
  
     public function EnemyClass(x:Number, y:Number, image:Class)
     {
         super(x, y, image);
         acceleration.y = GRAVITY_ACCELERATION;
         maxVelocity.x = RUN_SPEED;
         maxVelocity.y = JUMP_ACCELERATION;
     } 
     public override function update():void
     {
         super.update();
     }
 }
}

