﻿package
{
     import org.flixel.*;
 
     public class Player extends FlxSprite
     {
         [Embed(source="../media/images/player.png")] 
         protected var PlayerImage:Class;
  
         [Embed(source="../media/sound/jump.mp3")] 
         protected var SndJump:Class;
		 protected var FlxSndJump:FlxSound = new FlxSound();
		 
		 [Embed(source="../media/sound/pew.mp3")] 
         protected var SndAttack:Class;
		 
		 [Embed(source="../media/sound/ouch.mp3")] 
         protected var SndHurt:Class;
		 
	     [Embed(source="../media/sound/dead.mp3")] 
         protected var SndDead:Class;
  
  
     protected static const PLAYER_START_X:int = 32;
     protected static const PLAYER_START_Y:int = 32;
     protected static const PLAYER_RUN_SPEED:int = 80;
     protected static const GRAVITY_ACCELERATION:Number = 420;
     protected static const JUMP_ACCELERATION:Number = 250;
	 protected var ATTACKING:Number = 0;
	 protected var INVINCIBLE:Number = 0;
  
     public function Player()
     {
         super(PLAYER_START_X, PLAYER_START_Y);
		 
		 health = 100;
		 
         loadGraphic(PlayerImage, true, true, 32, 32);
   
         drag.x = PLAYER_RUN_SPEED * 8;
         acceleration.y = GRAVITY_ACCELERATION;
         maxVelocity.x = PLAYER_RUN_SPEED;
         maxVelocity.y = JUMP_ACCELERATION;
   
         addAnimation("idle", [0]);
         addAnimation("run", [1, 2, 0], 12);
         addAnimation("jump", [3]);
         addAnimation("attack", [4, 5, 0], 12, false);
		 
		 FlxSndJump.loadEmbedded(SndJump, false);
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
	         FlxSndJump.play();
             velocity.y = -JUMP_ACCELERATION;
         }
		 
         if (ATTACKING >= 0) {
			 ATTACKING--;
	     }
		 else if(velocity.y != 0)
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
		 
		 if (INVINCIBLE > 0) {
			 INVINCIBLE--;
		 }
		 
         super.update();
     }

     public override function hitCeiling(Contact:FlxCore = null):Boolean 
	 { 
		 velocity.y = JUMP_ACCELERATION; 
		 return true; 
	 }
	 
	 public override function hurt(Damage:Number):void
     {
         if(INVINCIBLE <= 0) {
		     if ((health-Damage) > 0) FlxG.play(SndHurt);
	    	 else if(!dead) FlxG.play(SndDead);
		 
		     super.hurt(Damage);
		      INVINCIBLE = 100;
		 }
     }
	 
	 public function attack():void
	 {
		 
		FlxG.play(SndAttack);
			 ATTACKING = 12;
			 play("attack");
	 }
 }
}

