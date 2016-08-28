package com.company.assembleegameclient.engine3d
{
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   import flash.display.BitmapData;
   import flash.geom.Utils3D;
   
   public class _1ee
   {
       
      
      public var _go:com.company.assembleegameclient.engine3d._1aW_ = null;
      
      public var vL_:Vector.<Number>;
      
      public var uvts_:Vector.<Number>;
      
      public var faces_:Vector.<com.company.assembleegameclient.engine3d.ObjectFace3D>;
      
      public var vS_:Vector.<Number>;
      
      public var vW_:Vector.<Number>;
      
      public var _0x6:Matrix3D;
      
      public function _1ee(param1:com.company.assembleegameclient.engine3d._1aW_ = null)
      {
         var _loc2_:_py = null;
         this.faces_ = new Vector.<com.company.assembleegameclient.engine3d.ObjectFace3D>();
         this.vS_ = new Vector.<Number>();
         this.vW_ = new Vector.<Number>();
         this._0x6 = new Matrix3D();
         super();
         if(param1 != null)
         {
            this._go = param1;
            this.vL_ = this._go.vL_;
            this.uvts_ = this._go.uvts_.concat();
            for each(_loc2_ in this._go.faces_)
            {
               this.faces_.push(new com.company.assembleegameclient.engine3d.ObjectFace3D(this,_loc2_._0M_r,_loc2_._07A_));
            }
         }
         else
         {
            this.vL_ = new Vector.<Number>();
            this.uvts_ = new Vector.<Number>();
         }
         this.setPosition(0,0,0,0);
      }
      
      public static function getObject(param1:String) : _1ee
      {
         var _loc2_:com.company.assembleegameclient.engine3d._1aW_ = com.company.assembleegameclient.engine3d._1aW_._wU_(param1);
         return new _1ee(_loc2_);
      }
      
      public function dispose() : void
      {
         var _loc1_:com.company.assembleegameclient.engine3d.ObjectFace3D = null;
         this.vL_ = null;
         this.uvts_ = null;
         for each(_loc1_ in this.faces_)
         {
            _loc1_.dispose();
         }
         this.faces_.length = 0;
         this.faces_ = null;
         this.vS_ = null;
         this.vW_ = null;
         this._0x6 = null;
      }
      
      public function setPosition(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         var _loc5_:com.company.assembleegameclient.engine3d.ObjectFace3D = null;
         this._0x6.identity();
         this._0x6.appendRotation(param4,Vector3D.Z_AXIS);
         this._0x6.appendTranslation(param1,param2,param3);
         this._0x6.transformVectors(this.vL_,this.vW_);
         for each(_loc5_ in this.faces_)
         {
            _loc5_._1Y_T_();
         }
      }
      
      public function _0aJ_(param1:int) : Vector3D
      {
         var _loc2_:int = param1 * 3;
         if(_loc2_ >= this.vW_.length)
         {
            return null;
         }
         return new Vector3D(this.vW_[_loc2_],this.vW_[_loc2_ + 1],this.vW_[_loc2_ + 2]);
      }
      
      public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:uint, param4:BitmapData) : void
      {
         var _loc5_:com.company.assembleegameclient.engine3d.ObjectFace3D = null;
         Utils3D.projectVectors(param2.wToS_,this.vW_,this.vS_,this.uvts_);
         for each(_loc5_ in this.faces_)
         {
            _loc5_.draw(param1,param3,param4);
         }
      }
   }
}
