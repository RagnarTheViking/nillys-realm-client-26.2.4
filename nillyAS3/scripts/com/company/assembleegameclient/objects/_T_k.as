package com.company.assembleegameclient.objects
{
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import _V_E_.HWAccelerate;
   
   public class _T_k
   {
       
      
      public var startTime_:int;
      
      public var color_:uint;
      
      public var _0lR_:int;
      
      public var _G_b:int;
      
      public var _1A_T_:int;
      
      public var _0U_T_:int;
      
      public var _0S_g:int;
      
      public function _T_k(param1:int, param2:uint, param3:Number, param4:int)
      {
         super();
         this.startTime_ = param1;
         this.color_ = param2;
         this._0lR_ = param3 * 1000;
         this._G_b = param4;
         this._1A_T_ = param2 >> 16 & 255;
         this._0U_T_ = param2 >> 8 & 255;
         this._0S_g = param2 & 255;
      }
      
      public function apply(param1:BitmapData, param2:int) : BitmapData
      {
         var _loc3_:int = (param2 - this.startTime_) % this._0lR_;
         var _loc4_:Number = Math.sin(_loc3_ / this._0lR_ * Math.PI);
         var _loc5_:Number = _loc4_ * 0.5;
         var _loc6_:ColorTransform = new ColorTransform(1 - _loc5_,1 - _loc5_,1 - _loc5_,1,_loc5_ * this._1A_T_,_loc5_ * this._0U_T_,_loc5_ * this._0S_g,0);
         var _loc7_:BitmapData = param1.clone();
         _loc7_.colorTransform(_loc7_.rect,_loc6_);
         return _loc7_;
      }
      
      public function _uM_(param1:BitmapData, param2:int) : void
      {
         var _loc3_:int = (param2 - this.startTime_) % this._0lR_;
         var _loc4_:Number = Math.sin(_loc3_ / this._0lR_ * Math.PI);
         var _loc5_:Number = _loc4_ * 0.5;
         var _loc6_:ColorTransform = new ColorTransform(1 - _loc5_,1 - _loc5_,1 - _loc5_,1,_loc5_ * this._1A_T_,_loc5_ * this._0U_T_,_loc5_ * this._0S_g,0);
         HWAccelerate._Q_T_(param1,_loc6_);
      }
      
      public function _1C_L_(param1:int) : Boolean
      {
         return param1 > this.startTime_ + this._0lR_ * this._G_b;
      }
   }
}
