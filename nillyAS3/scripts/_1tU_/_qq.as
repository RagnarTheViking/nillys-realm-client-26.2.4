package _1tU_
{
   import flash.display.Sprite;
   
   public class _qq extends Sprite
   {
       
      
      public function _qq(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         graphics.beginFill(0,0);
         graphics.drawRect(0,0,param3,param4);
         graphics.endFill();
         this.x = param1;
         this.y = param2;
         buttonMode = true;
      }
   }
}
