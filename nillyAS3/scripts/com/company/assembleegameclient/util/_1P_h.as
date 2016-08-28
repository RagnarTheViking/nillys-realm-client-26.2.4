package com.company.assembleegameclient.util
{
   import flash.display.BitmapData;
   import com.company.util._n5;
   
   public class _1P_h
   {
       
      
      public var _0D_y:Vector.<com.company.assembleegameclient.util._18Q_>;
      
      public function _1P_h()
      {
         this._0D_y = new Vector.<com.company.assembleegameclient.util._18Q_>();
         super();
      }
      
      public function addFromBitmapData(param1:BitmapData, param2:BitmapData, param3:int, param4:int) : void
      {
         var _loc6_:_n5 = null;
         var _loc7_:int = 0;
         var _loc5_:_n5 = new _n5();
         _loc5_.addFromBitmapData(param1,param3,param4);
         if(param2 != null)
         {
            _loc6_ = new _n5();
            _loc6_.addFromBitmapData(param2,param3,param4);
         }
         while(_loc7_ < _loc5_._0D_y.length)
         {
            this._0D_y.push(new com.company.assembleegameclient.util._18Q_(_loc5_._0D_y[_loc7_],_loc6_ == null?null:_loc6_._0D_y[_loc7_]));
            _loc7_++;
         }
      }
      
      public function _1tE_(param1:com.company.assembleegameclient.util._18Q_, param2:int, param3:int) : void
      {
         this.addFromBitmapData(param1.image_,param1.mask_,param2,param3);
      }
   }
}
