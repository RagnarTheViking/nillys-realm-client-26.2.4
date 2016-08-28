package com.hurlant.math
{
   use namespace bi_internal;
   
   class _1T_w implements _0C_Q_
   {
       
      
      private var m:com.hurlant.math._ta;
      
      private var _3F_:com.hurlant.math._ta;
      
      private var _1Z_d:com.hurlant.math._ta;
      
      private var _0G_6:com.hurlant.math._ta;
      
      function _1T_w(param1:com.hurlant.math._ta)
      {
         super();
         this._3F_ = new com.hurlant.math._ta();
         this._1Z_d = new com.hurlant.math._ta();
         com.hurlant.math._ta._07D_._Y_z(2 * param1.t,this._3F_);
         this._0G_6 = this._3F_._0yq(param1);
         this.m = param1;
      }
      
      public function _1pk(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         return param1;
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
      
      public function _P_y(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = null;
         if(param1.s < 0 || param1.t > 2 * this.m.t)
         {
            return param1._1Q_V_(this.m);
         }
         if(param1._P_u(this.m) < 0)
         {
            return param1;
         }
         _loc2_ = new com.hurlant.math._ta();
         param1.copyTo(_loc2_);
         this._iX_(_loc2_);
         return _loc2_;
      }
      
      public function _iX_(param1:com.hurlant.math._ta) : void
      {
         var _loc2_:com.hurlant.math._ta = param1 as com.hurlant.math._ta;
         _loc2_._03w(this.m.t - 1,this._3F_);
         if(_loc2_.t > this.m.t + 1)
         {
            _loc2_.t = this.m.t + 1;
            _loc2_.clamp();
         }
         this._0G_6._0hU_(this._3F_,this.m.t + 1,this._1Z_d);
         this.m._1jX_(this._1Z_d,this.m.t + 1,this._3F_);
         while(_loc2_._P_u(this._3F_) < 0)
         {
            _loc2_._0k2(1,this.m.t + 1);
         }
         _loc2_._07m(this._3F_,_loc2_);
         while(_loc2_._P_u(this.m) >= 0)
         {
            _loc2_._07m(this.m,_loc2_);
         }
      }
   }
}
