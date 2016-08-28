package com.company.assembleegameclient.util
{
   import flash.display.BitmapData;
   import com.company.util.BitmapUtil;
   
   public class _18Q_
   {
       
      
      public var image_:BitmapData;
      
      public var mask_:BitmapData;
      
      public function _18Q_(param1:BitmapData, param2:BitmapData)
      {
         super();
         this.image_ = param1;
         this.mask_ = param2;
      }
      
      public function width() : int
      {
         return this.image_.width;
      }
      
      public function height() : int
      {
         return this.image_.height;
      }
      
      public function mirror(param1:int = 0) : _18Q_
      {
         var _loc2_:BitmapData = BitmapUtil.mirror(this.image_,param1);
         var _loc3_:BitmapData = this.mask_ == null?null:BitmapUtil.mirror(this.mask_,param1);
         return new _18Q_(_loc2_,_loc3_);
      }
      
      public function _D_i() : Number
      {
         return BitmapUtil._D_i(this.image_);
      }
   }
}
