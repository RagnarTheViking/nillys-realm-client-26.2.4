package com.company.assembleegameclient.util
{
   public class TimeConversions
   {
      
      public static const _S_w:int = 86400000;
      
      public static const DAY_IN_SECONDS:int = 86400;
      
      public static const HOUR_IN_SECONDS:int = 3600;
      
      public static const MINUTE_IN_SECONDS:int = 60;
       
      
      public function TimeConversions()
      {
         super();
      }
      
      public static function secondsToDays(param1:Number) : Number
      {
         return param1 / DAY_IN_SECONDS;
      }
      
      public static function secondsToHours(param1:Number) : Number
      {
         return param1 / HOUR_IN_SECONDS;
      }
      
      public static function secondsToMin(param1:Number) : Number
      {
         return param1 / MINUTE_IN_SECONDS;
      }
      
      public static function dateStringToDate(param1:String) : Date
      {
         var _loc2_:Array = param1.match(/(\d\d\d\d)-(\d\d)-(\d\d) (\d\d):(\d\d):(\d\d)/);
         var _loc3_:Date = new Date();
         _loc3_.setUTCFullYear(int(_loc2_[1]),int(_loc2_[2]) - 1,int(_loc2_[3]));
         _loc3_.setUTCHours(int(_loc2_[4]),int(_loc2_[5]),int(_loc2_[6]),0);
         return _loc3_;
      }
   }
}
