package com.company.util
{
   public class _cP_
   {
       
      
      public function _cP_()
      {
         super();
      }
      
      public static function _A_a() : String
      {
         var _loc1_:Date = new Date();
         var _loc2_:Number = _loc1_.getTime();
         _loc2_ = _loc2_ + (_loc1_.timezoneOffset - 420) * 60 * 1000;
         _loc1_.setTime(_loc2_);
         var _loc3_:_C_t = new _C_t();
         _loc3_._1nL_ = "MMMM D, YYYY";
         return _loc3_._kQ_(_loc1_);
      }
   }
}
