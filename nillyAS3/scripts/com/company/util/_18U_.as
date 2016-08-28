package com.company.util
{
   import flash.utils.ByteArray;
   
   public class _18U_
   {
       
      
      public function _18U_()
      {
         super();
      }
      
      public static function _09U_(param1:String) : ByteArray
      {
         var _loc3_:int = 0;
         var _loc2_:ByteArray = new ByteArray();
         while(_loc3_ < param1.length)
         {
            _loc2_.writeByte(parseInt(param1.substr(_loc3_,2),16));
            _loc3_ = _loc3_ + 2;
         }
         return _loc2_;
      }
      
      public static function _O_(param1:String, param2:String) : Number
      {
         return param1.localeCompare(param2);
      }
   }
}
