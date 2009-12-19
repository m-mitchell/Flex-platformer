package
{
 import org.flixel.*;
 
 public class Player extends FlxSprite
 {
  [Embed(source="../media/images/spaceman.png")] 
  protected var PlayerImage:Class;
  
  [Embed(source="../media/sound/jump.mp3")] 
  protected var SndJump:Class;

  
  protected static const PLAYER_START_X:int = 32;
  protected static const PLAYER_START_Y:int = 32;
  protected static const PLAYER_RUN_SPEED:int = 80;
  protected static const GRAVITY_ACCELERATION:Number = 420;
  protected static const JUMP_ACCELERATION:Number = 250;
  
public function Player()
  {
   super(PLAYER_START_X, PLAYER_START_Y);
   loadGraphic(PlayerImage, true, true, 32, 32);
   
   drag.x = PLAYER_RUN_SPEED * 8;
   acceleration.y = GRAVITY_ACCELERATION;
   maxVelocity.x = PLAYER_RUN_SPEED;
   maxVelocity.y = JUMP_ACCELERATION;
   
   addAnimation("idle", [0]);
   addAnimation("run", [1, 2, 0], 12);
   addAnimation("jump", [3]);
   addAnimation("idle_up", [5]);
   addAnimation("run_up", [6, 7, 8, 5], 12);
   addAnimation("jump_up", [9]);
   addAnimation("jump_down", [10]);
  }
  public override function update():void
  {
   acceleration.x = 0;
   if(FlxG.keys.LEFT)
   {
    facing = LEFT;
    acceleration.x = -drag.x;
   }
   else if(FlxG.keys.RIGHT)
   {
    facing = RIGHT;
    acceleration.x = drag.x;
   }
   if(FlxG.keys.UP && !velocity.y)
   {
	 FlxG.play(SndJump);
     velocity.y = -JUMP_ACCELERATION;
   }
   
   if(velocity.y != 0)
   {
    play("jump");
   }
   else if(velocity.x == 0)
   {
    play("idle");
   }
   else
   {
    play("run");
   }
   
   super.update();
  }

 }
}

