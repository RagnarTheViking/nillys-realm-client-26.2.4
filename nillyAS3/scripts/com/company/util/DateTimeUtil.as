package com.company.util
{
   import flash.globalization.DateTimeFormatter;
   import flash.globalization.LocaleID;
   
   public class DateTimeUtil
   {
       
      
      public function DateTimeUtil()
      {
         super();
      }
      
      public static function formatUTC(param1:Date, param2:String = "yyyy-MM-dd HH:mm:ss") : String
      {
         var _loc3_:DateTimeFormatter = new DateTimeFormatter(LocaleID.DEFAULT);
         _loc3_.setDateTimePattern(param2);
         return _loc3_.formatUTC(param1);
      }
   }
}
