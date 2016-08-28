package ToolTips
{
   public class _1l1
   {
      
      public static const _0pA_:uint = 65280;
      
      public static const _ap:uint = 16711680;
      
      public static const _Q_q:uint = 16777103;
       
      
      public function _1l1()
      {
         super();
      }
      
      public static function _0lE_(param1:String, param2:String) : String
      {
         return "<font color=\"" + param2 + "\">" + param1 + "</font>";
      }
      
      public static function _07l(param1:uint) : String
      {
         return "<font color=\"#" + param1.toString(16) + "\">";
      }
      
      public static function _1S_Z_() : String
      {
         return "</font>";
      }
      
      public static function _0me(param1:Number) : String
      {
         var _loc2_:Number = param1 - int(param1);
         return int(_loc2_ * 10) == 0?int(param1).toString():param1.toFixed(1);
      }
      
      public static function _0dK_(param1:Number) : uint
      {
         if(param1 < 0)
         {
            return _ap;
         }
         if(param1 > 0)
         {
            return _0pA_;
         }
         return _Q_q;
      }
   }
}
