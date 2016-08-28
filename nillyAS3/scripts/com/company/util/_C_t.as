package com.company.util
{
   public class _C_t
   {
       
      
      private const _1J_p:Array = ["January","February","March","April","May","June","July","August","September","October","November","December"];
      
      public var _1nL_:String;
      
      public function _C_t()
      {
         super();
      }
      
      public function _kQ_(param1:Date) : String
      {
         var _loc2_:String = this._1nL_;
         _loc2_ = _loc2_.replace("D",param1.date);
         _loc2_ = _loc2_.replace("YYYY",param1.fullYear);
         return _loc2_.replace("MMMM",this._1J_p[param1.month]);
      }
   }
}
