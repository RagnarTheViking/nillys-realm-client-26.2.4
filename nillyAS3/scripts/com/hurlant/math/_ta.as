package com.hurlant.math
{
   import com.hurlant.crypto.prng.Random;
   import com.hurlant.util.Memory;
   import flash.utils.ByteArray;
   import com.hurlant.util.Hex;
   
   use namespace bi_internal;
   
   public class _ta
   {
      
      public static const _hw:int = 30;
      
      public static const _10L_:int = 1 << _hw;
      
      public static const _F_x:int = _10L_ - 1;
      
      public static const _kV_:int = 52;
      
      public static const _17W_:Number = Math.pow(2,_kV_);
      
      public static const F1:int = _kV_ - _hw;
      
      public static const F2:int = 2 * _hw - _kV_;
      
      public static const _1K_K_:com.hurlant.math._ta = _019(0);
      
      public static const _07D_:com.hurlant.math._ta = _019(1);
      
      public static const _14d:Array = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101,103,107,109,113,127,131,137,139,149,151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,233,239,241,251,257,263,269,271,277,281,283,293,307,311,313,317,331,337,347,349,353,359,367,373,379,383,389,397,401,409,419,421,431,433,439,443,449,457,461,463,467,479,487,491,499,503,509];
      
      public static const _04H_:int = (1 << 26) / _14d[_14d.length - 1];
       
      
      public var t:int;
      
      bi_internal var s:int;
      
      bi_internal var a:Array;
      
      public function _ta(param1:* = null, param2:int = 0, param3:Boolean = false)
      {
         var _loc4_:ByteArray = null;
         var _loc5_:int = 0;
         super();
         this.a = new Array();
         if(param1 is String)
         {
            if(param2 && param2 != 16)
            {
               throw new Error("BigInteger construction with radix!=16 is not supported.");
            }
            param1 = Hex.toArray(param1);
            param2 = 0;
         }
         if(param1 is ByteArray)
         {
            _loc4_ = param1 as ByteArray;
            _loc5_ = int(param2) || int(_loc4_.length - _loc4_.position);
            this.fromArray(_loc4_,_loc5_,param3);
         }
      }
      
      public static function _019(param1:int) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = new com.hurlant.math._ta();
         _loc2_._lB_(param1);
         return _loc2_;
      }
      
      public function dispose() : void
      {
         var _loc2_:uint = 0;
         var _loc1_:Random = new Random();
         while(_loc2_ < this.a.length)
         {
            this.a[_loc2_] = _loc1_.nextByte();
            delete this.a[_loc2_];
            _loc2_++;
         }
         this.a = null;
         this.t = 0;
         this.s = 0;
         Memory.gc();
      }
      
      public function toString(param1:Number = 16) : String
      {
         var _loc2_:int = 0;
         var _loc4_:* = 0;
         var _loc5_:Boolean = false;
         var _loc9_:* = undefined;
         if(this.s < 0)
         {
            return "-" + this._yU_().toString(param1);
         }
         switch(param1)
         {
            case 2:
               _loc2_ = 1;
               break;
            case 4:
               _loc2_ = 2;
               break;
            case 8:
               _loc2_ = 3;
               break;
            case 16:
               _loc2_ = 4;
               break;
            case 32:
               _loc2_ = 5;
         }
         var _loc3_:int = 1 << _loc2_ - 1;
         var _loc6_:* = "";
         var _loc7_:int = this.t;
         var _loc8_:int = _hw - _loc7_ * _hw % _loc2_;
         if(_loc7_-- > 0)
         {
            if(_loc8_ < _hw && (_loc4_ = int(this.a[_loc7_] >> _loc8_)) > 0)
            {
               _loc5_ = true;
               _loc6_ = _loc4_.toString(36);
            }
            while(_loc7_ >= 0)
            {
               if(_loc8_ < _loc2_)
               {
                  _loc4_ = (this.a[_loc7_] & 1 << _loc8_ - 1) << _loc2_ - _loc8_;
                  _loc9_ = _loc4_;
                  _loc8_ = _loc8_ + (_hw - _loc2_);
                  _loc4_ = _loc9_ | this.a[--_loc7_] >> _loc8_;
               }
               else
               {
                  _loc8_ = _loc8_ - _loc2_;
                  _loc4_ = this.a[_loc7_] >> _loc8_ & _loc3_;
                  if(_loc8_ <= 0)
                  {
                     _loc8_ = _loc8_ + _hw;
                     _loc7_--;
                  }
               }
               if(_loc4_ > 0)
               {
                  _loc5_ = true;
               }
               if(_loc5_)
               {
                  _loc6_ = _loc6_ + _loc4_.toString(36);
               }
            }
         }
         return !!_loc5_?_loc6_:"0";
      }
      
      public function toArray(param1:ByteArray) : uint
      {
         var _loc4_:* = 0;
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         var _loc9_:* = undefined;
         var _loc2_:int = 8;
         var _loc3_:int = 1 << 8 - 1;
         var _loc5_:int = this.t;
         var _loc6_:int = _hw - _loc5_ * _hw % _loc2_;
         if(_loc5_-- > 0)
         {
            if(_loc6_ < _hw && (_loc4_ = int(this.a[_loc5_] >> _loc6_)) > 0)
            {
               _loc7_ = true;
               param1.writeByte(_loc4_);
               _loc8_++;
            }
            while(_loc5_ >= 0)
            {
               if(_loc6_ < _loc2_)
               {
                  _loc4_ = (this.a[_loc5_] & 1 << _loc6_ - 1) << _loc2_ - _loc6_;
                  _loc9_ = _loc4_;
                  _loc6_ = _loc6_ + (_hw - _loc2_);
                  _loc4_ = _loc9_ | this.a[--_loc5_] >> _loc6_;
               }
               else
               {
                  _loc6_ = _loc6_ - _loc2_;
                  _loc4_ = this.a[_loc5_] >> _loc6_ & _loc3_;
                  if(_loc6_ <= 0)
                  {
                     _loc6_ = _loc6_ + _hw;
                     _loc5_--;
                  }
               }
               if(_loc4_ > 0)
               {
                  _loc7_ = true;
               }
               if(_loc7_)
               {
                  param1.writeByte(_loc4_);
                  _loc8_++;
               }
            }
         }
         return _loc8_;
      }
      
      public function valueOf() : Number
      {
         var _loc3_:uint = 0;
         if(this.s == -1)
         {
            return -this._yU_().valueOf();
         }
         var _loc1_:Number = 1;
         var _loc2_:Number = 0;
         while(_loc3_ < this.t)
         {
            _loc2_ = _loc2_ + this.a[_loc3_] * _loc1_;
            _loc1_ = _loc1_ * _10L_;
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function _yU_() : com.hurlant.math._ta
      {
         var _loc1_:com.hurlant.math._ta = this._19S_();
         _1K_K_._07m(this,_loc1_);
         return _loc1_;
      }
      
      public function abs() : com.hurlant.math._ta
      {
         return this.s < 0?this._yU_():this;
      }
      
      public function _P_u(param1:com.hurlant.math._ta) : int
      {
         var _loc2_:int = this.s - param1.s;
         if(_loc2_ != 0)
         {
            return _loc2_;
         }
         var _loc3_:int = this.t;
         _loc2_ = _loc3_ - param1.t;
         if(_loc2_ != 0)
         {
            return _loc2_;
         }
         while(--_loc3_ >= 0)
         {
            _loc2_ = this.a[_loc3_] - param1.a[_loc3_];
            if(_loc2_ != 0)
            {
               return _loc2_;
            }
         }
         return 0;
      }
      
      bi_internal function _0R_m(param1:int) : int
      {
         var _loc2_:* = 0;
         var _loc3_:int = 1;
         _loc2_ = int(param1 >>> 16);
         if(_loc2_ != 0)
         {
            param1 = _loc2_;
            _loc3_ = _loc3_ + 16;
         }
         _loc2_ = param1 >> 8;
         if(_loc2_ != 0)
         {
            param1 = _loc2_;
            _loc3_ = _loc3_ + 8;
         }
         _loc2_ = param1 >> 4;
         if(_loc2_ != 0)
         {
            param1 = _loc2_;
            _loc3_ = _loc3_ + 4;
         }
         _loc2_ = param1 >> 2;
         if(_loc2_ != 0)
         {
            param1 = _loc2_;
            _loc3_ = _loc3_ + 2;
         }
         _loc2_ = param1 >> 1;
         if(_loc2_ != 0)
         {
            param1 = _loc2_;
            _loc3_ = _loc3_ + 1;
         }
         return _loc3_;
      }
      
      public function _01y() : int
      {
         if(this.t <= 0)
         {
            return 0;
         }
         return _hw * (this.t - 1) + this._0R_m(this.a[this.t - 1] ^ this.s & _F_x);
      }
      
      public function _1Q_V_(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = this._19S_();
         this.abs()._0cZ_(param1,null,_loc2_);
         if(this.s < 0 && _loc2_._P_u(_1K_K_) > 0)
         {
            param1._07m(_loc2_,_loc2_);
         }
         return _loc2_;
      }
      
      public function _03g(param1:int, param2:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc3_:_0C_Q_ = null;
         if(param1 < 256 || param2._G_u())
         {
            _loc3_ = new _hz(param2);
         }
         else
         {
            _loc3_ = new _F_A_(param2);
         }
         return this.exp(param1,_loc3_);
      }
      
      bi_internal function copyTo(param1:com.hurlant.math._ta) : void
      {
         var _loc2_:int = this.t - 1;
         while(_loc2_ >= 0)
         {
            param1.a[_loc2_] = this.a[_loc2_];
            _loc2_--;
         }
         param1.t = this.t;
         param1.s = this.s;
      }
      
      bi_internal function _lB_(param1:int) : void
      {
         this.t = 1;
         this.s = param1 < 0?-1:0;
         if(param1 > 0)
         {
            this.a[0] = param1;
         }
         else if(param1 < -1)
         {
            this.a[0] = param1 + _10L_;
         }
         else
         {
            this.t = 0;
         }
      }
      
      bi_internal function fromArray(param1:ByteArray, param2:int, param3:Boolean = false) : void
      {
         var _loc4_:int = 0;
         var _loc7_:int = 0;
         var _loc9_:* = undefined;
         var _loc5_:int = param1.position;
         var _loc6_:int = _loc5_ + param2;
         var _loc8_:int = 8;
         this.t = 0;
         this.s = 0;
         while(--_loc6_ >= _loc5_)
         {
            _loc4_ = _loc6_ < param1.length?int(param1[_loc6_]):0;
            if(_loc7_ == 0)
            {
               _loc9_ = this.t++;
               this.a[_loc9_] = _loc4_;
            }
            else if(_loc7_ + _loc8_ > _hw)
            {
               this.a[this.t - 1] = this.a[this.t - 1] | (_loc4_ & 1 << _hw - _loc7_ - 1) << _loc7_;
               _loc9_ = this.t++;
               this.a[_loc9_] = _loc4_ >> _hw - _loc7_;
            }
            else
            {
               this.a[this.t - 1] = this.a[this.t - 1] | _loc4_ << _loc7_;
            }
            _loc7_ = _loc7_ + _loc8_;
            if(_loc7_ >= _hw)
            {
               _loc7_ = _loc7_ - _hw;
            }
         }
         if(!param3 && (param1[0] & 128) == 128)
         {
            this.s = -1;
            if(_loc7_ > 0)
            {
               this.a[this.t - 1] = this.a[this.t - 1] | 1 << _hw - _loc7_ - 1 << _loc7_;
            }
         }
         this.clamp();
         param1.position = Math.min(_loc5_ + param2,param1.length);
      }
      
      bi_internal function clamp() : void
      {
         var _loc1_:* = this.s & _F_x;
         while(this.t > 0 && this.a[this.t - 1] == _loc1_)
         {
            this.t--;
         }
      }
      
      bi_internal function _Y_z(param1:int, param2:com.hurlant.math._ta) : void
      {
         var _loc3_:int = 0;
         _loc3_ = this.t - 1;
         while(_loc3_ >= 0)
         {
            param2.a[_loc3_ + param1] = this.a[_loc3_];
            _loc3_--;
         }
         _loc3_ = param1 - 1;
         while(_loc3_ >= 0)
         {
            param2.a[_loc3_] = 0;
            _loc3_--;
         }
         param2.t = this.t + param1;
         param2.s = this.s;
      }
      
      bi_internal function _03w(param1:int, param2:com.hurlant.math._ta) : void
      {
         var _loc3_:int = 0;
         _loc3_ = param1;
         while(_loc3_ < this.t)
         {
            param2.a[_loc3_ - param1] = this.a[_loc3_];
            _loc3_++;
         }
         param2.t = Math.max(this.t - param1,0);
         param2.s = this.s;
      }
      
      bi_internal function _Q_z(param1:int, param2:com.hurlant.math._ta) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = param1 % _hw;
         var _loc5_:int = _hw - _loc4_;
         var _loc6_:int = 1 << _loc5_ - 1;
         var _loc7_:int = param1 / _hw;
         var _loc8_:* = this.s << _loc4_ & _F_x;
         _loc3_ = this.t - 1;
         while(_loc3_ >= 0)
         {
            param2.a[_loc3_ + _loc7_ + 1] = this.a[_loc3_] >> _loc5_ | _loc8_;
            _loc8_ = (this.a[_loc3_] & _loc6_) << _loc4_;
            _loc3_--;
         }
         _loc3_ = _loc7_ - 1;
         while(_loc3_ >= 0)
         {
            param2.a[_loc3_] = 0;
            _loc3_--;
         }
         param2.a[_loc7_] = _loc8_;
         param2.t = this.t + _loc7_ + 1;
         param2.s = this.s;
         param2.clamp();
      }
      
      bi_internal function _0G_G_(param1:int, param2:com.hurlant.math._ta) : void
      {
         var _loc3_:int = 0;
         param2.s = this.s;
         var _loc4_:int = param1 / _hw;
         if(_loc4_ >= this.t)
         {
            param2.t = 0;
            return;
         }
         var _loc5_:int = param1 % _hw;
         var _loc6_:int = _hw - _loc5_;
         var _loc7_:int = 1 << _loc5_ - 1;
         param2.a[0] = this.a[_loc4_] >> _loc5_;
         _loc3_ = _loc4_ + 1;
         while(_loc3_ < this.t)
         {
            param2.a[_loc3_ - _loc4_ - 1] = param2.a[_loc3_ - _loc4_ - 1] | (this.a[_loc3_] & _loc7_) << _loc6_;
            param2.a[_loc3_ - _loc4_] = this.a[_loc3_] >> _loc5_;
            _loc3_++;
         }
         if(_loc5_ > 0)
         {
            param2.a[this.t - _loc4_ - 1] = param2.a[this.t - _loc4_ - 1] | (this.s & _loc7_) << _loc6_;
         }
         param2.t = this.t - _loc4_;
         param2.clamp();
      }
      
      bi_internal function _07m(param1:com.hurlant.math._ta, param2:com.hurlant.math._ta) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc6_:* = undefined;
         var _loc5_:int = Math.min(param1.t,this.t);
         while(_loc3_ < _loc5_)
         {
            _loc4_ = int(_loc4_ + (this.a[_loc3_] - param1.a[_loc3_]));
            _loc6_ = _loc3_++;
            param2.a[_loc6_] = _loc4_ & _F_x;
            _loc4_ = _loc4_ >> _hw;
         }
         if(param1.t < this.t)
         {
            _loc4_ = int(_loc4_ - param1.s);
            while(_loc3_ < this.t)
            {
               _loc4_ = int(_loc4_ + this.a[_loc3_]);
               _loc6_ = _loc3_++;
               param2.a[_loc6_] = _loc4_ & _F_x;
               _loc4_ = _loc4_ >> _hw;
            }
            _loc4_ = int(_loc4_ + this.s);
         }
         else
         {
            _loc4_ = int(_loc4_ + this.s);
            while(_loc3_ < param1.t)
            {
               _loc4_ = int(_loc4_ - param1.a[_loc3_]);
               _loc6_ = _loc3_++;
               param2.a[_loc6_] = _loc4_ & _F_x;
               _loc4_ = _loc4_ >> _hw;
            }
            _loc4_ = int(_loc4_ - param1.s);
         }
         param2.s = _loc4_ < 0?-1:0;
         if(_loc4_ < -1)
         {
            _loc6_ = _loc3_++;
            param2.a[_loc6_] = _10L_ + _loc4_;
         }
         else if(_loc4_ > 0)
         {
            _loc6_ = _loc3_++;
            param2.a[_loc6_] = _loc4_;
         }
         param2.t = _loc3_;
         param2.clamp();
      }
      
      bi_internal function am(param1:int, param2:int, param3:com.hurlant.math._ta, param4:int, param5:int, param6:int) : int
      {
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:int = 0;
         var _loc12_:* = undefined;
         var _loc10_:* = param2 & 32767;
         var _loc11_:* = param2 >> 15;
         while(--param6 >= 0)
         {
            _loc7_ = this.a[param1] & 32767;
            _loc8_ = this.a[param1++] >> 15;
            _loc9_ = _loc11_ * _loc7_ + _loc8_ * _loc10_;
            _loc7_ = int(_loc10_ * _loc7_ + ((_loc9_ & 32767) << 15) + param3.a[param4] + (param5 & 1073741823));
            param5 = (_loc7_ >>> 30) + (_loc9_ >>> 15) + _loc11_ * _loc8_ + (param5 >>> 30);
            _loc12_ = param4++;
            param3.a[_loc12_] = _loc7_ & 1073741823;
         }
         return param5;
      }
      
      bi_internal function _A_J_(param1:com.hurlant.math._ta, param2:com.hurlant.math._ta) : void
      {
         var _loc3_:com.hurlant.math._ta = this.abs();
         var _loc4_:com.hurlant.math._ta = param1.abs();
         var _loc5_:int = _loc3_.t;
         param2.t = _loc5_ + _loc4_.t;
         while(--_loc5_ >= 0)
         {
            param2.a[_loc5_] = 0;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_.t)
         {
            param2.a[_loc5_ + _loc3_.t] = _loc3_.am(0,_loc4_.a[_loc5_],param2,_loc5_,0,_loc3_.t);
            _loc5_++;
         }
         param2.s = 0;
         param2.clamp();
         if(this.s != param1.s)
         {
            _1K_K_._07m(param2,param2);
         }
      }
      
      bi_internal function _Z_e(param1:com.hurlant.math._ta) : void
      {
         var _loc2_:int = 0;
         var _loc3_:com.hurlant.math._ta = this.abs();
         var _loc4_:int = param1.t = 2 * _loc3_.t;
         while(--_loc4_ >= 0)
         {
            param1.a[_loc4_] = 0;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_.t - 1)
         {
            _loc2_ = _loc3_.am(_loc4_,_loc3_.a[_loc4_],param1,2 * _loc4_,0,1);
            if((param1.a[_loc4_ + _loc3_.t] = param1.a[_loc4_ + _loc3_.t] + _loc3_.am(_loc4_ + 1,2 * _loc3_.a[_loc4_],param1,2 * _loc4_ + 1,_loc2_,_loc3_.t - _loc4_ - 1)) >= _10L_)
            {
               param1.a[_loc4_ + _loc3_.t] = param1.a[_loc4_ + _loc3_.t] - _10L_;
               param1.a[_loc4_ + _loc3_.t + 1] = 1;
            }
            _loc4_++;
         }
         if(param1.t > 0)
         {
            param1.a[param1.t - 1] = param1.a[param1.t - 1] + _loc3_.am(_loc4_,_loc3_.a[_loc4_],param1,2 * _loc4_,0,1);
         }
         param1.s = 0;
         param1.clamp();
      }
      
      bi_internal function _0cZ_(param1:com.hurlant.math._ta, param2:com.hurlant.math._ta = null, param3:com.hurlant.math._ta = null) : void
      {
         var qd:int = 0;
         var _local5:* = undefined;
         var m:com.hurlant.math._ta = param1;
         var q:com.hurlant.math._ta = param2;
         var r:com.hurlant.math._ta = param3;
         var pm:com.hurlant.math._ta = m.abs();
         if(pm.t <= 0)
         {
            return;
         }
         var pt:com.hurlant.math._ta = this.abs();
         if(pt.t < pm.t)
         {
            if(q != null)
            {
               q._lB_(0);
            }
            if(r != null)
            {
               this.copyTo(r);
            }
            return;
         }
         if(r == null)
         {
            r = this._19S_();
         }
         var y:com.hurlant.math._ta = this._19S_();
         var ts:int = this.s;
         var ms:int = m.s;
         var nsh:int = _hw - this._0R_m(pm.a[pm.t - 1]);
         if(nsh > 0)
         {
            pm._Q_z(nsh,y);
            pt._Q_z(nsh,r);
         }
         else
         {
            pm.copyTo(y);
            pt.copyTo(r);
         }
         var ys:int = y.t;
         var y0:int = y.a[ys - 1];
         if(y0 == 0)
         {
            return;
         }
         var yt:Number = y0 * (1 << F1) + (ys > 1?y.a[ys - 2] >> F2:0);
         var d1:Number = _17W_ / yt;
         var d2:Number = (1 << F1) / yt;
         var e:Number = 1 << F2;
         var i:int = r.t;
         var j:int = i - ys;
         var t:com.hurlant.math._ta = q == null?this._19S_():q;
         y._Y_z(j,t);
         if(r._P_u(t) >= 0)
         {
            _local5 = r.t++;
            r.a[_local5] = 1;
            r._07m(t,r);
         }
         _07D_._Y_z(ys,t);
         t._07m(y,y);
         while(y.t < ys)
         {
            while(§§hasnext(y,_loc6_))
            {
               with(_loc9_)
               {
                  
                  y.t++;
                  if(0)
                  {
                     _loc5_[_loc6_] = _loc8_;
                  }
               }
            }
         }
         while(--j >= 0)
         {
            qd = r.a[--i] == y0?int(_F_x):int(Number(r.a[i]) * d1 + (Number(r.a[i - 1]) + e) * d2);
            if((r.a[i] = r.a[i] + y.am(0,qd,r,j,0,ys)) < qd)
            {
               y._Y_z(j,t);
               r._07m(t,r);
               while(r.a[i] < qd)
               {
                  r._07m(t,r);
               }
               continue;
            }
         }
         if(q != null)
         {
            r._03w(ys,q);
            if(ts != ms)
            {
               _1K_K_._07m(q,q);
            }
         }
         r.t = ys;
         r.clamp();
         if(nsh > 0)
         {
            r._0G_G_(nsh,r);
         }
         if(ts < 0)
         {
            _1K_K_._07m(r,r);
         }
      }
      
      bi_internal function _06R_() : int
      {
         if(this.t < 1)
         {
            return 0;
         }
         var _loc1_:int = this.a[0];
         if((_loc1_ & 1) == 0)
         {
            return 0;
         }
         var _loc2_:* = _loc1_ & 3;
         _loc2_ = _loc2_ * (2 - (_loc1_ & 15) * _loc2_) & 15;
         _loc2_ = _loc2_ * (2 - (_loc1_ & 255) * _loc2_) & 255;
         _loc2_ = _loc2_ * (2 - ((_loc1_ & 65535) * _loc2_ & 65535)) & 65535;
         _loc2_ = _loc2_ * (2 - _loc1_ * _loc2_ % _10L_) % _10L_;
         return _loc2_ > 0?int(_10L_ - _loc2_):int(-_loc2_);
      }
      
      bi_internal function _G_u() : Boolean
      {
         return (this.t > 0?this.a[0] & 1:this.s) == 0;
      }
      
      bi_internal function exp(param1:int, param2:_0C_Q_) : com.hurlant.math._ta
      {
         var _loc3_:com.hurlant.math._ta = null;
         if(param1 > 4294967295 || param1 < 1)
         {
            return _07D_;
         }
         var _loc4_:com.hurlant.math._ta = this._19S_();
         var _loc5_:com.hurlant.math._ta = this._19S_();
         var _loc6_:com.hurlant.math._ta = param2._P_y(this);
         var _loc7_:int = this._0R_m(param1) - 1;
         _loc6_.copyTo(_loc4_);
         while(--_loc7_ >= 0)
         {
            param2._U_6(_loc4_,_loc5_);
            if((param1 & 1 << _loc7_) > 0)
            {
               param2._1R_X_(_loc5_,_loc6_,_loc4_);
            }
            else
            {
               _loc3_ = _loc4_;
               _loc4_ = _loc5_;
               _loc5_ = _loc3_;
            }
         }
         return param2._1pk(_loc4_);
      }
      
      bi_internal function _gl(param1:String, param2:int) : int
      {
         return parseInt(param1.charAt(param2),36);
      }
      
      protected function _19S_() : *
      {
         return new com.hurlant.math._ta();
      }
      
      public function clone() : com.hurlant.math._ta
      {
         var _loc1_:com.hurlant.math._ta = new com.hurlant.math._ta();
         this.copyTo(_loc1_);
         return _loc1_;
      }
      
      public function _1R_h() : int
      {
         if(this.s < 0)
         {
            if(this.t == 1)
            {
               return this.a[0] - _10L_;
            }
            if(this.t == 0)
            {
               return -1;
            }
         }
         else
         {
            if(this.t == 1)
            {
               return this.a[0];
            }
            if(this.t == 0)
            {
               return 0;
            }
         }
         return (this.a[1] & 1 << 32 - _hw - 1) << _hw | this.a[0];
      }
      
      public function _O_2() : int
      {
         return this.t == 0?int(this.s):this.a[0] << 24 >> 24;
      }
      
      public function _M_Z_() : int
      {
         return this.t == 0?int(this.s):this.a[0] << 16 >> 16;
      }
      
      protected function _1B_s(param1:Number) : int
      {
         return Math.floor(Math.LN2 * _hw / Math.log(param1));
      }
      
      public function _X_R_() : int
      {
         if(this.s < 0)
         {
            return -1;
         }
         if(this.t <= 0 || this.t == 1 && this.a[0] <= 0)
         {
            return 0;
         }
         return 1;
      }
      
      protected function _1xN_(param1:uint = 10) : String
      {
         if(this._X_R_() == 0 || param1 < 2 || param1 > 32)
         {
            return "0";
         }
         var _loc2_:int = this._1B_s(param1);
         var _loc3_:Number = Math.pow(param1,_loc2_);
         var _loc4_:com.hurlant.math._ta = _019(_loc3_);
         var _loc5_:com.hurlant.math._ta = this._19S_();
         var _loc6_:com.hurlant.math._ta = this._19S_();
         var _loc7_:* = "";
         this._0cZ_(_loc4_,_loc5_,_loc6_);
         while(_loc5_._X_R_() > 0)
         {
            _loc7_ = (_loc3_ + _loc6_._1R_h()).toString(param1).substr(1) + _loc7_;
            _loc5_._0cZ_(_loc4_,_loc5_,_loc6_);
         }
         return _loc6_._1R_h().toString(param1) + _loc7_;
      }
      
      protected function _jJ_(param1:String, param2:int = 10) : void
      {
         var _loc3_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         this._lB_(0);
         var _loc4_:int = this._1B_s(param2);
         var _loc5_:Number = Math.pow(param2,_loc4_);
         while(_loc9_ < param1.length)
         {
            _loc3_ = this._gl(param1,_loc9_);
            if(_loc3_ < 0)
            {
               if(param1.charAt(_loc9_) == "-" && this._X_R_() == 0)
               {
                  _loc6_ = true;
               }
            }
            else
            {
               _loc8_ = param2 * _loc8_ + _loc3_;
               if(++_loc7_ >= _loc4_)
               {
                  this._kg(_loc5_);
                  this._0k2(_loc8_,0);
                  _loc7_ = 0;
                  _loc8_ = 0;
               }
            }
            _loc9_++;
         }
         if(_loc7_ > 0)
         {
            this._kg(Math.pow(param2,_loc7_));
            this._0k2(_loc8_,0);
         }
         if(_loc6_)
         {
            _1K_K_._07m(this,this);
         }
      }
      
      public function _D_s() : ByteArray
      {
         var _loc1_:* = 0;
         var _loc5_:int = 0;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc2_:int = this.t;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_[0] = this.s;
         var _loc4_:int = _hw - _loc2_ * _hw % 8;
         if(_loc2_-- > 0)
         {
            if(_loc4_ < _hw && (_loc1_ = int(this.a[_loc2_] >> _loc4_)) != (this.s & _F_x) >> _loc4_)
            {
               _loc6_ = _loc5_++;
               _loc3_[_loc6_] = _loc1_ | this.s << _hw - _loc4_;
            }
            while(_loc2_ >= 0)
            {
               if(_loc4_ < 8)
               {
                  _loc1_ = (this.a[_loc2_] & 1 << _loc4_ - 1) << 8 - _loc4_;
                  _loc7_ = _loc1_;
                  _loc4_ = _loc4_ + (_hw - 8);
                  _loc1_ = _loc7_ | this.a[--_loc2_] >> _loc4_;
               }
               else
               {
                  _loc4_ = _loc4_ - 8;
                  _loc1_ = this.a[_loc2_] >> _loc4_ & 255;
                  if(_loc4_ <= 0)
                  {
                     _loc4_ = _loc4_ + _hw;
                     _loc2_--;
                  }
               }
               if((_loc1_ & 128) != 0)
               {
                  _loc1_ = _loc1_ | -256;
               }
               if(_loc5_ == 0 && (this.s & 128) != (_loc1_ & 128))
               {
                  _loc5_++;
               }
               if(_loc5_ > 0 || _loc1_ != this.s)
               {
                  _loc6_ = _loc5_++;
                  _loc3_[_loc6_] = _loc1_;
               }
            }
         }
         return _loc3_;
      }
      
      public function equals(param1:com.hurlant.math._ta) : Boolean
      {
         return this._P_u(param1) == 0;
      }
      
      public function min(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         return this._P_u(param1) < 0?this:param1;
      }
      
      public function max(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         return this._P_u(param1) > 0?this:param1;
      }
      
      protected function _rv(param1:com.hurlant.math._ta, param2:Function, param3:com.hurlant.math._ta) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:int = Math.min(param1.t,this.t);
         _loc4_ = 0;
         while(_loc4_ < _loc6_)
         {
            param3.a[_loc4_] = param2(this.a[_loc4_],param1.a[_loc4_]);
            _loc4_++;
         }
         if(param1.t < this.t)
         {
            _loc5_ = param1.s & _F_x;
            _loc4_ = _loc6_;
            while(_loc4_ < this.t)
            {
               param3.a[_loc4_] = param2(this.a[_loc4_],_loc5_);
               _loc4_++;
            }
            param3.t = this.t;
         }
         else
         {
            _loc5_ = this.s & _F_x;
            _loc4_ = _loc6_;
            while(_loc4_ < param1.t)
            {
               param3.a[_loc4_] = param2(_loc5_,param1.a[_loc4_]);
               _loc4_++;
            }
            param3.t = param1.t;
         }
         param3.s = param2(this.s,param1.s);
         param3.clamp();
      }
      
      private function _0mf(param1:int, param2:int) : int
      {
         return param1 & param2;
      }
      
      public function _uu(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = new com.hurlant.math._ta();
         this._rv(param1,this._0mf,_loc2_);
         return _loc2_;
      }
      
      private function _rN_(param1:int, param2:int) : int
      {
         return param1 | param2;
      }
      
      public function or(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = new com.hurlant.math._ta();
         this._rv(param1,this._rN_,_loc2_);
         return _loc2_;
      }
      
      private function _0T_d(param1:int, param2:int) : int
      {
         return param1 ^ param2;
      }
      
      public function _0F_P_(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = new com.hurlant.math._ta();
         this._rv(param1,this._0T_d,_loc2_);
         return _loc2_;
      }
      
      private function _1L_M_(param1:int, param2:int) : int
      {
         return param1 & ~param2;
      }
      
      public function _r1(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = new com.hurlant.math._ta();
         this._rv(param1,this._1L_M_,_loc2_);
         return _loc2_;
      }
      
      public function not() : com.hurlant.math._ta
      {
         var _loc2_:int = 0;
         var _loc1_:com.hurlant.math._ta = new com.hurlant.math._ta();
         while(_loc2_ < this.t)
         {
            _loc1_[_loc2_] = _F_x & ~this.a[_loc2_];
            _loc2_++;
         }
         _loc1_.t = this.t;
         _loc1_.s = ~this.s;
         return _loc1_;
      }
      
      public function _M_F_(param1:int) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = new com.hurlant.math._ta();
         if(param1 < 0)
         {
            this._0G_G_(-param1,_loc2_);
         }
         else
         {
            this._Q_z(param1,_loc2_);
         }
         return _loc2_;
      }
      
      public function _0vm(param1:int) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = new com.hurlant.math._ta();
         if(param1 < 0)
         {
            this._Q_z(-param1,_loc2_);
         }
         else
         {
            this._0G_G_(param1,_loc2_);
         }
         return _loc2_;
      }
      
      private function _G_T_(param1:int) : int
      {
         var _loc2_:int = 0;
         if(param1 == 0)
         {
            return -1;
         }
         if((param1 & 65535) == 0)
         {
            param1 = param1 >> 16;
            _loc2_ = _loc2_ + 16;
         }
         if((param1 & 255) == 0)
         {
            param1 = param1 >> 8;
            _loc2_ = _loc2_ + 8;
         }
         if((param1 & 15) == 0)
         {
            param1 = param1 >> 4;
            _loc2_ = _loc2_ + 4;
         }
         if((param1 & 3) == 0)
         {
            param1 = param1 >> 2;
            _loc2_ = _loc2_ + 2;
         }
         if((param1 & 1) == 0)
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      public function _Y_G_() : int
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.t)
         {
            if(this.a[_loc1_] != 0)
            {
               return _loc1_ * _hw + this._G_T_(this.a[_loc1_]);
            }
            _loc1_++;
         }
         if(this.s < 0)
         {
            return this.t * _hw;
         }
         return -1;
      }
      
      private function _1B_E_(param1:int) : int
      {
         var _loc2_:uint = 0;
         while(param1 != 0)
         {
            param1 = param1 & param1 - 1;
            _loc2_++;
         }
         return _loc2_;
      }
      
      public function _U_a() : int
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:* = this.s & _F_x;
         while(_loc3_ < this.t)
         {
            _loc1_ = _loc1_ + this._1B_E_(this.a[_loc3_] ^ _loc2_);
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function _0yU_(param1:int) : Boolean
      {
         var _loc2_:int = Math.floor(param1 / _hw);
         if(_loc2_ >= this.t)
         {
            return this.s != 0;
         }
         return (this.a[_loc2_] & 1 << param1 % _hw) != 0;
      }
      
      protected function _1W_y(param1:int, param2:Function) : com.hurlant.math._ta
      {
         var _loc3_:com.hurlant.math._ta = _07D_._M_F_(param1);
         this._rv(_loc3_,param2,_loc3_);
         return _loc3_;
      }
      
      public function _1tQ_(param1:int) : com.hurlant.math._ta
      {
         return this._1W_y(param1,this._rN_);
      }
      
      public function _while(param1:int) : com.hurlant.math._ta
      {
         return this._1W_y(param1,this._1L_M_);
      }
      
      public function _mF_(param1:int) : com.hurlant.math._ta
      {
         return this._1W_y(param1,this._0T_d);
      }
      
      protected function addTo(param1:com.hurlant.math._ta, param2:com.hurlant.math._ta) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = 0;
         var _loc6_:* = undefined;
         var _loc5_:int = Math.min(param1.t,this.t);
         while(_loc3_ < _loc5_)
         {
            _loc4_ = int(_loc4_ + (this.a[_loc3_] + param1.a[_loc3_]));
            _loc6_ = _loc3_++;
            param2.a[_loc6_] = _loc4_ & _F_x;
            _loc4_ = _loc4_ >> _hw;
         }
         if(param1.t < this.t)
         {
            _loc4_ = int(_loc4_ + param1.s);
            while(_loc3_ < this.t)
            {
               _loc4_ = int(_loc4_ + this.a[_loc3_]);
               _loc6_ = _loc3_++;
               param2.a[_loc6_] = _loc4_ & _F_x;
               _loc4_ = _loc4_ >> _hw;
            }
            _loc4_ = int(_loc4_ + this.s);
         }
         else
         {
            _loc4_ = int(_loc4_ + this.s);
            while(_loc3_ < param1.t)
            {
               _loc4_ = int(_loc4_ + param1.a[_loc3_]);
               _loc6_ = _loc3_++;
               param2.a[_loc6_] = _loc4_ & _F_x;
               _loc4_ = _loc4_ >> _hw;
            }
            _loc4_ = int(_loc4_ + param1.s);
         }
         param2.s = _loc4_ < 0?-1:0;
         if(_loc4_ > 0)
         {
            _loc6_ = _loc3_++;
            param2.a[_loc6_] = _loc4_;
         }
         else if(_loc4_ < -1)
         {
            _loc6_ = _loc3_++;
            param2.a[_loc6_] = _10L_ + _loc4_;
         }
         param2.t = _loc3_;
         param2.clamp();
      }
      
      public function add(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = new com.hurlant.math._ta();
         this.addTo(param1,_loc2_);
         return _loc2_;
      }
      
      public function _yp(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = new com.hurlant.math._ta();
         this._07m(param1,_loc2_);
         return _loc2_;
      }
      
      public function _1iG_(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = new com.hurlant.math._ta();
         this._A_J_(param1,_loc2_);
         return _loc2_;
      }
      
      public function _0yq(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = new com.hurlant.math._ta();
         this._0cZ_(param1,_loc2_,null);
         return _loc2_;
      }
      
      public function _u4(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = new com.hurlant.math._ta();
         this._0cZ_(param1,null,_loc2_);
         return _loc2_;
      }
      
      public function _pF_(param1:com.hurlant.math._ta) : Array
      {
         var _loc2_:com.hurlant.math._ta = new com.hurlant.math._ta();
         var _loc3_:com.hurlant.math._ta = new com.hurlant.math._ta();
         this._0cZ_(param1,_loc2_,_loc3_);
         return [_loc2_,_loc3_];
      }
      
      bi_internal function _kg(param1:int) : void
      {
         this.a[this.t] = this.am(0,param1 - 1,this,0,0,this.t);
         this.t++;
         this.clamp();
      }
      
      bi_internal function _0k2(param1:int, param2:int) : void
      {
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         while(this.t <= param2)
         {
            _loc3_ = this.t++;
            this.a[_loc3_] = 0;
         }
         this.a[param2] = this.a[param2] + param1;
         while(this.a[param2] >= _10L_)
         {
            this.a[param2] = this.a[param2] - _10L_;
            if(++param2 >= this.t)
            {
               _loc3_ = this.t++;
               this.a[_loc3_] = 0;
            }
            _loc3_ = this.a;
            _loc4_ = param2;
            _loc5_ = _loc3_[_loc4_] + 1;
            _loc3_[_loc4_] = _loc5_;
         }
      }
      
      public function pow(param1:int) : com.hurlant.math._ta
      {
         return this.exp(param1,new _d__());
      }
      
      bi_internal function _1jX_(param1:com.hurlant.math._ta, param2:int, param3:com.hurlant.math._ta) : void
      {
         var _loc4_:int = 0;
         var _loc6_:* = undefined;
         var _loc5_:int = Math.min(this.t + param1.t,param2);
         param3.s = 0;
         param3.t = _loc5_;
         while(_loc5_ > 0)
         {
            _loc6_ = --_loc5_;
            param3.a[_loc6_] = 0;
         }
         _loc4_ = param3.t - this.t;
         while(_loc5_ < _loc4_)
         {
            param3.a[_loc5_ + this.t] = this.am(0,param1.a[_loc5_],param3,_loc5_,0,this.t);
            _loc5_++;
         }
         _loc4_ = Math.min(param1.t,param2);
         while(_loc5_ < _loc4_)
         {
            this.am(0,param1.a[_loc5_],param3,_loc5_,0,param2 - _loc5_);
            _loc5_++;
         }
         param3.clamp();
      }
      
      bi_internal function _0hU_(param1:com.hurlant.math._ta, param2:int, param3:com.hurlant.math._ta) : void
      {
         param2--;
         var _loc4_:int = param3.t = this.t + param1.t - param2;
         param3.s = 0;
         while(--_loc4_ >= 0)
         {
            param3.a[_loc4_] = 0;
         }
         _loc4_ = Math.max(param2 - this.t,0);
         while(_loc4_ < param1.t)
         {
            param3.a[this.t + _loc4_ - param2] = this.am(param2 - _loc4_,param1.a[_loc4_],param3,0,0,this.t + _loc4_ - param2);
            _loc4_++;
         }
         param3.clamp();
         param3._03w(1,param3);
      }
      
      public function _10J_(param1:com.hurlant.math._ta, param2:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc3_:int = 0;
         var _loc4_:_0C_Q_ = null;
         var _loc5_:* = 0;
         var _loc6_:com.hurlant.math._ta = null;
         var _loc7_:com.hurlant.math._ta = null;
         var _loc8_:int = param1._01y();
         var _loc9_:com.hurlant.math._ta = _019(1);
         if(_loc8_ <= 0)
         {
            return _loc9_;
         }
         if(_loc8_ < 18)
         {
            _loc3_ = 1;
         }
         else if(_loc8_ < 48)
         {
            _loc3_ = 3;
         }
         else if(_loc8_ < 144)
         {
            _loc3_ = 4;
         }
         else if(_loc8_ < 768)
         {
            _loc3_ = 5;
         }
         else
         {
            _loc3_ = 6;
         }
         if(_loc8_ < 8)
         {
            _loc4_ = new _hz(param2);
         }
         else if(param2._G_u())
         {
            _loc4_ = new _1T_w(param2);
         }
         else
         {
            _loc4_ = new _F_A_(param2);
         }
         var _loc10_:Array = [];
         var _loc11_:int = 3;
         var _loc12_:int = _loc3_ - 1;
         var _loc13_:int = 1 << _loc3_ - 1;
         _loc10_[1] = _loc4_._P_y(this);
         if(_loc3_ > 1)
         {
            _loc7_ = new com.hurlant.math._ta();
            _loc4_._U_6(_loc10_[1],_loc7_);
            while(_loc11_ <= _loc13_)
            {
               _loc10_[_loc11_] = new com.hurlant.math._ta();
               _loc4_._1R_X_(_loc7_,_loc10_[_loc11_ - 2],_loc10_[_loc11_]);
               _loc11_ = _loc11_ + 2;
            }
         }
         var _loc14_:int = param1.t - 1;
         var _loc15_:Boolean = true;
         var _loc16_:com.hurlant.math._ta = new com.hurlant.math._ta();
         _loc8_ = this._0R_m(param1.a[_loc14_]) - 1;
         while(_loc14_ >= 0)
         {
            if(_loc8_ >= _loc12_)
            {
               _loc5_ = param1.a[_loc14_] >> _loc8_ - _loc12_ & _loc13_;
            }
            else
            {
               _loc5_ = (param1.a[_loc14_] & 1 << _loc8_ + 1 - 1) << _loc12_ - _loc8_;
               if(_loc14_ > 0)
               {
                  _loc5_ = _loc5_ | param1.a[_loc14_ - 1] >> _hw + _loc8_ - _loc12_;
               }
            }
            _loc11_ = _loc3_;
            while((_loc5_ & 1) == 0)
            {
               _loc5_ = _loc5_ >> 1;
               _loc11_--;
            }
            _loc8_ = _loc8_ - _loc11_;
            if(_loc8_ < 0)
            {
               _loc8_ = _loc8_ + _hw;
               _loc14_--;
            }
            if(_loc15_)
            {
               _loc10_[_loc5_].copyTo(_loc9_);
               _loc15_ = false;
            }
            else
            {
               while(_loc11_ > 1)
               {
                  _loc4_._U_6(_loc9_,_loc16_);
                  _loc4_._U_6(_loc16_,_loc9_);
                  _loc11_ = _loc11_ - 2;
               }
               if(_loc11_ > 0)
               {
                  _loc4_._U_6(_loc9_,_loc16_);
               }
               else
               {
                  _loc6_ = _loc9_;
                  _loc9_ = _loc16_;
                  _loc16_ = _loc6_;
               }
               _loc4_._1R_X_(_loc16_,_loc10_[_loc5_],_loc9_);
            }
            while(_loc14_ >= 0 && (param1.a[_loc14_] & 1 << _loc8_) == 0)
            {
               _loc4_._U_6(_loc9_,_loc16_);
               _loc6_ = _loc9_;
               _loc9_ = _loc16_;
               _loc16_ = _loc6_;
               if(--_loc8_ < 0)
               {
                  _loc8_ = _hw - 1;
                  _loc14_--;
               }
            }
         }
         return _loc4_._1pk(_loc9_);
      }
      
      public function _U_Z_(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc2_:com.hurlant.math._ta = null;
         var _loc3_:com.hurlant.math._ta = this.s < 0?this._yU_():this.clone();
         var _loc4_:com.hurlant.math._ta = param1.s < 0?param1._yU_():param1.clone();
         if(_loc3_._P_u(_loc4_) < 0)
         {
            _loc2_ = _loc3_;
            _loc3_ = _loc4_;
            _loc4_ = _loc2_;
         }
         var _loc5_:int = _loc3_._Y_G_();
         var _loc6_:int = _loc4_._Y_G_();
         if(_loc6_ < 0)
         {
            return _loc3_;
         }
         if(_loc5_ < _loc6_)
         {
            _loc6_ = _loc5_;
         }
         if(_loc6_ > 0)
         {
            _loc3_._0G_G_(_loc6_,_loc3_);
            _loc4_._0G_G_(_loc6_,_loc4_);
         }
         while(_loc3_._X_R_() > 0)
         {
            _loc5_ = _loc3_._Y_G_();
            if(_loc5_ > 0)
            {
               _loc3_._0G_G_(_loc5_,_loc3_);
            }
            _loc5_ = _loc4_._Y_G_();
            if(_loc5_ > 0)
            {
               _loc4_._0G_G_(_loc5_,_loc4_);
            }
            if(_loc3_._P_u(_loc4_) >= 0)
            {
               _loc3_._07m(_loc4_,_loc3_);
               _loc3_._0G_G_(1,_loc3_);
            }
            else
            {
               _loc4_._07m(_loc3_,_loc4_);
               _loc4_._0G_G_(1,_loc4_);
            }
         }
         if(_loc6_ > 0)
         {
            _loc4_._Q_z(_loc6_,_loc4_);
         }
         return _loc4_;
      }
      
      protected function _1kq(param1:int) : int
      {
         var _loc2_:int = 0;
         if(param1 <= 0)
         {
            return 0;
         }
         var _loc3_:int = _10L_ % param1;
         var _loc4_:int = this.s < 0?int(param1 - 1):0;
         if(this.t > 0)
         {
            if(_loc3_ == 0)
            {
               _loc4_ = this.a[0] % param1;
            }
            else
            {
               _loc2_ = this.t - 1;
               while(_loc2_ >= 0)
               {
                  _loc4_ = (_loc3_ * _loc4_ + this.a[_loc2_]) % param1;
                  _loc2_--;
               }
            }
         }
         return _loc4_;
      }
      
      public function _x0(param1:com.hurlant.math._ta) : com.hurlant.math._ta
      {
         var _loc2_:Boolean = param1._G_u();
         if(this._G_u() && _loc2_ || param1._X_R_() == 0)
         {
            return _1K_K_;
         }
         var _loc3_:com.hurlant.math._ta = param1.clone();
         var _loc4_:com.hurlant.math._ta = this.clone();
         var _loc5_:com.hurlant.math._ta = _019(1);
         var _loc6_:com.hurlant.math._ta = _019(0);
         var _loc7_:com.hurlant.math._ta = _019(0);
         var _loc8_:com.hurlant.math._ta = _019(1);
         while(_loc3_._X_R_() != 0)
         {
            while(_loc3_._G_u())
            {
               _loc3_._0G_G_(1,_loc3_);
               if(_loc2_)
               {
                  if(!_loc5_._G_u() || !_loc6_._G_u())
                  {
                     _loc5_.addTo(this,_loc5_);
                     _loc6_._07m(param1,_loc6_);
                  }
                  _loc5_._0G_G_(1,_loc5_);
               }
               else if(!_loc6_._G_u())
               {
                  _loc6_._07m(param1,_loc6_);
               }
               _loc6_._0G_G_(1,_loc6_);
            }
            while(_loc4_._G_u())
            {
               _loc4_._0G_G_(1,_loc4_);
               if(_loc2_)
               {
                  if(!_loc7_._G_u() || !_loc8_._G_u())
                  {
                     _loc7_.addTo(this,_loc7_);
                     _loc8_._07m(param1,_loc8_);
                  }
                  _loc7_._0G_G_(1,_loc7_);
               }
               else if(!_loc8_._G_u())
               {
                  _loc8_._07m(param1,_loc8_);
               }
               _loc8_._0G_G_(1,_loc8_);
            }
            if(_loc3_._P_u(_loc4_) >= 0)
            {
               _loc3_._07m(_loc4_,_loc3_);
               if(_loc2_)
               {
                  _loc5_._07m(_loc7_,_loc5_);
               }
               _loc6_._07m(_loc8_,_loc6_);
            }
            else
            {
               _loc4_._07m(_loc3_,_loc4_);
               if(_loc2_)
               {
                  _loc7_._07m(_loc5_,_loc7_);
               }
               _loc8_._07m(_loc6_,_loc8_);
            }
         }
         if(_loc4_._P_u(_07D_) != 0)
         {
            return _1K_K_;
         }
         if(_loc8_._P_u(param1) >= 0)
         {
            return _loc8_._yp(param1);
         }
         if(_loc8_._X_R_() < 0)
         {
            _loc8_.addTo(param1,_loc8_);
            if(_loc8_._X_R_() < 0)
            {
               return _loc8_.add(param1);
            }
            return _loc8_;
         }
         return _loc8_;
      }
      
      public function _1W_8(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:com.hurlant.math._ta = this.abs();
         if(_loc5_.t == 1 && _loc5_.a[0] <= _14d[_14d.length - 1])
         {
            _loc2_ = 0;
            while(_loc2_ < _14d.length)
            {
               if(_loc5_[0] == _14d[_loc2_])
               {
                  return true;
               }
               _loc2_++;
            }
            return false;
         }
         if(_loc5_._G_u())
         {
            return false;
         }
         _loc2_ = 1;
         while(_loc2_ < _14d.length)
         {
            _loc3_ = _14d[_loc2_];
            _loc4_ = _loc2_ + 1;
            while(_loc4_ < _14d.length && _loc3_ < _04H_)
            {
               _loc3_ = _loc3_ * _14d[_loc4_++];
            }
            _loc3_ = _loc5_._1kq(_loc3_);
            while(_loc2_ < _loc4_)
            {
               if(_loc3_ % _14d[_loc2_++] == 0)
               {
                  return false;
               }
            }
         }
         return _loc5_._1S_2(param1);
      }
      
      protected function _1S_2(param1:int) : Boolean
      {
         var _loc2_:com.hurlant.math._ta = null;
         var _loc3_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:com.hurlant.math._ta = this._yp(_07D_);
         var _loc5_:int = _loc4_._Y_G_();
         if(_loc5_ <= 0)
         {
            return false;
         }
         var _loc6_:com.hurlant.math._ta = _loc4_._0vm(_loc5_);
         param1 = param1 + 1 >> 1;
         if(param1 > _14d.length)
         {
            param1 = int(_14d.length);
         }
         var _loc7_:com.hurlant.math._ta = new com.hurlant.math._ta();
         while(_loc8_ < param1)
         {
            _loc7_._lB_(_14d[_loc8_]);
            _loc2_ = _loc7_._10J_(_loc6_,this);
            if(_loc2_._P_u(_07D_) != 0 && _loc2_._P_u(_loc4_) != 0)
            {
               _loc3_ = 1;
               while(_loc3_++ < _loc5_ && _loc2_._P_u(_loc4_) != 0)
               {
                  _loc2_ = _loc2_._03g(2,this);
                  if(_loc2_._P_u(_07D_) == 0)
                  {
                     return false;
                  }
               }
               if(_loc2_._P_u(_loc4_) != 0)
               {
                  return false;
               }
            }
            _loc8_++;
         }
         return true;
      }
      
      public function _H_(param1:int, param2:int) : void
      {
         if(!this._0yU_(param1 - 1))
         {
            this._rv(_07D_._M_F_(param1 - 1),this._rN_,this);
         }
         if(this._G_u())
         {
            this._0k2(1,0);
         }
         while(!this._1W_8(param2))
         {
            this._0k2(2,0);
            while(this._01y() > param1)
            {
               this._07m(_07D_._M_F_(param1 - 1),this);
            }
         }
      }
   }
}
