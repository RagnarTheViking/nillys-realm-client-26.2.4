package com.hurlant.math
{
   use namespace bi_internal;
   
   class _F_A_ implements _0C_Q_
   {
       
      
      private var m:com.hurlant.math._ta;
      
      private var _fF_:int;
      
      private var _0T_J_:int;
      
      private var _O_N_:int;
      
      private var _11R_:int;
      
      private var _1fh:int;
      
      function _F_A_(param1:com.hurlant.math._ta)
      {
         super();
         this.m = param1;
         this._fF_ = param1._06R_();
         this._0T_J_ = this._fF_ & 32767;
         this._O_N_ = this._fF_ >> 15;
         this._11R_ = 1 << com.hurlant.math._ta._hw - 15 - 1;
         this._1fh = 2 * param1.t;
      }
      
      public function _P_y(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = new com.hurlant.math._ta();
         param1.abs()._Y_z(this.m.t,_loc2_);
         _loc2_._0cZ_(this.m,null,_loc2_);
         if(param1.s < 0 && _loc2_._P_u(com.hurlant.math._ta._1K_K_) > 0)
         {
            this.m._07m(_loc2_,_loc2_);
         }
         return _loc2_;
      }
      
      public function _1pk(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = new com.hurlant.math._ta();
         param1.copyTo(_loc2_);
         this._iX_(_loc2_);
         return _loc2_;
      }
      
      public function _iX_(param1:com.hurlant.math._ta) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         while(param1.t <= this._1fh)
         {
            _loc5_ = param1.t++;
            param1.a[_loc5_] = 0;
         }
         while(_loc4_ < this.m.t)
         {
            _loc2_ = param1.a[_loc4_] & 32767;
            _loc3_ = _loc2_ * this._0T_J_ + ((_loc2_ * this._O_N_ + (param1.a[_loc4_] >> 15) * this._0T_J_ & this._11R_) << 15) & com.hurlant.math._ta._F_x;
            _loc2_ = int(_loc4_ + this.m.t);
            param1.a[_loc2_] = param1.a[_loc2_] + this.m.am(0,_loc3_,param1,_loc4_,0,this.m.t);
            while(param1.a[_loc2_] >= com.hurlant.math._ta._10L_)
            {
               param1.a[_loc2_] = param1.a[_loc2_] - com.hurlant.math._ta._10L_;
               _loc5_ = param1.a;
               _loc6_ = ++_loc2_;
               _loc7_ = _loc5_[_loc6_] + 1;
               _loc5_[_loc6_] = _loc7_;
            }
            _loc4_++;
         }
         param1.clamp();
         param1._03w(this.m.t,param1);
         if(param1._P_u(this.m) >= 0)
         {
            param1._07m(this.m,param1);
         }
      }
      
      public function _U_6(param1:com.hurlant.math._ta, param2:com.hurlant.math._ta) : void
      {
         param1._Z_e(param2);
         this._iX_(param2);
      }
      
      public function _1R_X_(param1:com.hurlant.math._ta, param2:com.hurlant.math._ta, param3:com.hurlant.math._ta) : void
      {
         param1._A_J_(param2,param3);
         this._iX_(param3);
      }
   }
}
