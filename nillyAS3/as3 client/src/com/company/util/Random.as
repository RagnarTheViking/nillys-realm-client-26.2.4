package com.company.util
{
   public class Random
   {
       
      
      public var seed:uint;
      
      public function Random(param1:uint = 1)
      {
         super();
         this.seed = param1;
      }
      
      public static function _0A_8() : uint
      {
         return Math.round(Math.random() * (uint.MAX_VALUE - 1) + 1);
      }
      
      public function _R_h() : uint
      {
         return this._8I_();
      }
      
      public function _0n6() : Number
      {
         return this._8I_() / 2147483647;
      }
      
      public function _04R_(param1:Number = 0, param2:Number = 1) : Number
      {
         var _loc3_:Number = this._8I_() / 2147483647;
         var _loc4_:Number = this._8I_() / 2147483647;
         var _loc5_:Number = Math.sqrt(-2 * Math.log(_loc3_)) * Math.cos(2 * _loc4_ * Math.PI);
         return param1 + _loc5_ * param2;
      }
      
      public function _E_E_(param1:uint, param2:uint) : uint
      {
         return param1 == param2?uint(param1):uint(param1 + this._8I_() % (param2 - param1));
      }
      
      public function _0p3(param1:Number, param2:Number) : Number
      {
         return param1 + (param2 - param1) * this._0n6();
      }
      
      private function _8I_() : uint
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         _loc2_ = 16807 * (this.seed & 65535);
         _loc1_ = 16807 * (this.seed >> 16);
         _loc2_ = _loc2_ + ((_loc1_ & 32767) << 16);
         _loc2_ = _loc2_ + (_loc1_ >> 15);
         if(_loc2_ > 2147483647)
         {
            _loc2_ = _loc2_ - 2147483647;
         }
         return this.seed = _loc2_;
      }
   }
}
