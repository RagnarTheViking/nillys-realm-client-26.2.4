package _05G_
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.map.View;
   
   public class Background extends Sprite
   {
      
      public static const _01f:int = 0;
      
      public static const _1tW_:int = 1;
      
      public static const _0aH_:int = 2;
      
      public static const _1cY_:int = 3;
       
      
      public function Background()
      {
         super();
         visible = false;
      }
      
      public static function _H_f(param1:int) : Background
      {
         switch(param1)
         {
            case _01f:
               return null;
            case _1tW_:
               return new StarBackground();
            case _0aH_:
               return new NexusBackground();
            default:
               return null;
         }
      }
      
      public function draw(param1:View, param2:int) : void
      {
      }
   }
}
