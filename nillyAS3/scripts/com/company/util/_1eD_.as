package com.company.util
{
   import flash.utils.Dictionary;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.filters.BitmapFilter;
   import flash.geom.Point;
   
   public class _1eD_
   {
      
      private static var _f__:Dictionary = new Dictionary();
       
      
      public function _1eD_()
      {
         super();
      }
      
      public static function _6U_(param1:BitmapData, param2:ColorTransform) : BitmapData
      {
         var _loc3_:BitmapData = null;
         var _loc4_:Object = _f__[param1];
         if(_loc4_ != null)
         {
            _loc3_ = _loc4_[param2];
         }
         else
         {
            _loc4_ = new Object();
            _f__[param1] = _loc4_;
         }
         if(_loc3_ == null)
         {
            _loc3_ = param1.clone();
            _loc3_.colorTransform(_loc3_.rect,param2);
            _loc4_[param2] = _loc3_;
         }
         return _loc3_;
      }
      
      public static function _1L_(param1:BitmapData, param2:BitmapFilter) : BitmapData
      {
         var _loc3_:BitmapData = null;
         var _loc4_:Object = _f__[param1];
         if(_loc4_ != null)
         {
            _loc3_ = _loc4_[param2];
         }
         else
         {
            _loc4_ = new Object();
            _f__[param1] = _loc4_;
         }
         if(_loc3_ == null)
         {
            _loc3_ = param1.clone();
            _loc3_.applyFilter(_loc3_,_loc3_.rect,new Point(),param2);
            _loc4_[param2] = _loc3_;
         }
         return _loc3_;
      }
      
      public static function _0X_O_(param1:BitmapData, param2:Number) : BitmapData
      {
         var _loc3_:int = int(param2 * 100);
         var _loc4_:ColorTransform = new ColorTransform(1,1,1,_loc3_ / 100);
         return _6U_(param1,_loc4_);
      }
      
      public static function clear() : void
      {
         var _loc1_:Object = null;
         var _loc2_:BitmapData = null;
         for each(_loc1_ in _f__)
         {
            for each(_loc2_ in _loc1_)
            {
               _loc2_.dispose();
            }
         }
         _f__ = new Dictionary();
      }
   }
}
