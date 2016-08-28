package com.company.assembleegameclient.util
{
   import flash.utils.Dictionary;
   import com.company.assembleegameclient.objects._sV_;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import flash.display.BitmapData;
   
   public class AnimatedLibrary
   {
      
      private static var _1zs:Dictionary = new Dictionary();
       
      
      public function AnimatedLibrary()
      {
         super();
      }
      
      public static function _0B_e(param1:String, param2:int) : _Z_4
      {
         var _loc4_:_sV_ = null;
         if(param1 == "")
         {
            _loc4_ = ObjectLibrary._1eh[param2];
            if(_loc4_ != null)
            {
               return _loc4_._1vr;
            }
         }
         var _loc3_:Vector.<_Z_4> = _1zs[param1];
         if(_loc3_ == null || param2 >= _loc3_.length)
         {
            return null;
         }
         return _loc3_[param2];
      }
      
      public static function add(param1:String, param2:BitmapData, param3:BitmapData, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         var _loc9_:_18Q_ = null;
         var _loc10_:Vector.<_Z_4> = new Vector.<_Z_4>();
         var _loc11_:_1P_h = new _1P_h();
         _loc11_.addFromBitmapData(param2,param3,param6,param7);
         for each(_loc9_ in _loc11_._0D_y)
         {
            _loc10_.push(new _Z_4(_loc9_,param4,param5,param8));
         }
         _1zs[param1] = _loc10_;
      }
   }
}
