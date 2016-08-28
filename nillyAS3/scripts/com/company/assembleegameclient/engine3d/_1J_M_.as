package com.company.assembleegameclient.engine3d
{
   import flash.display.GraphicsEndFill;
   import flash.display.GraphicsPathCommand;
   import flash.display.GraphicsPath;
   import flash.display.GraphicsBitmapFill;
   import flash.display.GraphicsSolidFill;
   import flash.geom.Vector3D;
   import flash.display.IGraphicsData;
   import flash.geom.Matrix3D;
   import com.company.assembleegameclient.map.View;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Utils3D;
   import com.company.util.Trig;
   
   public class _1J_M_
   {
      
      private static const _0J_2:Vector.<int> = new <int>[GraphicsPathCommand.MOVE_TO,GraphicsPathCommand.LINE_TO,GraphicsPathCommand.LINE_TO,GraphicsPathCommand.LINE_TO];
      
      private static const END_FILL:GraphicsEndFill = new GraphicsEndFill();
       
      
      private const data_:Vector.<Number> = new Vector.<Number>();
      
      private const path_:GraphicsPath = new GraphicsPath(_0J_2,this.data_);
      
      private const bitmapFill_:GraphicsBitmapFill = new GraphicsBitmapFill(null,new Matrix(),false,false);
      
      private const _1A_6:GraphicsSolidFill = new GraphicsSolidFill(0,1);
      
      public var size_:Number;
      
      public var _P_c:Vector3D;
      
      public function _1J_M_(param1:Number)
      {
         super();
         this.size_ = param1;
      }
      
      public function setSize(param1:Number) : void
      {
         this.size_ = param1;
      }
      
      public function draw(param1:Vector.<IGraphicsData>, param2:Vector3D, param3:Number, param4:Matrix3D, param5:View, param6:BitmapData, param7:uint = 0) : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Matrix = null;
         this._P_c = Utils3D.projectVector(param4,param2);
         if(this._P_c.w < 0)
         {
            return;
         }
         var _loc11_:Number = this._P_c.w * Math.sin(param5._1N_e.fieldOfView / 2 * Trig._P_0);
         var _loc12_:Number = this.size_ / _loc11_;
         this.data_.length = 0;
         if(param3 == 0)
         {
            this.data_.push(this._P_c.x - _loc12_,this._P_c.y - _loc12_,this._P_c.x + _loc12_,this._P_c.y - _loc12_,this._P_c.x + _loc12_,this._P_c.y + _loc12_,this._P_c.x - _loc12_,this._P_c.y + _loc12_);
         }
         else
         {
            _loc8_ = Math.cos(param3);
            _loc9_ = Math.sin(param3);
            this.data_.push(this._P_c.x + (_loc8_ * -_loc12_ + _loc9_ * -_loc12_),this._P_c.y + (_loc9_ * -_loc12_ - _loc8_ * -_loc12_),this._P_c.x + (_loc8_ * _loc12_ + _loc9_ * -_loc12_),this._P_c.y + (_loc9_ * _loc12_ - _loc8_ * -_loc12_),this._P_c.x + (_loc8_ * _loc12_ + _loc9_ * _loc12_),this._P_c.y + (_loc9_ * _loc12_ - _loc8_ * _loc12_),this._P_c.x + (_loc8_ * -_loc12_ + _loc9_ * _loc12_),this._P_c.y + (_loc9_ * -_loc12_ - _loc8_ * _loc12_));
         }
         if(param6 != null)
         {
            this.bitmapFill_.bitmapData = param6;
            _loc10_ = this.bitmapFill_.matrix;
            _loc10_.identity();
            _loc10_.scale(2 * _loc12_ / param6.width,2 * _loc12_ / param6.height);
            _loc10_.translate(-_loc12_,-_loc12_);
            _loc10_.rotate(param3);
            _loc10_.translate(this._P_c.x,this._P_c.y);
            param1.push(this.bitmapFill_);
         }
         else
         {
            this._1A_6.color = param7;
            param1.push(this._1A_6);
         }
         param1.push(this.path_);
         param1.push(END_FILL);
      }
   }
}
