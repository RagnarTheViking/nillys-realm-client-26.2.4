package com.company.assembleegameclient.map
{
   import flash.utils.Dictionary;
   import com.company.assembleegameclient.objects.Portrait;
   import flash.display.BitmapData;
   import com.company.util.BitmapUtil;
   
   public class GroundLibrary
   {
      
      public static const _01A_:Dictionary = new Dictionary();
      
      public static const _1T_r:Dictionary = new Dictionary();
      
      public static const _1eh:Dictionary = new Dictionary();
      
      private static var _0nm:Dictionary = new Dictionary();
      
      public static var _07h:Dictionary = new Dictionary();
      
      public static var _0Y_5:com.company.assembleegameclient.map._71;
       
      
      public function GroundLibrary()
      {
         super();
      }
      
      public static function add(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:int = 0;
         for each(_loc2_ in param1.Ground)
         {
            _loc3_ = int(_loc2_.@type);
            _01A_[_loc3_] = new com.company.assembleegameclient.map._71(_loc2_);
            _1T_r[_loc3_] = _loc2_;
            _1eh[_loc3_] = new Portrait(_loc2_);
            _07h[String(_loc2_.@id)] = _loc3_;
         }
         _0Y_5 = _01A_[255];
      }
      
      public static function _M_(param1:int) : String
      {
         var _loc2_:com.company.assembleegameclient.map._71 = _01A_[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.id_;
      }
      
      public static function getBitmapData(param1:int, param2:int = 0) : BitmapData
      {
         return _1eh[param1].getTexture(param2);
      }
      
      public static function getColor(param1:int) : uint
      {
         var _loc2_:XML = null;
         var _loc3_:uint = 0;
         var _loc4_:BitmapData = null;
         if(!_0nm.hasOwnProperty(param1))
         {
            _loc2_ = _1T_r[param1];
            if(_loc2_.hasOwnProperty("Color"))
            {
               _loc3_ = uint(_loc2_.Color);
            }
            else
            {
               _loc4_ = getBitmapData(param1);
               _loc3_ = BitmapUtil._05c(_loc4_);
            }
            _0nm[param1] = _loc3_;
         }
         return _0nm[param1];
      }
   }
}
