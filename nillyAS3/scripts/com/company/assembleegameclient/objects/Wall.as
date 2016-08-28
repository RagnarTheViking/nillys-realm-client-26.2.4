package com.company.assembleegameclient.objects
{
   import com.company.assembleegameclient.engine3d.Face3D;
   import flash.display.BitmapData;
   import com.company.util.BitmapUtil;
   import flash.display.IGraphicsData;
   import com.company.assembleegameclient.map.View;
   import com.company.assembleegameclient.map.Square;
   
   public class Wall extends GameObject
   {
      
      private static const _Y_r:Vector.<Number> = new <Number>[0,0,0,1,0,0,1,1,0,0,1,0];
      
      private static const _1L_U_:Vector.<int> = new <int>[0,1,0,-1];
      
      private static const _0o7:Vector.<int> = new <int>[-1,0,1,0];
       
      
      public var faces_:Vector.<Face3D>;
      
      private var _1rp:Face3D = null;
      
      private var _Z_S_:BitmapData = null;
      
      public function Wall(param1:XML)
      {
         this.faces_ = new Vector.<Face3D>();
         super(param1);
         hasShadow = false;
         var _loc2_:_sV_ = ObjectLibrary._1eB_[objectType_];
         this._Z_S_ = _loc2_.getTexture(0);
      }
      
      override public function setObjectId(param1:int) : void
      {
         super.setObjectId(param1);
         var _loc2_:_sV_ = ObjectLibrary._1eB_[objectType_];
         this._Z_S_ = _loc2_.getTexture(param1);
      }
      
      override public function getColor() : uint
      {
         return BitmapUtil._05c(this._Z_S_);
      }
      
      override public function draw(param1:Vector.<IGraphicsData>, param2:View, param3:int) : void
      {
         var _loc4_:BitmapData = null;
         var _loc5_:Face3D = null;
         var _loc6_:Square = null;
         var _loc8_:int = 0;
         if(texture_ == null)
         {
            return;
         }
         if(this.faces_.length == 0)
         {
            this._0hp();
         }
         var _loc7_:BitmapData = texture_;
         if(_1s8 != null)
         {
            _loc4_ = _1s8.getTexture(param3);
            if(_loc4_ != null)
            {
               _loc7_ = _loc4_;
            }
         }
         while(_loc8_ < this.faces_.length)
         {
            _loc5_ = this.faces_[_loc8_];
            _loc6_ = map_.lookupSquare(x_ + _1L_U_[_loc8_],y_ + _0o7[_loc8_]);
            if(_loc6_ == null || _loc6_.texture_ == null || _loc6_.obj_ is Wall && !_loc6_.obj_.dying_)
            {
               _loc5_.isWall = true;
            }
            else
            {
               _loc5_.isWall = false;
               if(_1s8 != null)
               {
                  _loc5_.setTexture(_loc7_);
               }
            }
            _loc5_.draw(param1,param2);
            _loc8_++;
         }
         this._1rp.draw(param1,param2);
      }
      
      public function _0hp() : void
      {
         this.faces_.length = 0;
         var _loc1_:int = x_;
         var _loc2_:int = y_;
         var _loc3_:Vector.<Number> = new <Number>[_loc1_,_loc2_,1,_loc1_ + 1,_loc2_,1,_loc1_ + 1,_loc2_ + 1,1,_loc1_,_loc2_ + 1,1];
         this._1rp = new Face3D(this._Z_S_,_loc3_,_Y_r,false,true);
         this._1rp.bitmapFill_.repeat = true;
         this._1eV_(_loc1_,_loc2_,1,_loc1_ + 1,_loc2_,1);
         this._1eV_(_loc1_ + 1,_loc2_,1,_loc1_ + 1,_loc2_ + 1,1);
         this._1eV_(_loc1_ + 1,_loc2_ + 1,1,_loc1_,_loc2_ + 1,1);
         this._1eV_(_loc1_,_loc2_ + 1,1,_loc1_,_loc2_,1);
      }
      
      private function _1eV_(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc7_:Vector.<Number> = new <Number>[param1,param2,param3,param4,param5,param6,param4,param5,param6 - 1,param1,param2,param3 - 1];
         var _loc8_:Face3D = new Face3D(texture_,_loc7_,_Y_r,true,true);
         _loc8_.bitmapFill_.repeat = true;
         this.faces_.push(_loc8_);
      }
   }
}
