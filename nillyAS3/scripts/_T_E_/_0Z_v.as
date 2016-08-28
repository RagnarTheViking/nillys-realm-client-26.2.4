package _T_E_
{
   import flash.display.Sprite;
   
   public class _0Z_v
   {
      
      private static const _8v:Number = 95;
      
      public static const _0dM_:Number = 25;
      
      private static const _1jZ_:Number = 0.4;
      
      private static const _1____:Number = 0;
      
      public static const INFO_SPACING:uint = 28;
       
      
      public function _0Z_v()
      {
         super();
      }
      
      public static function _1P_T_() : Sprite
      {
         var _loc1_:Number = _8v;
         var _loc2_:Number = _0dM_;
         return _1F_X_(_loc1_,_loc2_);
      }
      
      public static function _1F_X_(param1:Number, param2:Number) : Sprite
      {
         var _loc3_:Sprite = new Sprite();
         return _0G_T_(_loc3_,param1,param2);
      }
      
      private static function _0G_T_(param1:Sprite, param2:Number, param3:Number) : Sprite
      {
         param1.graphics.beginFill(_1____,_1jZ_);
         param1.graphics.drawRoundRect(0,0,param2,param3,12,12);
         param1.graphics.endFill();
         return param1;
      }
   }
}
