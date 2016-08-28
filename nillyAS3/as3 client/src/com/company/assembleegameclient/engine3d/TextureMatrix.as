package com.company.assembleegameclient.engine3d
{
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class TextureMatrix
   {
       
      
      public var texture_:BitmapData = null;
      
      public var tToS_:Matrix;
      
      private var _0jv:Matrix = null;
      
      private var tempMatrix_:Matrix;
      
      public function TextureMatrix(param1:BitmapData, param2:Vector.<Number>)
      {
         this.tToS_ = new Matrix();
         this.tempMatrix_ = new Matrix();
         super();
         this.texture_ = param1;
         this._0lN_(param2);
      }
      
      public function _1H_d(param1:Vector.<Number>) : void
      {
         this._0lN_(param1);
      }
      
      public function _1W_e(param1:Vector.<Number>) : void
      {
         this.calculateTextureMatrix(param1);
      }
      
      public function calculateTextureMatrix(param1:Vector.<Number>) : void
      {
         this.tToS_.a = this._0jv.a;
         this.tToS_.b = this._0jv.b;
         this.tToS_.c = this._0jv.c;
         this.tToS_.d = this._0jv.d;
         this.tToS_.tx = this._0jv.tx;
         this.tToS_.ty = this._0jv.ty;
         var _loc2_:int = param1.length - 2;
         var _loc3_:int = _loc2_ + 1;
         this.tempMatrix_.a = param1[2] - param1[0];
         this.tempMatrix_.b = param1[3] - param1[1];
         this.tempMatrix_.c = param1[_loc2_] - param1[0];
         this.tempMatrix_.d = param1[_loc3_] - param1[1];
         this.tempMatrix_.tx = param1[0];
         this.tempMatrix_.ty = param1[1];
         this.tToS_.concat(this.tempMatrix_);
      }
      
      public function _0lN_(param1:Vector.<Number>) : void
      {
         if(this.texture_ == null)
         {
            this._0jv = null;
            return;
         }
         var _loc2_:int = param1.length - 3;
         var _loc3_:Number = param1[0] * this.texture_.width;
         var _loc4_:Number = param1[1] * this.texture_.height;
         var _loc5_:Number = param1[3] * this.texture_.width;
         var _loc6_:Number = param1[4] * this.texture_.height;
         var _loc7_:Number = param1[_loc2_] * this.texture_.width;
         var _loc8_:Number = param1[_loc2_ + 1] * this.texture_.height;
         var _loc9_:Number = _loc5_ - _loc3_;
         var _loc10_:Number = _loc6_ - _loc4_;
         var _loc11_:Number = _loc7_ - _loc3_;
         var _loc12_:Number = _loc8_ - _loc4_;
         this._0jv = new Matrix(_loc9_,_loc10_,_loc11_,_loc12_,_loc3_,_loc4_);
         this._0jv.invert();
      }
   }
}
