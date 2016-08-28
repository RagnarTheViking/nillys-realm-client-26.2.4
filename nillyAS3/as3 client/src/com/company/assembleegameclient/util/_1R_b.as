package com.company.assembleegameclient.util
{
   import flash.utils.Dictionary;
   import flash.display.BitmapData;
   
   public class _1R_b
   {
      
      private static var _02I_:Dictionary = new Dictionary();
      
      private static var _cV_:Dictionary = new Dictionary();
       
      
      public function _1R_b()
      {
         super();
      }
      
      public static function _1y8(param1:int, param2:BitmapData, param3:Number, param4:uint) : Vector.<uint>
      {
         var _loc7_:int = 0;
         var _loc5_:Vector.<uint> = _02I_[param1];
         if(_loc5_ != null)
         {
            return _loc5_;
         }
         _loc5_ = new Vector.<uint>();
         var _loc6_:Vector.<uint> = _1B_O_(param2);
         while(_loc7_ < _loc6_.length)
         {
            if(Math.random() < param3)
            {
               _loc5_.push(param4);
            }
            else
            {
               _loc5_.push(_loc6_[int(_loc6_.length * Math.random())]);
            }
            _loc7_++;
         }
         return _loc5_;
      }
      
      public static function _1B_O_(param1:BitmapData) : Vector.<uint>
      {
         var _loc2_:Vector.<uint> = _cV_[param1];
         if(_loc2_ == null)
         {
            _loc2_ = _6l(param1);
            _cV_[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      private static function _6l(param1:BitmapData) : Vector.<uint>
      {
         var _loc2_:int = 0;
         var _loc3_:uint = 0;
         var _loc5_:int = 0;
         var _loc4_:Vector.<uint> = new Vector.<uint>();
         while(_loc5_ < param1.width)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.height)
            {
               _loc3_ = param1.getPixel32(_loc5_,_loc2_);
               if((_loc3_ & 4278190080) != 0)
               {
                  _loc4_.push(_loc3_);
               }
               _loc2_++;
            }
            _loc5_++;
         }
         return _loc4_;
      }
   }
}
