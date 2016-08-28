package com.company.assembleegameclient.util
{
   import flash.system.Capabilities;
   
   public class GUID
   {
      
      private static var counter:Number = 0;
       
      
      public function GUID()
      {
         super();
      }
      
      public static function create() : String
      {
         var _loc1_:Date = new Date();
         var _loc2_:Number = _loc1_.getTime();
         var _loc3_:Number = Math.random() * Number.MAX_VALUE;
         var _loc4_:String = Capabilities.serverString;
         return _1T_s(_loc2_ + _loc4_ + _loc3_ + counter++).toUpperCase();
      }
      
      private static function _1T_s(param1:String) : String
      {
         return _1A_U_(param1);
      }
      
      private static function _1A_U_(param1:String) : String
      {
         return _0D_Y_(_vN_(_10l(param1),param1.length * 8));
      }
      
      private static function _vN_(param1:Array, param2:Number) : Array
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         param1[param2 >> 5] = param1[param2 >> 5] | 128 << 24 - param2 % 32;
         param1[(param2 + 64 >> 9 << 4) + 15] = param2;
         var _loc10_:Array = new Array(80);
         var _loc11_:Number = 1732584193;
         var _loc12_:Number = -271733879;
         var _loc13_:Number = -1732584194;
         var _loc14_:Number = 271733878;
         var _loc15_:Number = -1009589776;
         var _loc16_:Number = 0;
         while(_loc16_ < param1.length)
         {
            _loc3_ = _loc11_;
            _loc4_ = _loc12_;
            _loc5_ = _loc13_;
            _loc6_ = _loc14_;
            _loc7_ = _loc15_;
            _loc8_ = 0;
            while(_loc8_ < 80)
            {
               if(_loc8_ < 16)
               {
                  _loc10_[_loc8_] = param1[_loc16_ + _loc8_];
               }
               else
               {
                  _loc10_[_loc8_] = rol(_loc10_[_loc8_ - 3] ^ _loc10_[_loc8_ - 8] ^ _loc10_[_loc8_ - 14] ^ _loc10_[_loc8_ - 16],1);
               }
               _loc9_ = _0mU_(_0mU_(rol(_loc11_,5),sha1_ft(_loc8_,_loc12_,_loc13_,_loc14_)),_0mU_(_0mU_(_loc15_,_loc10_[_loc8_]),sha1_kt(_loc8_)));
               _loc15_ = _loc14_;
               _loc14_ = _loc13_;
               _loc13_ = rol(_loc12_,30);
               _loc12_ = _loc11_;
               _loc11_ = _loc9_;
               _loc8_++;
            }
            _loc11_ = _0mU_(_loc11_,_loc3_);
            _loc12_ = _0mU_(_loc12_,_loc4_);
            _loc13_ = _0mU_(_loc13_,_loc5_);
            _loc14_ = _0mU_(_loc14_,_loc6_);
            _loc15_ = _0mU_(_loc15_,_loc7_);
            _loc16_ = _loc16_ + 16;
         }
         return new Array(_loc11_,_loc12_,_loc13_,_loc14_,_loc15_);
      }
      
      private static function sha1_ft(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         if(param1 < 20)
         {
            return param2 & param3 | ~param2 & param4;
         }
         if(param1 < 40)
         {
            return param2 ^ param3 ^ param4;
         }
         if(param1 < 60)
         {
            return param2 & param3 | param2 & param4 | param3 & param4;
         }
         return param2 ^ param3 ^ param4;
      }
      
      private static function sha1_kt(param1:Number) : Number
      {
         return param1 < 20?Number(1518500249):param1 < 40?Number(1859775393):param1 < 60?Number(-1894007588):Number(-899497514);
      }
      
      private static function _0mU_(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = (param1 & 65535) + (param2 & 65535);
         var _loc4_:Number = (param1 >> 16) + (param2 >> 16) + (_loc3_ >> 16);
         return _loc4_ << 16 | _loc3_ & 65535;
      }
      
      private static function rol(param1:Number, param2:Number) : Number
      {
         return param1 << param2 | param1 >>> 32 - param2;
      }
      
      private static function _10l(param1:String) : Array
      {
         var _loc2_:Array = new Array();
         var _loc3_:Number = 1 << 8 - 1;
         var _loc4_:Number = 0;
         while(_loc4_ < param1.length * 8)
         {
            _loc2_[_loc4_ >> 5] = _loc2_[_loc4_ >> 5] | (param1.charCodeAt(_loc4_ / 8) & _loc3_) << 24 - _loc4_ % 32;
            _loc4_ = _loc4_ + 8;
         }
         return _loc2_;
      }
      
      private static function _0D_Y_(param1:Array) : String
      {
         var _loc2_:String = new String("");
         var _loc3_:String = new String("0123456789abcdef");
         var _loc4_:Number = 0;
         while(_loc4_ < param1.length * 4)
         {
            _loc2_ = _loc2_ + (_loc3_.charAt(param1[_loc4_ >> 2] >> (3 - _loc4_ % 4) * 8 + 4 & 15) + _loc3_.charAt(param1[_loc4_ >> 2] >> (3 - _loc4_ % 4) * 8 & 15));
            _loc4_++;
         }
         return _loc2_;
      }
   }
}
