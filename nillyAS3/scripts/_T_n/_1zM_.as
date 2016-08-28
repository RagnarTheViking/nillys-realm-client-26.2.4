package _T_n
{
   import flash.display.Sprite;
   import flash.display.DisplayObject;
   import _17B_._1dh;
   
   public class _1zM_ extends Sprite
   {
       
      
      public function _1zM_()
      {
         super();
      }
      
      public static function make(param1:DisplayObject) : Sprite
      {
         var _loc2_:_1dh = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:Sprite = new Sprite();
         var _loc4_:int = 8;
         param1.width = 291 - _loc4_;
         param1.height = 598 - _loc4_ * 2 - 2;
         _loc3_.addChild(param1);
         _loc2_ = new _1dh();
         _loc2_.draw(param1.width,param1.height + 2,_1dh._1b7);
         _loc2_.x = param1.x;
         param1.y--;
         _loc3_.addChild(_loc2_);
         return _loc3_;
      }
   }
}
