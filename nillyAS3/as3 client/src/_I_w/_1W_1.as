package _I_w
{
   import _1__8._0J_Z_;
   
   public class _1W_1
   {
       
      
      private const _0i4:String = "You can\'t change the guards and hooks on an existing mapping. Unmap first.";
      
      private const _1eG_:String = " The stacktrace for this error was stored at the time when you duplicated the mapping - you may have failed to add guards and hooks that were already present.";
      
      private var _1X_4:Array;
      
      private var _1mk:Array;
      
      private var _03L_;
      
      private var _1D_g;
      
      private var _Q_N_:_0J_Z_;
      
      private var _r__:Boolean = false;
      
      public function _1W_1(param1:Array, param2:Array, param3:*, param4:*)
      {
         this._1X_4 = param1;
         this._1mk = param2;
         this._03L_ = param3;
         this._1D_g = param4;
         super();
      }
      
      public function get _17L_() : Boolean
      {
         return this._r__;
      }
      
      public function _11v() : void
      {
         this._r__ = false;
         this._Q_N_ = new _0J_Z_(this._0i4 + this._1eG_,this._03L_,this._1D_g);
      }
      
      public function _df(param1:Array, param2:Array) : void
      {
         if(!this._cY_(this._1X_4,param1) || !this._cY_(this._1mk,param2))
         {
            this._0R_d() || this._145();
         }
         this._r__ = true;
         this._Q_N_ = null;
      }
      
      public function _0E_q(param1:Array) : void
      {
         if(this._W_n(this._1X_4,param1))
         {
            this._145();
         }
      }
      
      public function _1Y_q(param1:Array) : void
      {
         if(this._W_n(this._1mk,param1))
         {
            this._145();
         }
      }
      
      private function _W_n(param1:Array, param2:Array) : Boolean
      {
         var _loc3_:* = undefined;
         param2 = this._0N_8(param2);
         for each(_loc3_ in param2)
         {
            if(param1.indexOf(_loc3_) == -1)
            {
               return true;
            }
         }
         return false;
      }
      
      private function _cY_(param1:Array, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         var _loc5_:uint = 0;
         param1 = param1.slice();
         if(param1.length != param2.length)
         {
            return false;
         }
         var _loc4_:uint = param2.length;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1.indexOf(param2[_loc5_]);
            if(_loc3_ == -1)
            {
               return false;
            }
            param1.splice(_loc3_,1);
            _loc5_++;
         }
         return true;
      }
      
      public function _0N_8(param1:Array) : Array
      {
         var _loc2_:* = undefined;
         var _loc3_:Array = [];
         for each(_loc2_ in param1)
         {
            if(_loc2_ is Array)
            {
               _loc3_ = _loc3_.concat(this._0N_8(_loc2_ as Array));
            }
            else
            {
               _loc3_.push(_loc2_);
            }
         }
         return _loc3_;
      }
      
      private function _145() : void
      {
         throw new _0J_Z_(this._0i4,this._03L_,this._1D_g);
      }
      
      private function _0R_d() : Boolean
      {
         if(this._Q_N_)
         {
            throw this._Q_N_;
         }
         return false;
      }
   }
}
