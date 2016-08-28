package _0sx
{
   import _0cW_._1rz;
   import flash.geom.Matrix3D;
   import _0cW_.Screen3DHelper;
   import _0cW_._0iA_;
   import _0cW_._054;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.display3D.VertexBuffer3D;
   import flash.display3D.IndexBuffer3D;
   import flash.display.GraphicsBitmapFill;
   import _V_E_.HWAccelerate;
   import flash.geom.ColorTransform;
   import flash.display3D.Context3DProgramType;
   import flash.display.GraphicsGradientFill;
   import flash.display3D.Context3DVertexBufferFormat;
   
   public class Graphic3D
   {
      
      private static const _1wW_:Vector.<Number> = Vector.<Number>([-0.5,0.5,0,0,0,0,0.01,0,1,0.5,0.5,0,0,0,0,0.3,1,1,-0.5,-0.5,0,0,0,0,0.1,0,0,0.5,-0.5,0,0,0,0,0.2,1,0]);
      
      private static const _1M_1:Vector.<uint> = Vector.<uint>([0,1,2,2,1,3]);
       
      
      public var texture:_1rz;
      
      public var matrix3D:Matrix3D;
      
      public var context3D:Screen3DHelper;
      
      [Inject]
      public var _0Z_V_:_0sx._0F_U_;
      
      [Inject]
      public var _1uG_:_0iA_;
      
      [Inject]
      public var _1Q_H_:_054;
      
      private var bitmapData:BitmapData;
      
      private var matrix2D:Matrix;
      
      private var _Q_d:Matrix;
      
      private var _x5:Number = 0;
      
      private var _0hG_:Vector.<Number>;
      
      private var _1K_T_:VertexBuffer3D;
      
      private var _wQ_:VertexBuffer3D;
      
      private var _151:IndexBuffer3D;
      
      private var repeat:Boolean;
      
      public function Graphic3D()
      {
         this.matrix3D = new Matrix3D();
         super();
      }
      
      public function _0E_7(param1:GraphicsBitmapFill, param2:Screen3DHelper) : void
      {
         this.bitmapData = param1.bitmapData;
         this.repeat = param1.repeat;
         this.matrix2D = param1.matrix;
         this.texture = this._0Z_V_.make(param1.bitmapData);
         this._0hG_ = HWAccelerate._8L_(param1);
         this._1K_T_ = HWAccelerate._case_(param1);
         this._x5 = HWAccelerate._ad(param1);
         if(this._x5 != 0)
         {
            this._0hG_ = Vector.<Number>([0,-this._x5,0,0]);
         }
         this.transform();
         var _loc3_:ColorTransform = HWAccelerate._0pL_(this.bitmapData);
         param2.getContext().setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,2,Vector.<Number>([_loc3_.redMultiplier,_loc3_.greenMultiplier,_loc3_.blueMultiplier,_loc3_.alphaMultiplier]));
         param2.getContext().setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,3,Vector.<Number>([_loc3_.redOffset / 255,_loc3_.greenOffset / 255,_loc3_.blueOffset / 255,_loc3_.alphaOffset / 255]));
      }
      
      public function _0__9(param1:GraphicsGradientFill, param2:Screen3DHelper, param3:Number, param4:Number) : void
      {
         this._Q_d = param1.matrix;
         if(this._wQ_ == null || this._151 == null)
         {
            this._wQ_ = param2.getContext().createVertexBuffer(4,9);
            this._wQ_.uploadFromVector(_1wW_,0,4);
            this._151 = param2.getContext().createIndexBuffer(6);
            this._151.uploadFromVector(_1M_1,0,6);
         }
         this._Q_Z_(param3,param4);
      }
      
      private function _Q_Z_(param1:Number, param2:Number) : void
      {
         this.matrix3D.identity();
         var _loc3_:Vector.<Number> = this.matrix3D.rawData;
         _loc3_[4] = -this._Q_d.c;
         _loc3_[1] = -this._Q_d.b;
         _loc3_[0] = this._Q_d.a * 4;
         _loc3_[5] = this._Q_d.d * 4;
         _loc3_[12] = this._Q_d.tx / param1;
         _loc3_[13] = -this._Q_d.ty / param2;
         this.matrix3D.rawData = _loc3_;
      }
      
      private function transform() : void
      {
         this.matrix3D.identity();
         var _loc1_:Vector.<Number> = this.matrix3D.rawData;
         _loc1_[4] = -this.matrix2D.c;
         _loc1_[1] = -this.matrix2D.b;
         _loc1_[0] = this.matrix2D.a;
         _loc1_[5] = this.matrix2D.d;
         _loc1_[12] = this.matrix2D.tx;
         _loc1_[13] = -this.matrix2D.ty;
         this.matrix3D.rawData = _loc1_;
         this.matrix3D.prependScale(Math.ceil(this.texture._0Z_U_()),Math.ceil(this.texture.getHeight()),1);
         this.matrix3D.prependTranslation(0.5,-0.5,0);
      }
      
      public function _0Q_Y_(param1:Screen3DHelper) : void
      {
         var _loc2_:_1G_f = _1G_f.getInstance();
         param1.setProgram(_loc2_._10P_(param1,this.repeat));
         param1.setTextureAt(0,this.texture);
         if(this._1K_T_ != null)
         {
            param1.getContext().setVertexBufferAt(0,this._1K_T_,0,Context3DVertexBufferFormat.FLOAT_3);
            param1.getContext().setVertexBufferAt(1,this._1K_T_,3,Context3DVertexBufferFormat.FLOAT_2);
            param1.getContext().setProgramConstantsFromVector(Context3DProgramType.VERTEX,4,this._0hG_);
            param1.getContext().setVertexBufferAt(2,null,6,Context3DVertexBufferFormat.FLOAT_2);
            param1.drawTriangles(this._1Q_H_);
         }
         else
         {
            param1.setVertexBufferAt(0,this._1uG_,0,Context3DVertexBufferFormat.FLOAT_3);
            param1.setVertexBufferAt(1,this._1uG_,3,Context3DVertexBufferFormat.FLOAT_2);
            param1.getContext().setProgramConstantsFromVector(Context3DProgramType.VERTEX,4,this._0hG_);
            param1.getContext().setVertexBufferAt(2,null,6,Context3DVertexBufferFormat.FLOAT_2);
            param1.drawTriangles(this._1Q_H_);
         }
      }
      
      public function _10m(param1:Screen3DHelper) : void
      {
         param1.getContext().setVertexBufferAt(0,this._wQ_,0,Context3DVertexBufferFormat.FLOAT_3);
         param1.getContext().setVertexBufferAt(1,this._wQ_,3,Context3DVertexBufferFormat.FLOAT_4);
         param1.getContext().setVertexBufferAt(2,this._wQ_,7,Context3DVertexBufferFormat.FLOAT_2);
         param1.getContext().setTextureAt(0,null);
         param1.getContext().drawTriangles(this._151);
      }
      
      public function _nS_() : Matrix3D
      {
         return this.matrix3D;
      }
   }
}
