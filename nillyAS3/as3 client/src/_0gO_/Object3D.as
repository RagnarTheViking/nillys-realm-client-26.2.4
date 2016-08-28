package _0gO_
{
   import flash.display.BitmapData;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import flash.display3D.textures.Texture;
   import _0sx._0F_U_;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.display3D.Context3DTextureFormat;
   
   public class Object3D
   {
      
      public static const _1k:BitmapData = new BitmapData(1,1,true,2290649343);
       
      
      public var _go:_0gO_._1S_3 = null;
      
      private var bitmapData:BitmapData;
      
      public var _E_e:Matrix3D;
      
      public var _1nl:Matrix3D;
      
      public var _0vl:Matrix3D;
      
      public var position:Vector3D;
      
      private var _0E_2:Number;
      
      private var texture_:Texture;
      
      public function Object3D(param1:_0gO_._1S_3)
      {
         super();
         this._go = param1;
         this._E_e = new Matrix3D();
         this._1nl = new Matrix3D();
         this._0vl = new Matrix3D();
      }
      
      public function _sW_(param1:BitmapData) : void
      {
         this.bitmapData = _0F_U_._0L_h(param1);
      }
      
      public function setPosition(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         this.position = new Vector3D(param1,-param2,param3);
         this._0E_2 = param4;
      }
      
      public function dispose() : void
      {
         if(this.texture_ != null)
         {
            this.texture_.dispose();
            this.texture_ = null;
         }
         this.bitmapData = null;
         this._E_e = null;
         this._1nl = null;
         this._0vl = null;
         this.position = null;
      }
      
      public function UpdateModelMatrix(param1:Number, param2:Number) : void
      {
         this._E_e.identity();
         this._E_e.appendRotation(-90,Vector3D.Z_AXIS);
         this._E_e.appendRotation(-this._0E_2,Vector3D.Z_AXIS);
         this._E_e.appendTranslation(this.position.x,this.position.y,0);
         this._E_e.appendTranslation(param1,param2,0);
      }
      
      public function GetModelMatrix() : Matrix3D
      {
         return this._E_e;
      }
      
      public function draw(param1:Context3D) : void
      {
         var _loc2_:_1W_5 = null;
         param1.setVertexBufferAt(0,this._go._1uG_,0,Context3DVertexBufferFormat.FLOAT_3);
         param1.setVertexBufferAt(1,this._go._1uG_,3,Context3DVertexBufferFormat.FLOAT_3);
         param1.setVertexBufferAt(2,this._go._1uG_,6,Context3DVertexBufferFormat.FLOAT_2);
         if(this.texture_ == null && this.bitmapData != null)
         {
            this.texture_ = param1.createTexture(this.bitmapData.width,this.bitmapData.height,Context3DTextureFormat.BGRA,false);
            this.texture_.uploadFromBitmapData(this.bitmapData);
         }
         else if(this.texture_ == null)
         {
            this.bitmapData = _1k;
            this.texture_ = param1.createTexture(this.bitmapData.width,this.bitmapData.height,Context3DTextureFormat.BGRA,false);
            this.texture_.uploadFromBitmapData(this.bitmapData);
         }
         param1.setTextureAt(0,this.texture_);
         for each(_loc2_ in this._go._4P_)
         {
            if(_loc2_._1Q_H_ != null)
            {
               param1.drawTriangles(_loc2_._1Q_H_);
            }
         }
      }
   }
}
