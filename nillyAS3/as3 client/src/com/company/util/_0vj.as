package com.company.util
{
   public class _0vj
   {
      
      public static const _1L_3:RegExp = /^[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}$/i;
       
      
      public function _0vj()
      {
         super();
      }
      
      public static function _1mE_(param1:String) : Boolean
      {
         return Boolean(param1.match(_1L_3));
      }
   }
}
