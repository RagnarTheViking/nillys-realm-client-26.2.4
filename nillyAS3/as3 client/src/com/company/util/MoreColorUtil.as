package com.company.util
{
   import flash.geom.ColorTransform;
   
   public class MoreColorUtil
   {
      
      public static const _iz:Array = [0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0,0,0,1,0];
      
      public static const _1rD_:Array = [0.3,0.59,0.11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0];
      
      public static const identity:ColorTransform = new ColorTransform();
      
      public static const invisible:ColorTransform = new ColorTransform(1,1,1,0,0,0,0,0);
      
      public static const _0U_:ColorTransform = new ColorTransform(1,1,1,0.3,0,0,0,0);
      
      public static const _0R_O_:ColorTransform = new ColorTransform(1,1,1,0.7,0,0,0,0);
      
      public static const _uv:ColorTransform = new ColorTransform(0.6,1,0.6,1,0,0,0,0);
      
      public static const _t2:ColorTransform = new ColorTransform(0.8,1,0.8,1,0,0,0,0);
      
      public static const _0ox:ColorTransform = new ColorTransform(0.2,1,0.2,1,0,100,0,0);
      
      public static const _0u0:ColorTransform = new ColorTransform(0.5,1,0.5,0.3,0,0,0,0);
      
      public static const _B_9:ColorTransform = new ColorTransform(0.3,1,0.3,0.5,0,0,0,0);
      
      public static const _vc:ColorTransform = new ColorTransform(1,0.5,0.5,1,0,0,0,0);
      
      public static const _14q:ColorTransform = new ColorTransform(1,0.7,0.7,1,0,0,0,0);
      
      public static const _yJ_:ColorTransform = new ColorTransform(1,0.2,0.2,1,100,0,0,0);
      
      public static const _B_2:ColorTransform = new ColorTransform(1,0.5,0.5,0.3,0,0,0,0);
      
      public static const _M_e:ColorTransform = new ColorTransform(1,0.3,0.3,0.5,0,0,0,0);
      
      public static const _91:ColorTransform = new ColorTransform(0.5,0.5,1,1,0,0,0,0);
      
      public static const _A_G_:ColorTransform = new ColorTransform(0.7,0.7,1,1,0,0,100,0);
      
      public static const _pY_:ColorTransform = new ColorTransform(0.3,0.3,1,1,0,0,100,0);
      
      public static const _0cU_:ColorTransform = new ColorTransform(0.5,0.5,1,0.3,0,0,0,0);
      
      public static const _11m:ColorTransform = new ColorTransform(0.3,0.3,1,0.5,0,0,0,0);
      
      public static const _0n7:ColorTransform = new ColorTransform(1,0.5,1,1,0,0,0,0);
      
      public static const _0w7:ColorTransform = new ColorTransform(1,0.2,1,1,100,0,100,0);
      
      public static const _J_J_:ColorTransform = new ColorTransform(0.6,0.6,0.6,1,0,0,0,0);
      
      public static const _S_I_:ColorTransform = new ColorTransform(0.4,0.4,0.4,1,0,0,0,0);
      
      public static const _0tK_:ColorTransform = new ColorTransform(1,1,1,1,255,255,255,0);
       
      
      public function MoreColorUtil(param1:StaticEnforcer)
      {
         super();
      }
      
      public static function _1zN_(param1:Number, param2:Number, param3:Number) : int
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:int = int(param1 / 60) % 6;
         var _loc8_:Number = param1 / 60 - Math.floor(param1 / 60);
         var _loc9_:Number = param3 * (1 - param2);
         var _loc10_:Number = param3 * (1 - _loc8_ * param2);
         var _loc11_:Number = param3 * (1 - (1 - _loc8_) * param2);
         switch(_loc7_)
         {
            case 0:
               _loc4_ = param3;
               _loc5_ = _loc11_;
               _loc6_ = _loc9_;
               break;
            case 1:
               _loc4_ = _loc10_;
               _loc5_ = param3;
               _loc6_ = _loc9_;
               break;
            case 2:
               _loc4_ = _loc9_;
               _loc5_ = param3;
               _loc6_ = _loc11_;
               break;
            case 3:
               _loc4_ = _loc9_;
               _loc5_ = _loc10_;
               _loc6_ = param3;
               break;
            case 4:
               _loc4_ = _loc11_;
               _loc5_ = _loc9_;
               _loc6_ = param3;
               break;
            case 5:
               _loc4_ = param3;
               _loc5_ = _loc9_;
               _loc6_ = _loc10_;
         }
         return int(Math.min(255,Math.floor(_loc4_ * 255))) << 16 | int(Math.min(255,Math.floor(_loc5_ * 255))) << 8 | int(Math.min(255,Math.floor(_loc6_ * 255)));
      }
      
      public static function _g8() : uint
      {
         return uint(16777215 * Math.random());
      }
      
      public static function randomColor32() : uint
      {
         return uint(16777215 * Math.random()) | 4278190080;
      }
      
      public static function _cm(param1:ColorTransform, param2:uint) : uint
      {
         var _loc3_:int = ((param2 & 16711680) >> 16) * param1.redMultiplier + param1.redOffset;
         _loc3_ = _loc3_ < 0?0:_loc3_ > 255?255:int(_loc3_);
         var _loc4_:int = ((param2 & 65280) >> 8) * param1.greenMultiplier + param1.greenOffset;
         _loc4_ = _loc4_ < 0?0:_loc4_ > 255?255:int(_loc4_);
         var _loc5_:int = (param2 & 255) * param1.blueMultiplier + param1.blueOffset;
         _loc5_ = _loc5_ < 0?0:_loc5_ > 255?255:int(_loc5_);
         return _loc3_ << 16 | _loc4_ << 8 | _loc5_;
      }
      
      public static function _hY_(param1:ColorTransform) : ColorTransform
      {
         return new ColorTransform(param1.redMultiplier,param1.greenMultiplier,param1.blueMultiplier,param1.alphaMultiplier,param1.redOffset,param1.greenOffset,param1.blueOffset,param1.alphaOffset);
      }
      
      public static function _16R_(param1:ColorTransform, param2:ColorTransform, param3:Number) : ColorTransform
      {
         if(param1 == null)
         {
            param1 = identity;
         }
         if(param2 == null)
         {
            param2 = identity;
         }
         var _loc4_:Number = 1 - param3;
         var _loc5_:ColorTransform = new ColorTransform(param1.redMultiplier * _loc4_ + param2.redMultiplier * param3,param1.greenMultiplier * _loc4_ + param2.greenMultiplier * param3,param1.blueMultiplier * _loc4_ + param2.blueMultiplier * param3,param1.alphaMultiplier * _loc4_ + param2.alphaMultiplier * param3,param1.redOffset * _loc4_ + param2.redOffset * param3,param1.greenOffset * _loc4_ + param2.greenOffset * param3,param1.blueOffset * _loc4_ + param2.blueOffset * param3,param1.alphaOffset * _loc4_ + param2.alphaOffset * param3);
         return _loc5_;
      }
      
      public static function _J_A_(param1:uint, param2:uint, param3:Number) : uint
      {
         var _loc4_:Number = 1 - param3;
         var _loc5_:uint = param1 >> 24 & 255;
         var _loc6_:uint = param1 >> 16 & 255;
         var _loc7_:uint = param1 >> 8 & 255;
         var _loc8_:uint = param1 & 255;
         var _loc9_:uint = param2 >> 24 & 255;
         var _loc10_:uint = param2 >> 16 & 255;
         var _loc11_:uint = param2 >> 8 & 255;
         var _loc12_:uint = param2 & 255;
         var _loc13_:uint = _loc5_ * _loc4_ + _loc9_ * param3;
         var _loc14_:uint = _loc6_ * _loc4_ + _loc10_ * param3;
         var _loc15_:uint = _loc7_ * _loc4_ + _loc11_ * param3;
         var _loc16_:uint = _loc8_ * _loc4_ + _loc12_ * param3;
         var _loc17_:uint = _loc13_ << 24 | _loc14_ << 16 | _loc15_ << 8 | _loc16_;
         return _loc17_;
      }
      
      public static function _aM_(param1:ColorTransform, param2:Number) : Number
      {
         var _loc3_:uint = param2 * 255;
         var _loc4_:uint = _loc3_ * param1.alphaMultiplier + param1.alphaOffset;
         _loc4_ = _loc4_ < 0?uint(0):_loc4_ > 255?uint(255):uint(_loc4_);
         return _loc4_ / 255;
      }
      
      public static function _1Y_y(param1:uint, param2:Number) : uint
      {
         var _loc3_:int = ((param1 & 16711680) >> 16) * param2;
         _loc3_ = _loc3_ < 0?0:_loc3_ > 255?255:int(_loc3_);
         var _loc4_:int = ((param1 & 65280) >> 8) * param2;
         _loc4_ = _loc4_ < 0?0:_loc4_ > 255?255:int(_loc4_);
         var _loc5_:int = (param1 & 255) * param2;
         _loc5_ = _loc5_ < 0?0:_loc5_ > 255?255:int(_loc5_);
         return _loc3_ << 16 | _loc4_ << 8 | _loc5_;
      }
      
      public static function _0W_9(param1:uint, param2:Number) : uint
      {
         var _loc3_:uint = param1 & 4278190080;
         var _loc4_:int = ((param1 & 16711680) >> 16) + param2 * 255;
         _loc4_ = _loc4_ < 0?0:_loc4_ > 255?255:int(_loc4_);
         var _loc5_:int = ((param1 & 65280) >> 8) + param2 * 255;
         _loc5_ = _loc5_ < 0?0:_loc5_ > 255?255:int(_loc5_);
         var _loc6_:int = (param1 & 255) + param2 * 255;
         _loc6_ = _loc6_ < 0?0:_loc6_ > 255?255:int(_loc6_);
         return _loc3_ | _loc4_ << 16 | _loc5_ << 8 | _loc6_;
      }
      
      public static function _T_R_(param1:uint) : Array
      {
         var _loc2_:Number = (param1 >> 24 & 255) / 256;
         return [_loc2_ * ((param1 >> 16 & 255) / 256),_loc2_ * ((param1 >> 8 & 255) / 256),_loc2_ * ((param1 & 255) / 256),_loc2_];
      }
      
      public static function _57(param1:uint) : uint
      {
         var _loc2_:uint = ((param1 & 16711680) >> 16) * 0.3 + ((param1 & 65280) >> 8) * 0.59 + (param1 & 255) * 0.11;
         return (param1 && 4278190080) | _loc2_ << 16 | _loc2_ << 8 | _loc2_;
      }
      
      public static function _U_W_(param1:uint) : Array
      {
         return [0,0,0,0,(param1 & 16711680) >> 16,0,0,0,0,(param1 & 65280) >> 8,0,0,0,0,param1 & 255,0,0,0,1,0];
      }
   }
}

class StaticEnforcer
{
    
   
   function StaticEnforcer()
   {
      super();
   }
}
