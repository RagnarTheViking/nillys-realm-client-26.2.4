package _1Z_i
{
   import _1kz._0gB_;
   import _J_4._1ex;
   import _I_w._1W_1;
   import _1kz._1xl;
   
   public class _wL_ implements _0gB_, _1ex
   {
       
      
      private var _wZ_:Class;
      
      private var _1X_4:Array;
      
      private var _1mk:Array;
      
      private var _once:Boolean;
      
      private var _1a0:_0gB_;
      
      private var _X_C_:_1W_1;
      
      public function _wL_(param1:Class)
      {
         this._1X_4 = [];
         this._1mk = [];
         super();
         this._wZ_ = param1;
      }
      
      public function get commandClass() : Class
      {
         return this._wZ_;
      }
      
      public function get _P_O_() : Array
      {
         return this._1X_4;
      }
      
      public function get _1P_S_() : Array
      {
         return this._1mk;
      }
      
      public function _1qt(... rest) : _1ex
      {
         this._X_C_ && this._X_C_._0E_q(rest);
         this._1X_4 = this._1X_4.concat.apply(null,rest);
         return this;
      }
      
      public function _1xT_(... rest) : _1ex
      {
         this._X_C_ && this._X_C_._1Y_q(rest);
         this._1mk = this._1mk.concat.apply(null,rest);
         return this;
      }
      
      public function get _di() : Boolean
      {
         return this._once;
      }
      
      public function once(param1:Boolean = true) : _1ex
      {
         this._X_C_ && !this._once && this._145("You attempted to change an existing mapping for " + this._wZ_ + " by setting once(). Please unmap first.");
         this._once = param1;
         return this;
      }
      
      public function get next() : _0gB_
      {
         return this._1a0;
      }
      
      public function set next(param1:_0gB_) : void
      {
         this._1a0 = param1;
      }
      
      private function _145(param1:String) : void
      {
         throw new _1xl(param1);
      }
      
      function _11v() : void
      {
         if(this._X_C_)
         {
            this._X_C_._11v();
         }
         else
         {
            this._X_9();
         }
         this._1X_4 = [];
         this._1mk = [];
      }
      
      public function _df() : void
      {
         if(!this._X_C_)
         {
            this._X_9();
         }
         else if(!this._X_C_._17L_)
         {
            this._X_C_._df(this._1X_4,this._1mk);
         }
      }
      
      private function _X_9() : void
      {
         this._X_C_ = new _1W_1(this._1X_4.slice(),this._1mk.slice(),null,this._wZ_);
      }
   }
}
