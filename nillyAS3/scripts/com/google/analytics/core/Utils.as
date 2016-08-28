package com.google.analytics.core
{
   public class Utils
   {
       
      
      public function Utils()
      {
         super();
      }
      
      public static function trim(param1:String, param2:Boolean = false) : String
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 == "")
         {
            return "";
         }
         var _loc6_:Array = [" ","\n","\r","\t"];
         var _loc7_:String = param1;
         if(param2)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc6_.length && _loc7_.indexOf(_loc6_[_loc3_]) > -1)
            {
               _loc7_ = _loc7_.split(_loc6_[_loc3_]).join("");
               _loc3_++;
            }
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ < _loc7_.length && _loc6_.indexOf(_loc7_.charAt(_loc4_)) > -1)
            {
               _loc4_++;
            }
            _loc7_ = _loc7_.substr(_loc4_);
            _loc5_ = _loc7_.length - 1;
            while(_loc5_ >= 0 && _loc6_.indexOf(_loc7_.charAt(_loc5_)) > -1)
            {
               _loc5_--;
            }
            _loc7_ = _loc7_.substring(0,_loc5_ + 1);
         }
         return _loc7_;
      }
      
      public static function generateHash(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:* = 0;
         var _loc4_:* = 1;
         if(param1 != null && param1 != "")
         {
            _loc4_ = 0;
            _loc2_ = param1.length - 1;
            while(_loc2_ >= 0)
            {
               _loc3_ = param1.charCodeAt(_loc2_);
               _loc4_ = int((_loc4_ << 6 & 268435455) + _loc3_ + (_loc3_ << 14));
               _loc5_ = _loc4_ & 266338304;
               if(_loc5_ != 0)
               {
                  _loc4_ = _loc4_ ^ _loc5_ >> 21;
               }
               _loc2_--;
            }
         }
         return _loc4_;
      }
      
      public static function generate32bitRandom() : int
      {
         return Math.round(Math.random() * 2147483647);
      }
      
      public static function validateAccount(param1:String) : Boolean
      {
         var _loc2_:RegExp = /^UA-[0-9]*-[0-9]*$/;
         return _loc2_.test(param1);
      }
   }
}
