package com.company.util
{
   public class Trig
   {
      
      public static const _0qM_:Number = 180 / Math.PI;
      
      public static const _P_0:Number = Math.PI / 180;
       
      
      public function Trig(param1:StaticEnforcer)
      {
         super();
      }
      
      public static function _X_F_(param1:Number, param2:Number, param3:Number) : Number
      {
         var _loc4_:Number = Number.MAX_VALUE;
         if(param1 > param2)
         {
            if(param1 - param2 > Math.PI)
            {
               _loc4_ = param1 * (1 - param3) + (param2 + 2 * Math.PI) * param3;
            }
            else
            {
               _loc4_ = param1 * (1 - param3) + param2 * param3;
            }
         }
         else if(param2 - param1 > Math.PI)
         {
            _loc4_ = (param1 + 2 * Math.PI) * (1 - param3) + param2 * param3;
         }
         else
         {
            _loc4_ = param1 * (1 - param3) + param2 * param3;
         }
         if(_loc4_ < -Math.PI || _loc4_ > Math.PI)
         {
            _loc4_ = _D___(_loc4_);
         }
         return _loc4_;
      }
      
      public static function _ey(param1:Number, param2:Number) : Number
      {
         if(param1 > param2)
         {
            if(param1 - param2 > Math.PI)
            {
               return param2 + 2 * Math.PI - param1;
            }
            return param1 - param2;
         }
         if(param2 - param1 > Math.PI)
         {
            return param1 + 2 * Math.PI - param2;
         }
         return param2 - param1;
      }
      
      public static function sin(param1:Number) : Number
      {
         var _loc2_:Number = NaN;
         if(param1 < -Math.PI || param1 > Math.PI)
         {
            param1 = _D___(param1);
         }
         if(param1 < 0)
         {
            _loc2_ = 1.27323954 * param1 + 0.405284735 * param1 * param1;
            if(_loc2_ < 0)
            {
               _loc2_ = 0.225 * (_loc2_ * -_loc2_ - _loc2_) + _loc2_;
            }
            else
            {
               _loc2_ = 0.225 * (_loc2_ * _loc2_ - _loc2_) + _loc2_;
            }
         }
         else
         {
            _loc2_ = 1.27323954 * param1 - 0.405284735 * param1 * param1;
            if(_loc2_ < 0)
            {
               _loc2_ = 0.225 * (_loc2_ * -_loc2_ - _loc2_) + _loc2_;
            }
            else
            {
               _loc2_ = 0.225 * (_loc2_ * _loc2_ - _loc2_) + _loc2_;
            }
         }
         return _loc2_;
      }
      
      public static function cos(param1:Number) : Number
      {
         return sin(param1 + Math.PI / 2);
      }
      
      public static function atan2(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = NaN;
         if(param2 == 0)
         {
            if(param1 < 0)
            {
               return -Math.PI / 2;
            }
            if(param1 > 0)
            {
               return Math.PI / 2;
            }
            return undefined;
         }
         if(param1 == 0)
         {
            if(param2 < 0)
            {
               return Math.PI;
            }
            return 0;
         }
         if((param2 > 0?param2:-param2) > (param1 > 0?param1:-param1))
         {
            _loc3_ = (param2 < 0?-Math.PI:0) + atan2Helper(param1,param2);
         }
         else
         {
            _loc3_ = (param1 > 0?Math.PI / 2:-Math.PI / 2) - atan2Helper(param2,param1);
         }
         if(_loc3_ < -Math.PI || _loc3_ > Math.PI)
         {
            _loc3_ = _D___(_loc3_);
         }
         return _loc3_;
      }
      
      public static function atan2Helper(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = param1 / param2;
         var _loc4_:Number = _loc3_;
         var _loc5_:Number = _loc3_;
         var _loc6_:Number = 1;
         var _loc7_:int = 1;
         do
         {
            _loc6_ = _loc6_ + 2;
            _loc7_ = _loc7_ > 0?-1:1;
            _loc5_ = _loc5_ * _loc3_ * _loc3_;
            _loc4_ = _loc4_ + _loc7_ * _loc5_ / _loc6_;
         }
         while((_loc5_ > 0.01 || _loc5_ < -0.01) && _loc6_ <= 11);
         
         return _loc4_;
      }
      
      public static function _D___(param1:Number) : Number
      {
         var _loc2_:int = 0;
         if(param1 < -Math.PI)
         {
            _loc2_ = (int(param1 / -Math.PI) + 1) / 2;
            param1 = param1 + _loc2_ * 2 * Math.PI;
         }
         else if(param1 > Math.PI)
         {
            _loc2_ = (int(param1 / Math.PI) + 1) / 2;
            param1 = param1 - _loc2_ * 2 * Math.PI;
         }
         return param1;
      }
      
      public static function _0M_c(param1:Number) : Number
      {
         var _loc2_:int = 0;
         if(param1 < -180)
         {
            _loc2_ = (int(param1 / -180) + 1) / 2;
            param1 = param1 + _loc2_ * 360;
         }
         else if(param1 > 180)
         {
            _loc2_ = (int(param1 / 180) + 1) / 2;
            param1 = param1 - _loc2_ * 360;
         }
         return param1;
      }
      
      public static function _03() : Boolean
      {
         var _loc1_:Boolean = testFunc1(Math.sin,sin) && testFunc1(Math.cos,cos) && testFunc2(Math.atan2,atan2);
         if(_loc1_)
         {
         }
         return _loc1_;
      }
      
      public static function testFunc1(param1:Function, param2:Function) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc6_:int = 0;
         var _loc5_:Random = new Random();
         while(_loc6_ < 1000)
         {
            _loc3_ = _loc5_._R_h() % 2000 - 1000 + _loc5_._0n6();
            _loc4_ = Math.abs(param1(_loc3_) - param2(_loc3_));
            if(_loc4_ > 0.1)
            {
               return false;
            }
            _loc6_++;
         }
         return true;
      }
      
      public static function testFunc2(param1:Function, param2:Function) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc7_:int = 0;
         var _loc6_:Random = new Random();
         while(_loc7_ < 1000)
         {
            _loc3_ = _loc6_._R_h() % 2000 - 1000 + _loc6_._0n6();
            _loc4_ = _loc6_._R_h() % 2000 - 1000 + _loc6_._0n6();
            _loc5_ = Math.abs(param1(_loc3_,_loc4_) - param2(_loc3_,_loc4_));
            if(_loc5_ > 0.1)
            {
               return false;
            }
            _loc7_++;
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
