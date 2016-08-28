package com.hurlant.crypto.rsa
{
   import com.hurlant.math._ta;
   import com.hurlant.crypto.prng.Random;
   import flash.utils.ByteArray;
   import com.hurlant.util.Memory;
   import com.hurlant.crypto.tls.TLSError;
   
   public class RSAKey
   {
       
      
      public var e:int;
      
      public var n:_ta;
      
      public var d:_ta;
      
      public var p:_ta;
      
      public var q:_ta;
      
      public var dmp1:_ta;
      
      public var dmq1:_ta;
      
      public var coeff:_ta;
      
      protected var canDecrypt:Boolean;
      
      protected var canEncrypt:Boolean;
      
      public function RSAKey(param1:_ta, param2:int, param3:_ta = null, param4:_ta = null, param5:_ta = null, param6:_ta = null, param7:_ta = null, param8:_ta = null)
      {
         super();
         this.n = param1;
         this.e = param2;
         this.d = param3;
         this.p = param4;
         this.q = param5;
         this.dmp1 = param6;
         this.dmq1 = param7;
         this.coeff = param8;
         this.canEncrypt = this.n != null && this.e != 0;
         this.canDecrypt = this.canEncrypt && this.d != null;
      }
      
      public static function parsePublicKey(param1:String, param2:String) : RSAKey
      {
         return new RSAKey(new _ta(param1,16,true),parseInt(param2,16));
      }
      
      public static function parsePrivateKey(param1:String, param2:String, param3:String, param4:String = null, param5:String = null, param6:String = null, param7:String = null, param8:String = null) : RSAKey
      {
         if(param4 == null)
         {
            return new RSAKey(new _ta(param1,16,true),parseInt(param2,16),new _ta(param3,16,true));
         }
         return new RSAKey(new _ta(param1,16,true),parseInt(param2,16),new _ta(param3,16,true),new _ta(param4,16,true),new _ta(param5,16,true),new _ta(param6,16,true),new _ta(param7,16,true),new _ta(param8,16,true));
      }
      
      public static function generate(param1:uint, param2:String) : RSAKey
      {
         var _loc3_:_ta = null;
         var _loc4_:_ta = null;
         var _loc5_:_ta = null;
         var _loc6_:_ta = null;
         var _loc7_:Random = new Random();
         var _loc8_:uint = param1 >> 1;
         var _loc9_:RSAKey = new RSAKey(null,0,null);
         _loc9_.e = parseInt(param2,16);
         var _loc10_:_ta = new _ta(param2,16,true);
         do
         {
            do
            {
               _loc9_.p = bigRandom(param1 - _loc8_,_loc7_);
            }
            while(!(_loc9_.p._yp(_ta._07D_)._U_Z_(_loc10_)._P_u(_ta._07D_) == 0 && _loc9_.p._1W_8(10)));
            
            do
            {
               _loc9_.q = bigRandom(_loc8_,_loc7_);
            }
            while(!(_loc9_.q._yp(_ta._07D_)._U_Z_(_loc10_)._P_u(_ta._07D_) == 0 && _loc9_.q._1W_8(10)));
            
            if(_loc9_.p._P_u(_loc9_.q) <= 0)
            {
               _loc6_ = _loc9_.p;
               _loc9_.p = _loc9_.q;
               _loc9_.q = _loc6_;
            }
            _loc3_ = _loc9_.p._yp(_ta._07D_);
            _loc4_ = _loc9_.q._yp(_ta._07D_);
            _loc5_ = _loc3_._1iG_(_loc4_);
         }
         while(_loc5_._U_Z_(_loc10_)._P_u(_ta._07D_) != 0);
         
         _loc9_.n = _loc9_.p._1iG_(_loc9_.q);
         _loc9_.d = _loc10_._x0(_loc5_);
         _loc9_.dmp1 = _loc9_.d._1Q_V_(_loc3_);
         _loc9_.dmq1 = _loc9_.d._1Q_V_(_loc4_);
         _loc9_.coeff = _loc9_.q._x0(_loc9_.p);
         return _loc9_;
      }
      
      protected static function bigRandom(param1:int, param2:Random) : _ta
      {
         if(param1 < 2)
         {
            return _ta._019(1);
         }
         var _loc3_:ByteArray = new ByteArray();
         param2.nextBytes(_loc3_,param1 >> 3);
         _loc3_.position = 0;
         var _loc4_:_ta = new _ta(_loc3_,0,true);
         _loc4_._H_(param1,1);
         return _loc4_;
      }
      
      public function getBlockSize() : uint
      {
         return (this.n._01y() + 7) / 8;
      }
      
      public function dispose() : void
      {
         this.e = 0;
         this.n.dispose();
         this.n = null;
         Memory.gc();
      }
      
      public function encrypt(param1:ByteArray, param2:ByteArray, param3:uint, param4:Function = null) : void
      {
         this._encrypt(this.doPublic,param1,param2,param3,param4,2);
      }
      
      public function decrypt(param1:ByteArray, param2:ByteArray, param3:uint, param4:Function = null) : void
      {
         this._decrypt(this.doPrivate2,param1,param2,param3,param4,2);
      }
      
      public function sign(param1:ByteArray, param2:ByteArray, param3:uint, param4:Function = null) : void
      {
         this._encrypt(this.doPrivate2,param1,param2,param3,param4,1);
      }
      
      public function verify(param1:ByteArray, param2:ByteArray, param3:uint, param4:Function = null) : void
      {
         this._decrypt(this.doPublic,param1,param2,param3,param4,1);
      }
      
      private function _encrypt(param1:Function, param2:ByteArray, param3:ByteArray, param4:uint, param5:Function, param6:int) : void
      {
         var _loc7_:_ta = null;
         var _loc8_:_ta = null;
         if(param5 == null)
         {
            param5 = this.pkcs1pad;
         }
         if(param2.position >= param2.length)
         {
            param2.position = 0;
         }
         var _loc9_:uint = this.getBlockSize();
         var _loc10_:int = param2.position + param4;
         while(param2.position < _loc10_)
         {
            _loc7_ = new _ta(param5(param2,_loc10_,_loc9_,param6),_loc9_,true);
            _loc8_ = param1(_loc7_);
            _loc8_.toArray(param3);
         }
      }
      
      private function _decrypt(param1:Function, param2:ByteArray, param3:ByteArray, param4:uint, param5:Function, param6:int) : void
      {
         var _loc7_:_ta = null;
         var _loc8_:_ta = null;
         var _loc9_:ByteArray = null;
         if(param5 == null)
         {
            param5 = this.pkcs1unpad;
         }
         if(param2.position >= param2.length)
         {
            param2.position = 0;
         }
         var _loc10_:uint = this.getBlockSize();
         var _loc11_:int = param2.position + param4;
         while(param2.position < _loc11_)
         {
            _loc7_ = new _ta(param2,_loc10_,true);
            _loc8_ = param1(_loc7_);
            _loc9_ = param5(_loc8_,_loc10_,param6);
            if(_loc9_ == null)
            {
               throw new TLSError("Decrypt error - padding function returned null!",TLSError.decode_error);
            }
            param3.writeBytes(_loc9_);
         }
      }
      
      private function pkcs1pad(param1:ByteArray, param2:int, param3:uint, param4:uint = 2) : ByteArray
      {
         var _loc5_:Random = null;
         var _loc6_:int = 0;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc7_:ByteArray = new ByteArray();
         var _loc8_:uint = param1.position;
         param2 = Math.min(param2,param1.length,_loc8_ + param3 - 11);
         param1.position = param2;
         var _loc9_:int = param2 - 1;
         while(_loc9_ >= _loc8_ && param3 > 11)
         {
            _loc11_ = --param3;
            _loc7_[_loc11_] = param1[_loc9_--];
         }
         _loc11_ = --param3;
         _loc7_[_loc11_] = 0;
         if(param4 == 2)
         {
            _loc5_ = new Random();
            _loc6_ = 0;
            while(param3 > 2)
            {
               do
               {
                  _loc6_ = _loc5_.nextByte();
               }
               while(_loc6_ == 0);
               
               _loc12_ = --param3;
               _loc7_[_loc12_] = _loc6_;
            }
         }
         else
         {
            while(param3 > 2)
            {
               _loc12_ = --param3;
               _loc7_[_loc12_] = 255;
            }
         }
         _loc12_ = --param3;
         _loc7_[_loc12_] = param4;
         var _loc10_:* = --param3;
         _loc7_[_loc10_] = 0;
         return _loc7_;
      }
      
      private function pkcs1unpad(param1:_ta, param2:uint, param3:uint = 2) : ByteArray
      {
         var _loc6_:int = 0;
         var _loc4_:ByteArray = param1._D_s();
         var _loc5_:ByteArray = new ByteArray();
         _loc4_.position = 0;
         while(_loc6_ < _loc4_.length && _loc4_[_loc6_] == 0)
         {
            _loc6_++;
         }
         if(_loc4_.length - _loc6_ != param2 - 1 || _loc4_[_loc6_] != param3)
         {
            return null;
         }
         _loc6_++;
         while(_loc4_[_loc6_] != 0)
         {
            if(++_loc6_ >= _loc4_.length)
            {
               return null;
            }
         }
         while(++_loc6_ < _loc4_.length)
         {
            _loc5_.writeByte(_loc4_[_loc6_]);
         }
         _loc5_.position = 0;
         return _loc5_;
      }
      
      public function rawpad(param1:ByteArray, param2:int, param3:uint, param4:uint = 0) : ByteArray
      {
         return param1;
      }
      
      public function rawunpad(param1:_ta, param2:uint, param3:uint = 0) : ByteArray
      {
         return param1._D_s();
      }
      
      public function toString() : String
      {
         return "rsa";
      }
      
      public function dump() : String
      {
         var _loc1_:* = "N=" + this.n.toString(16) + "\n" + "E=" + this.e.toString(16) + "\n";
         if(this.canDecrypt)
         {
            _loc1_ = _loc1_ + ("D=" + this.d.toString(16) + "\n");
            if(this.p != null && this.q != null)
            {
               _loc1_ = _loc1_ + ("P=" + this.p.toString(16) + "\n");
               _loc1_ = _loc1_ + ("Q=" + this.q.toString(16) + "\n");
               _loc1_ = _loc1_ + ("DMP1=" + this.dmp1.toString(16) + "\n");
               _loc1_ = _loc1_ + ("DMQ1=" + this.dmq1.toString(16) + "\n");
               _loc1_ = _loc1_ + ("IQMP=" + this.coeff.toString(16) + "\n");
            }
         }
         return _loc1_;
      }
      
      protected function doPublic(param1:_ta) : _ta
      {
         return param1._03g(this.e,this.n);
      }
      
      protected function doPrivate2(param1:_ta) : _ta
      {
         if(this.p == null && this.q == null)
         {
            return param1._10J_(this.d,this.n);
         }
         var _loc2_:_ta = param1._1Q_V_(this.p)._10J_(this.dmp1,this.p);
         var _loc3_:_ta = param1._1Q_V_(this.q)._10J_(this.dmq1,this.q);
         while(_loc2_._P_u(_loc3_) < 0)
         {
            _loc2_ = _loc2_.add(this.p);
         }
         var _loc4_:_ta = _loc2_._yp(_loc3_)._1iG_(this.coeff)._1Q_V_(this.p)._1iG_(this.q).add(_loc3_);
         return _loc4_;
      }
      
      protected function doPrivate(param1:_ta) : _ta
      {
         if(this.p == null || this.q == null)
         {
            return param1._10J_(this.d,this.n);
         }
         var _loc2_:_ta = param1._1Q_V_(this.p)._10J_(this.dmp1,this.p);
         var _loc3_:_ta = param1._1Q_V_(this.q)._10J_(this.dmq1,this.q);
         while(_loc2_._P_u(_loc3_) < 0)
         {
            _loc2_ = _loc2_.add(this.p);
         }
         return _loc2_._yp(_loc3_)._1iG_(this.coeff)._1Q_V_(this.p)._1iG_(this.q).add(_loc3_);
      }
   }
}
