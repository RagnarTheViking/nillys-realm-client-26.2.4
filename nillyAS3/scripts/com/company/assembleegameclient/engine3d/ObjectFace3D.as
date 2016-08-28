package com.company.assembleegameclient.engine3d
{
   import flash.display.BitmapData;
   import flash.display.GraphicsBitmapFill;
   import flash.geom.Vector3D;
   import flash.display.GraphicsPath;
   import flash.display.GraphicsSolidFill;
   import flash.geom.Matrix;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.util.MoreColorUtil;
   import flash.geom.ColorTransform;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util.GraphicHelper;
   import _V_E_.HWAccelerate;
   import flash.display.GraphicsPathCommand;
   
   public class ObjectFace3D
   {
      
      public static const _0P_u:BitmapData = new BitmapData(1,1,true,4278190080);
       
      
      public const bitmapFill_:GraphicsBitmapFill = new GraphicsBitmapFill();
      
      public var obj_:com.company.assembleegameclient.engine3d._1ee;
      
      public var _013:Vector.<int>;
      
      public var _07A_:Boolean;
      
      public var _V_i:Boolean = false;
      
      public var texture_:BitmapData = null;
      
      public var normalL_:Vector3D = null;
      
      public var _1U_l:Vector3D;
      
      public var _pQ_:Number = 1;
      
      private var path_:GraphicsPath;
      
      private var _1A_6:GraphicsSolidFill;
      
      private var tToS_:Matrix;
      
      private var tempMatrix_:Matrix;
      
      public function ObjectFace3D(param1:com.company.assembleegameclient.engine3d._1ee, param2:Vector.<int>, param3:Boolean = true)
      {
         var _loc5_:int = 0;
         this._1A_6 = new GraphicsSolidFill(16777215,1);
         this.tToS_ = new Matrix();
         this.tempMatrix_ = new Matrix();
         super();
         this.obj_ = param1;
         this._013 = param2;
         this._07A_ = param3;
         var _loc4_:Vector.<int> = new Vector.<int>();
         while(_loc5_ < this._013.length)
         {
            _loc4_.push(_loc5_ == 0?GraphicsPathCommand.MOVE_TO:GraphicsPathCommand.LINE_TO);
            _loc5_++;
         }
         var _loc6_:Vector.<Number> = new Vector.<Number>();
         _loc6_.length = this._013.length * 2;
         this.path_ = new GraphicsPath(_loc4_,_loc6_);
      }
      
      public function dispose() : void
      {
         this._013 = null;
         this.path_.commands = null;
         this.path_.data = null;
         this.path_ = null;
      }
      
      public function _1Y_T_() : void
      {
         this._1U_l = new Vector3D();
         _001._aZ_(this.obj_._0aJ_(this._013[0]),this.obj_._0aJ_(this._013[1]),this.obj_._0aJ_(this._013[this._013.length - 1]),this._1U_l);
         this._pQ_ = _04S_._0T_h(this._1U_l,0.75);
         if(this.normalL_ != null)
         {
            this._1U_l = this.obj_._0x6.deltaTransformVector(this.normalL_);
         }
      }
      
      public function draw(param1:Vector.<IGraphicsData>, param2:uint, param3:BitmapData) : void
      {
         var _loc4_:int = 0;
         var _loc13_:int = 0;
         var _loc5_:int = this._013[0] * 2;
         var _loc6_:int = this._013[1] * 2;
         var _loc7_:int = this._013[this._013.length - 1] * 2;
         var _loc8_:Vector.<Number> = this.obj_.vS_;
         var _loc9_:Number = _loc8_[_loc6_] - _loc8_[_loc5_];
         var _loc10_:Number = _loc8_[_loc6_ + 1] - _loc8_[_loc5_ + 1];
         var _loc11_:Number = _loc8_[_loc7_] - _loc8_[_loc5_];
         var _loc12_:Number = _loc8_[_loc7_ + 1] - _loc8_[_loc5_ + 1];
         if(_loc9_ * _loc12_ - _loc10_ * _loc11_ < 0)
         {
            return;
         }
         if(!Parameters.data_.GPURender && (!this._07A_ || param3 == null))
         {
            this._1A_6.color = MoreColorUtil._cm(new ColorTransform(this._pQ_,this._pQ_,this._pQ_),param2);
            param1.push(this._1A_6);
         }
         else
         {
            if(param3 == null && Parameters.data_.GPURender)
            {
               param3 = _0P_u;
            }
            else
            {
               param3 = TextureRedrawer._dl(param3,this._pQ_);
            }
            this.bitmapFill_.bitmapData = param3;
            this.bitmapFill_.matrix = this._1re(param3);
            param1.push(this.bitmapFill_);
         }
         while(_loc13_ < this._013.length)
         {
            _loc4_ = this._013[_loc13_];
            this.path_.data[_loc13_ * 2] = _loc8_[_loc4_ * 2];
            this.path_.data[_loc13_ * 2 + 1] = _loc8_[_loc4_ * 2 + 1];
            _loc13_++;
         }
         param1.push(this.path_);
         param1.push(GraphicHelper.END_FILL);
         if(this._V_i && Parameters.hwAccel() && this.bitmapFill_ != null)
         {
            HWAccelerate.addBitmapFill(this.bitmapFill_,true);
         }
      }
      
      private function _1re(param1:BitmapData) : Matrix
      {
         var _loc2_:Vector.<Number> = this.obj_.uvts_;
         var _loc3_:int = this._013[0] * 3;
         var _loc4_:int = this._013[1] * 3;
         var _loc5_:int = this._013[this._013.length - 1] * 3;
         var _loc6_:Number = _loc2_[_loc3_] * param1.width;
         var _loc7_:Number = _loc2_[_loc3_ + 1] * param1.height;
         this.tToS_.a = _loc2_[_loc4_] * param1.width - _loc6_;
         this.tToS_.b = _loc2_[_loc4_ + 1] * param1.height - _loc7_;
         this.tToS_.c = _loc2_[_loc5_] * param1.width - _loc6_;
         this.tToS_.d = _loc2_[_loc5_ + 1] * param1.height - _loc7_;
         this.tToS_.tx = _loc6_;
         this.tToS_.ty = _loc7_;
         this.tToS_.invert();
         _loc3_ = this._013[0] * 2;
         _loc4_ = this._013[1] * 2;
         _loc5_ = this._013[this._013.length - 1] * 2;
         var _loc8_:Vector.<Number> = this.obj_.vS_;
         this.tempMatrix_.a = _loc8_[_loc4_] - _loc8_[_loc3_];
         this.tempMatrix_.b = _loc8_[_loc4_ + 1] - _loc8_[_loc3_ + 1];
         this.tempMatrix_.c = _loc8_[_loc5_] - _loc8_[_loc3_];
         this.tempMatrix_.d = _loc8_[_loc5_ + 1] - _loc8_[_loc3_ + 1];
         this.tempMatrix_.tx = _loc8_[_loc3_];
         this.tempMatrix_.ty = _loc8_[_loc3_ + 1];
         this.tToS_.concat(this.tempMatrix_);
         return this.tToS_;
      }
   }
}
