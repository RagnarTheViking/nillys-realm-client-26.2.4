package _0Z_1
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.game.GameSpriteBase;
   
   public class Panel extends Sprite
   {
      
      public static const WIDTH:int = 200 - 12;
      
      public static const HEIGHT:int = 100 - 16;
       
      
      public var gs_:GameSpriteBase;
      
      public function Panel(param1:GameSpriteBase)
      {
         super();
         this.gs_ = param1;
      }
      
      public function draw() : void
      {
      }
   }
}
