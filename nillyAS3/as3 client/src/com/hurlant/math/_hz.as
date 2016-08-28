package com.hurlant.math
{
   use namespace bi_internal;
   
   class _hz implements _0C_Q_
   {
       
      
      private var m:com.hurlant.math._ta;
      
      function _hz(param1:com.hurlant.math._ta)
      {
         super();
         this.m = param1;
      }
      
      public function _P_y(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         if(param1.s < 0 || param1._P_u(this.m) >= 0)
         {
            return param1._1Q_V_(this.m);
         }
         return param1;
      }
      
      public function _1pk(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         return param1;
      }
      
      public function _iX_(param1:com.hurlant.math._ta) : void
      {
         param1._0cZ_(this.m,null,param1);
      }
      
      public function _1R_X_(param1:com.hurlant.math._ta, param2:com.hurlant.math._ta, param3:com.hurlant.math._ta) : void
      {
         param1._A_J_(param2,param3);
         this._iX_(param3);
      }
      
      public function _U_6(param1:com.hurlant.math._ta, param2:com.hurlant.math._ta) : void
      {
         param1._Z_e(param2);
         this._iX_(param2);
      }
   }
}
