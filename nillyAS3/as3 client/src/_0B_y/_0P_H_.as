package _0B_y
{
   import flash.utils.Dictionary;
   
   public class _0P_H_
   {
       
      
      public function _0P_H_()
      {
         super();
      }
      
      public static function _1t0(param1:Dictionary) : Array
      {
         var _loc2_:* = null;
         var _loc3_:Array = new Array();
         for(_loc2_ in param1)
         {
            _loc3_.push(_loc2_);
         }
         return _loc3_;
      }
      
      public static function _w2(param1:Dictionary) : Array
      {
         var _loc2_:Object = null;
         var _loc3_:Array = new Array();
         for each(_loc2_ in param1)
         {
            _loc3_.push(_loc2_);
         }
         return _loc3_;
      }
   }
}
