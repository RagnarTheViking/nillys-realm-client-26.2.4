package com.company.assembleegameclient.util
{
   import flash.utils.Dictionary;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import com.company.assembleegameclient.map.View;
   import com.company.util.Trig;
   
   public class _Z_4
   {
      
      public static const RIGHT:int = 0;
      
      public static const LEFT:int = 1;
      
      public static const DOWN:int = 2;
      
      public static const UP:int = 3;
      
      public static const _0pI_:int = 4;
      
      public static const _M_J_:int = 0;
      
      public static const _E_S_:int = 1;
      
      public static const _t4:int = 2;
      
      public static const _0B_H_:int = 3;
      
      private static const _00K_:Vector.<Vector.<int>> = new <Vector.<int>>[new <int>[LEFT,UP,DOWN],new <int>[UP,LEFT,DOWN],new <int>[UP,RIGHT,DOWN],new <int>[RIGHT,UP,DOWN],new <int>[RIGHT,DOWN],new <int>[DOWN,RIGHT],new <int>[DOWN,LEFT],new <int>[LEFT,DOWN]];
      
      private static const _U_q:Number = Math.PI / 4;
       
      
      public var _0S_x:com.company.assembleegameclient.util._18Q_;
      
      private var width_:int;
      
      private var height_:int;
      
      private var _1sZ_:int;
      
      private var _1bM_:Dictionary;
      
      public function _Z_4(param1:com.company.assembleegameclient.util._18Q_, param2:int, param3:int, param4:int)
      {
         this._1bM_ = new Dictionary();
         super();
         this._0S_x = param1;
         this.width_ = param2;
         this.height_ = param3;
         this._1sZ_ = param4;
         var _loc5_:Dictionary = new Dictionary();
         var _loc6_:_1P_h = new _1P_h();
         _loc6_._1tE_(param1,param2,param3);
         if(param4 == RIGHT)
         {
            this._1bM_[RIGHT] = this._0iR_(0,false,false,_loc6_);
            this._1bM_[LEFT] = this._0iR_(0,true,false,_loc6_);
            if(_loc6_._0D_y.length >= 14)
            {
               this._1bM_[DOWN] = this._0iR_(7,false,true,_loc6_);
               if(_loc6_._0D_y.length >= 21)
               {
                  this._1bM_[UP] = this._0iR_(14,false,true,_loc6_);
               }
            }
         }
         else if(param4 == DOWN)
         {
            this._1bM_[DOWN] = this._0iR_(0,false,true,_loc6_);
            if(_loc6_._0D_y.length >= 14)
            {
               this._1bM_[RIGHT] = this._0iR_(7,false,false,_loc6_);
               this._1bM_[LEFT] = this._0iR_(7,true,false,_loc6_);
               if(_loc6_._0D_y.length >= 21)
               {
                  this._1bM_[UP] = this._0iR_(14,false,true,_loc6_);
               }
            }
            return;
         }
      }
      
      public function _0zW_() : BitmapData
      {
         var _loc1_:BitmapData = new _1wr(this.width_ * 7,this.height_,true,0);
         var _loc2_:Dictionary = this._1bM_[this._1sZ_];
         var _loc3_:Vector.<com.company.assembleegameclient.util._18Q_> = _loc2_[_M_J_];
         if(_loc3_.length > 0)
         {
            _loc1_.copyPixels(_loc3_[0].image_,_loc3_[0].image_.rect,new Point(0,0));
         }
         _loc3_ = _loc2_[_E_S_];
         if(_loc3_.length > 0)
         {
            _loc1_.copyPixels(_loc3_[0].image_,_loc3_[0].image_.rect,new Point(this.width_,0));
         }
         if(_loc3_.length > 1)
         {
            _loc1_.copyPixels(_loc3_[1].image_,_loc3_[1].image_.rect,new Point(this.width_ * 2,0));
         }
         _loc3_ = _loc2_[_t4];
         if(_loc3_.length > 0)
         {
            _loc1_.copyPixels(_loc3_[0].image_,_loc3_[0].image_.rect,new Point(this.width_ * 4,0));
         }
         if(_loc3_.length > 1)
         {
            _loc1_.copyPixels(_loc3_[1].image_,new Rectangle(this.width_,0,this.width_ * 2,this.height_),new Point(this.width_ * 5,0));
         }
         return _loc1_;
      }
      
      public function _0Z_Q_(param1:int, param2:int) : Vector.<com.company.assembleegameclient.util._18Q_>
      {
         return this._1bM_[param1][param2];
      }
      
      public function imageFromDir(param1:int, param2:int, param3:Number) : com.company.assembleegameclient.util._18Q_
      {
         var _loc4_:Vector.<com.company.assembleegameclient.util._18Q_> = null;
         if(this._1bM_[param1] != null)
         {
            _loc4_ = this._1bM_[param1][param2];
         }
         else
         {
            _loc4_ = this._1bM_[2][param2];
         }
         param3 = Math.max(0,Math.min(0.99999,param3));
         var _loc5_:int = param3 * _loc4_.length;
         return _loc4_[_loc5_];
      }
      
      public function imageFromAngle(param1:Number, param2:int, param3:Number) : com.company.assembleegameclient.util._18Q_
      {
         var _loc4_:int = int(param1 / _U_q + 4) % 8;
         var _loc5_:Vector.<int> = _00K_[_loc4_];
         var _loc6_:Dictionary = this._1bM_[_loc5_[0]];
         if(_loc6_ == null)
         {
            _loc6_ = this._1bM_[_loc5_[1]];
            if(_loc6_ == null)
            {
               _loc6_ = this._1bM_[_loc5_[2]];
            }
         }
         var _loc7_:Vector.<com.company.assembleegameclient.util._18Q_> = _loc6_[param2];
         param3 = Math.max(0,Math.min(0.99999,param3));
         var _loc8_:int = param3 * _loc7_.length;
         return _loc7_[_loc8_];
      }
      
      public function imageFromFacing(param1:Number, param2:View, param3:int, param4:Number) : com.company.assembleegameclient.util._18Q_
      {
         var _loc5_:Number = Trig._D___(param1 - param2.angleRad_);
         var _loc6_:int = int(_loc5_ / _U_q + 4) % 8;
         var _loc7_:Vector.<int> = _00K_[_loc6_];
         var _loc8_:Dictionary = this._1bM_[_loc7_[0]];
         if(_loc8_ == null)
         {
            _loc8_ = this._1bM_[_loc7_[1]];
            if(_loc8_ == null)
            {
               _loc8_ = this._1bM_[_loc7_[2]];
            }
         }
         var _loc9_:Vector.<com.company.assembleegameclient.util._18Q_> = _loc8_[param3];
         param4 = Math.max(0,Math.min(0.99999,param4));
         var _loc10_:int = param4 * _loc9_.length;
         return _loc9_[_loc10_];
      }
      
      private function _0iR_(param1:int, param2:Boolean, param3:Boolean, param4:_1P_h) : Dictionary
      {
         var _loc5_:Vector.<com.company.assembleegameclient.util._18Q_> = null;
         var _loc6_:BitmapData = null;
         var _loc7_:BitmapData = null;
         var _loc8_:Dictionary = new Dictionary();
         var _loc9_:com.company.assembleegameclient.util._18Q_ = param4._0D_y[param1 + 0];
         var _loc10_:com.company.assembleegameclient.util._18Q_ = param4._0D_y[param1 + 1];
         var _loc11_:com.company.assembleegameclient.util._18Q_ = param4._0D_y[param1 + 2];
         if(_loc11_._D_i() == 1)
         {
            _loc11_ = null;
         }
         var _loc12_:com.company.assembleegameclient.util._18Q_ = param4._0D_y[param1 + 4];
         var _loc13_:com.company.assembleegameclient.util._18Q_ = param4._0D_y[param1 + 5];
         if(_loc12_._D_i() == 1)
         {
            _loc12_ = null;
         }
         if(_loc13_._D_i() == 1)
         {
            _loc13_ = null;
         }
         var _loc14_:com.company.assembleegameclient.util._18Q_ = param4._0D_y[param1 + 6];
         if(_loc13_ != null && _loc14_._D_i() != 1)
         {
            _loc6_ = new _1wr(this.width_ * 3,this.height_,true,0);
            _loc6_.copyPixels(_loc13_.image_,new Rectangle(0,0,this.width_,this.height_),new Point(this.width_,0));
            _loc6_.copyPixels(_loc14_.image_,new Rectangle(0,0,this.width_,this.height_),new Point(this.width_ * 2,0));
            _loc7_ = null;
            if(_loc13_.mask_ != null || _loc14_.mask_ != null)
            {
               _loc7_ = new _1wr(this.width_ * 3,this.height_,true,0);
            }
            if(_loc13_.mask_ != null)
            {
               _loc7_.copyPixels(_loc13_.mask_,new Rectangle(0,0,this.width_,this.height_),new Point(this.width_,0));
            }
            if(_loc14_.mask_ != null)
            {
               _loc7_.copyPixels(_loc14_.mask_,new Rectangle(0,0,this.width_,this.height_),new Point(this.width_ * 2,0));
            }
            _loc13_ = new com.company.assembleegameclient.util._18Q_(_loc6_,_loc7_);
         }
         var _loc15_:Vector.<com.company.assembleegameclient.util._18Q_> = new Vector.<com.company.assembleegameclient.util._18Q_>();
         _loc15_.push(!!param2?_loc9_.mirror():_loc9_);
         _loc8_[_M_J_] = _loc15_;
         var _loc16_:Vector.<com.company.assembleegameclient.util._18Q_> = new Vector.<com.company.assembleegameclient.util._18Q_>();
         _loc16_.push(!!param2?_loc10_.mirror():_loc10_);
         if(_loc11_ != null)
         {
            _loc16_.push(!!param2?_loc11_.mirror():_loc11_);
         }
         else if(param3)
         {
            _loc16_.push(!!param2?_loc10_:_loc10_.mirror(7));
         }
         else
         {
            _loc16_.push(!!param2?_loc9_.mirror():_loc9_);
         }
         _loc8_[_E_S_] = _loc16_;
         if(_loc12_ == null && _loc13_ == null)
         {
            _loc5_ = _loc16_;
         }
         else
         {
            _loc5_ = new Vector.<com.company.assembleegameclient.util._18Q_>();
            if(_loc12_ != null)
            {
               _loc5_.push(!!param2?_loc12_.mirror():_loc12_);
            }
            if(_loc13_ != null)
            {
               _loc5_.push(!!param2?_loc13_.mirror():_loc13_);
            }
         }
         _loc8_[_t4] = _loc5_;
         return _loc8_;
      }
   }
}
