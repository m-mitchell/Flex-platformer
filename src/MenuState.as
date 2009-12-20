package
{
 import org.flixel.*;
 
 public class MenuState extends FlxState
 {
  [Embed(source="../media/images/backgrounds/menu_grad.jpg")]
  protected var BgGrad:Class;
  [Embed(source="../media/images/cloud.png")] 
  protected var imgCloud:Class;
  [Embed(source="../media/images/logo.png")] 
  protected var imgLogo:Class;
  [Embed(source="../media/images/pressx.png")]
  protected var imgPressX:Class;

  [Embed(source="../media/music/main.mp3")] 
  protected var BgMain:Class;
  protected var backgroundMusic:FlxSound = new FlxSound();
 
  // sprites TODO: cleanup magic variables, how do we get a sprites width? 
  protected var sprLogo:FlxSprite = new FlxSprite(FlxG.width/2 - 436/2, 70, imgLogo); 
  protected var sprCloud:FlxSprite = new FlxSprite(FlxG.width/2 - 416/2, 50, imgCloud);
  protected var sprPressX:FlxSprite = new FlxSprite(FlxG.width/2 - 302/2, 220, imgPressX);

  // animation business
  private const ANIM_CLOUD_HEIGHT:Number = sprCloud.offset.y;
  private const ANIM_DIV:Number = 8;
  private const ANIM_PRESSX_HEIGHT:Number = sprPressX.offset.y;
  private const ANIM_SPEED:Number = 2;
  private var toggle:Number = 0;
  private var newCloud_y:Number = 0;

  public function MenuState()
  {
   this.add(new FlxSprite(0, 0, BgGrad));
   this.add(sprCloud);
   this.add(sprLogo);
   this.add(sprPressX);
   backgroundMusic.loadEmbedded(BgMain, true);
   backgroundMusic.play();
  }
  
  public override function update():void
  {
     super.update();
     if (FlxG.keys.justPressed("X")) {
       backgroundMusic.stop();
       FlxG.switchState(GameState);
     }

     // logo animation
     if(toggle) {
       if(newCloud_y > ANIM_SPEED * ANIM_DIV) toggle ^= 1;
       sprCloud.offset.y = ANIM_CLOUD_HEIGHT + (newCloud_y / ANIM_DIV);
       sprPressX.offset.y = -(ANIM_PRESSX_HEIGHT + (newCloud_y / ANIM_DIV));
       newCloud_y++;
     } else {
       if(newCloud_y == 0) toggle ^= 1;
       sprCloud.offset.y = ANIM_CLOUD_HEIGHT + (newCloud_y / ANIM_DIV);
       sprPressX.offset.y = -(ANIM_PRESSX_HEIGHT + (newCloud_y / ANIM_DIV));
       newCloud_y--;
     }
  }
 }
}
