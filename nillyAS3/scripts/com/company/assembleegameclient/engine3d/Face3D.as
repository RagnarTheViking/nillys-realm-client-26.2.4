package com.company.assembleegameclient.engine3d
{
   import flash.display.GraphicsSolidFill;
   import flash.display.BitmapData;
   import flash.display.GraphicsBitmapFill;
   import flash.display.GraphicsPath;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   import flash.geom.Utils3D;
   import com.company.util.GraphicHelper;
   import com.company.util._gT_;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import flash.geom.Vector3D;
   import flash.display.GraphicsPathCommand;
   
   public class Face3D
   {
      
      private static const _14r:GraphicsSolidFill = new GraphicsSolidFill(0,1);
       
      
      public var texture_:BitmapData;
      
      public var _1cQ_:Vector.<Number>;
      
      public var _0oD_:Vector.<Number>;
      
      public var vout_:Vector.<Number>;
      
      public var _O_3:Boolean;
      
      public var _pQ_:Number = 1;
      
      public var isWall:Boolean = false;
      
      private var isNew:Boolean = true;
      
      private var _12v:com.company.assembleegameclient.engine3d.TextureMatrix = null;
      
      public var bitmapFill_:GraphicsBitmapFill;
      
      private var path_:GraphicsPath;
      
      public function Face3D(param1:BitmapData, param2:Vector.<Number>, param3:Vector.<Number>, param4:Boolean = false, param5:Boolean = false)
      {
         var _loc6_:Vector3D = null;
         this.vout_ = new Vector.<Number>();
         this.bitmapFill_ = new GraphicsBitmapFill(null,null,false,false);
         this.path_ = new GraphicsPath(new Vector.<int>(),null);
         super();
         this.texture_ = param1;
         this._1cQ_ = param2;
         this._0oD_ = param3;
         this._O_3 = param4;
         if(param5)
         {
            _loc6_ = new Vector3D();
            _001._U_4(param2,_loc6_);
            this._pQ_ = _04S_._0T_h(_loc6_,0.75);
         }
         this.path_.commands.push(GraphicsPathCommand.MOVE_TO);
         var _loc7_:int = 3;
         while(_loc7_ < this._1cQ_.length)
         {
            this.path_.commands.push(GraphicsPathCommand.LINE_TO);
            _loc7_ = _loc7_ + 3;
         }
         this.path_.data = this.vout_;
      }
      
      public function dispose() : void
      {
         this.texture_ = null;
         this._1cQ_ = null;
         this._0oD_ = null;
         this.vout_ = null;
         this._12v = null;
         this.bitmapFill_ = null;
         this.path_.commands = null;
         this.path_.data = null;
         this.path_ = null;
      }
      
      public function setTexture(param1:BitmapData) : void
      {
         if(this.texture_ == param1)
         {
            return;
         }
         this.texture_ = param1;
         this.isNew = true;
      }
      
      public function _1H_d(param1:Vector.<Number>) : void
      {
         this._0oD_ = param1;
         this.isNew = true;
      }
      
      public function _1U_n() : Number
      {
         var _loc3_:int = 0;
         var _loc1_:Number = -Number.MAX_VALUE;
         var _loc2_:int = this.vout_.length;
         while(_loc3_ < _loc2_)
         {
            if(this.vout_[_loc3_ + 1] > _loc1_)
            {
               _loc1_ = this.vout_[_loc3_ + 1];
            }
            _loc3_ = _loc3_ + 2;
         }
         return _loc1_;
      }
      
      public function draw(param1:Vector.<IGraphicsData>, param2:View) : Boolean
      {
         var _loc3_:Vector.<Number> = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc14_:int = 0;
         Utils3D.projectVectors(param2.wToS_,this._1cQ_,this.vout_,this._0oD_);
         if(this._O_3)
         {
            _loc3_ = this.vout_;
            _loc4_ = _loc3_[2] - _loc3_[0];
            _loc5_ = _loc3_[3] - _loc3_[1];
            _loc6_ = _loc3_[4] - _loc3_[0];
            _loc7_ = _loc3_[5] - _loc3_[1];
            if(_loc4_ * _loc7_ - _loc5_ * _loc6_ > 0)
            {
               return false;
            }
         }
         var _loc8_:Number = param2.rect.x - 10;
         var _loc9_:Number = param2.rect.y - 10;
         var _loc10_:Number = param2.rect.right + 10;
         var _loc11_:Number = param2.rect.bottom + 10;
         var _loc12_:Boolean = true;
         var _loc13_:int = 0;
         while(_loc13_ < this.vout_.length)
         {
            _loc14_ = _loc13_ + 1;
            if(this.vout_[_loc13_] >= _loc8_ && this.vout_[_loc13_] <= _loc10_ && this.vout_[_loc14_] >= _loc9_ && this.vout_[_loc14_] <= _loc11_)
            {
               _loc12_ = false;
               break;
            }
            _loc13_ = _loc13_ + 2;
         }
         if(_loc12_)
         {
            return false;
         }
         if(this.isWall)
         {
            param1.push(_14r);
            param1.push(this.path_);
            param1.push(GraphicHelper.END_FILL);
            return true;
         }
         if(this.isNew)
         {
            this._1T_m();
         }
         this._12v.calculateTextureMatrix(this.vout_);
         this.bitmapFill_.bitmapData = this._12v.texture_;
         this.bitmapFill_.matrix = this._12v.tToS_;
         param1.push(this.bitmapFill_);
         param1.push(this.path_);
         param1.push(GraphicHelper.END_FILL);
         return true;
      }
      
      public function contains(param1:Number, param2:Number) : Boolean
      {
         if(_gT_._1cE_(this.vout_[0],this.vout_[1],this.vout_[2],this.vout_[3],this.vout_[4],this.vout_[5],param1,param2))
         {
            return true;
         }
         if(this.vout_.length == 8 && _gT_._1cE_(this.vout_[0],this.vout_[1],this.vout_[4],this.vout_[5],this.vout_[6],this.vout_[7],param1,param2))
         {
            return true;
         }
         return false;
      }
      
      private function _1T_m() : void
      {
         var _loc1_:BitmapData = TextureRedrawer._dl(this.texture_,this._pQ_);
         if(this._12v == null)
         {
            this._12v = new com.company.assembleegameclient.engine3d.TextureMatrix(_loc1_,this._0oD_);
         }
         else
         {
            this._12v.texture_ = _loc1_;
            this._12v._0lN_(this._0oD_);
         }
         this.isNew = false;
      }
   }
}
