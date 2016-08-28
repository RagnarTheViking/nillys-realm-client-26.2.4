package com.company.util
{
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class BitmapUtil
   {
       
      
      public function BitmapUtil(param1:StaticEnforcer)
      {
         super();
      }
      
      public static function mirror(param1:BitmapData, param2:int = 0) : BitmapData
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         if(param2 == 0)
         {
            param2 = param1.width;
         }
         var _loc4_:BitmapData = new BitmapData(param1.width,param1.height,true,0);
         while(_loc5_ < param2)
         {
            _loc3_ = 0;
            while(_loc3_ < param1.height)
            {
               _loc4_.setPixel32(param2 - _loc5_ - 1,_loc3_,param1.getPixel32(_loc5_,_loc3_));
               _loc3_++;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      public static function _P_U_(param1:BitmapData, param2:int) : BitmapData
      {
         var _loc3_:Matrix = new Matrix();
         _loc3_.translate(-param1.width / 2,-param1.height / 2);
         _loc3_.rotate(param2 * Math.PI / 2);
         _loc3_.translate(param1.height / 2,param1.width / 2);
         var _loc4_:BitmapData = new BitmapData(param1.height,param1.width,true,0);
         _loc4_.draw(param1,_loc3_);
         return _loc4_;
      }
      
      public static function _0P_V_(param1:BitmapData, param2:int, param3:int, param4:int, param5:int) : BitmapData
      {
         var _loc6_:BitmapData = new BitmapData(param4,param5);
         _loc6_.copyPixels(param1,new Rectangle(param2,param3,param4,param5),new Point(0,0));
         return _loc6_;
      }
      
      public static function _D_i(param1:BitmapData) : Number
      {
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < param1.width)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.height)
            {
               _loc3_ = param1.getPixel32(_loc5_,_loc2_) & 4278190080;
               if(_loc3_ == 0)
               {
                  _loc4_++;
               }
               _loc2_++;
            }
            _loc5_++;
         }
         return _loc4_ / (param1.width * param1.height);
      }
      
      public static function _05c(param1:BitmapData) : uint
      {
         var _loc2_:uint = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc6_:Dictionary = new Dictionary();
         while(_loc7_ < param1.width)
         {
            _loc4_ = 0;
            while(_loc4_ < param1.width)
            {
               _loc2_ = param1.getPixel32(_loc7_,_loc4_);
               if((_loc2_ & 4278190080) != 0)
               {
                  if(!_loc6_.hasOwnProperty(_loc2_))
                  {
                     _loc6_[_loc2_] = 1;
                  }
                  else
                  {
                     _loc10_ = _loc6_;
                     _loc11_ = _loc2_;
                     _loc12_ = _loc10_[_loc11_] + 1;
                     _loc10_[_loc11_] = _loc12_;
                  }
               }
               _loc4_++;
            }
            _loc7_++;
         }
         for(_loc3_ in _loc6_)
         {
            _loc2_ = uint(_loc3_);
            _loc5_ = _loc6_[_loc3_];
            if(_loc5_ > _loc9_ || _loc5_ == _loc9_ && _loc2_ > _loc8_)
            {
               _loc8_ = _loc2_;
               _loc9_ = _loc5_;
            }
         }
         return _loc8_;
      }
      
      public static function _1T_W_(param1:BitmapData, param2:IntPoint, param3:IntPoint) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = param1.width;
         var _loc9_:int = param1.height;
         var _loc10_:int = param2.x();
         var _loc11_:int = param2.y();
         var _loc12_:int = param3.x();
         var _loc13_:int = param3.y();
         var _loc14_:* = (_loc11_ > _loc13_?_loc11_ - _loc13_:_loc13_ - _loc11_) > (_loc10_ > _loc12_?_loc10_ - _loc12_:_loc12_ - _loc10_);
         if(_loc14_)
         {
            _loc4_ = _loc10_;
            _loc10_ = _loc11_;
            _loc11_ = _loc4_;
            _loc4_ = _loc12_;
            _loc12_ = _loc13_;
            _loc13_ = _loc4_;
            _loc4_ = _loc8_;
            _loc8_ = _loc9_;
            _loc9_ = _loc4_;
         }
         if(_loc10_ > _loc12_)
         {
            _loc4_ = _loc10_;
            _loc10_ = _loc12_;
            _loc12_ = _loc4_;
            _loc4_ = _loc11_;
            _loc11_ = _loc13_;
            _loc13_ = _loc4_;
         }
         var _loc15_:int = _loc12_ - _loc10_;
         var _loc16_:int = _loc11_ > _loc13_?int(_loc11_ - _loc13_):int(_loc13_ - _loc11_);
         var _loc17_:int = -(_loc15_ + 1) / 2;
         var _loc18_:int = _loc11_ > _loc13_?-1:1;
         var _loc19_:int = _loc12_ > _loc8_ - 1?int(_loc8_ - 1):int(_loc12_);
         var _loc20_:int = _loc11_;
         var _loc21_:int = _loc10_;
         if(_loc21_ < 0)
         {
            _loc17_ = _loc17_ + _loc16_ * -_loc21_;
            if(_loc17_ >= 0)
            {
               _loc5_ = _loc17_ / _loc15_ + 1;
               _loc20_ = _loc20_ + _loc18_ * _loc5_;
               _loc17_ = _loc17_ - _loc5_ * _loc15_;
            }
            _loc21_ = 0;
         }
         if(_loc18_ > 0 && _loc20_ < 0 || _loc18_ < 0 && _loc20_ >= _loc9_)
         {
            _loc6_ = _loc18_ > 0?int(-_loc20_ - 1):int(_loc20_ - _loc9_);
            _loc17_ = _loc17_ - _loc15_ * _loc6_;
            _loc7_ = -_loc17_ / _loc16_;
            _loc21_ = _loc21_ + _loc7_;
            _loc17_ = _loc17_ + _loc7_ * _loc16_;
            _loc20_ = _loc20_ + _loc6_ * _loc18_;
         }
         while(_loc21_ <= _loc19_)
         {
            if(_loc18_ > 0 && _loc20_ >= _loc9_ || _loc18_ < 0 && _loc20_ < 0)
            {
               break;
            }
            if(_loc14_)
            {
               if(_loc20_ >= 0 && _loc20_ < _loc9_ && param1.getPixel(_loc20_,_loc21_) == 0)
               {
                  return false;
               }
            }
            else if(_loc20_ >= 0 && _loc20_ < _loc9_ && param1.getPixel(_loc21_,_loc20_) == 0)
            {
               return false;
            }
            _loc17_ = _loc17_ + _loc16_;
            if(_loc17_ >= 0)
            {
               _loc20_ = _loc20_ + _loc18_;
               _loc17_ = _loc17_ - _loc15_;
            }
            _loc21_++;
         }
         return true;
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
