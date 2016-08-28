package _I_w
{
   import _1__8._1Q_O_;
   import _wi.Injector;
   import _1__8._19A_;
   import _1__8._06G_;
   import _0eG_._xn;
   import _1__8._0dX_;
   
   public class _0iQ_ implements _1Q_O_
   {
       
      
      private const _A_A_:Injector = new Injector();
      
      private const _0yi:String = _0S_m.create(_0iQ_);
      
      private const _1c4:_I_w._S_7 = new _I_w._S_7();
      
      private const _13E_:_I_w._1W_N_ = new _I_w._1W_N_();
      
      private var _U_h:_I_w._01d;
      
      private var _0Q_I_:_I_w._V_r;
      
      private var _1M_C_:_I_w._0G_L_;
      
      private var _1aY_:_19A_;
      
      public function _0iQ_()
      {
         super();
         this.setup();
      }
      
      public function get _T_X_() : Injector
      {
         return this._A_A_;
      }
      
      public function get _1dX_() : uint
      {
         return this._1c4._1dX_;
      }
      
      public function set _1dX_(param1:uint) : void
      {
         this._1c4._1dX_ = param1;
      }
      
      public function get _1za() : _06G_
      {
         return this._U_h;
      }
      
      public function initialize() : void
      {
         this._U_h.initialize();
      }
      
      public function destroy() : void
      {
         this._U_h.destroy();
      }
      
      public function extend(... rest) : _1Q_O_
      {
         var _loc2_:Object = null;
         for each(_loc2_ in rest)
         {
            this._1M_C_._B_5(_loc2_);
         }
         return this;
      }
      
      public function configure(... rest) : _1Q_O_
      {
         var _loc2_:Object = null;
         for each(_loc2_ in rest)
         {
            this._0Q_I_._08l(_loc2_);
         }
         return this;
      }
      
      public function _09l(param1:_xn, param2:Function) : _1Q_O_
      {
         this._0Q_I_._09l(param1,param2);
         return this;
      }
      
      public function _A_9(param1:Object) : _19A_
      {
         return this._1c4._A_9(param1);
      }
      
      public function _1T_1(param1:_0dX_) : _1Q_O_
      {
         this._1c4._1T_1(param1);
         return this;
      }
      
      public function _1W_k(... rest) : _1Q_O_
      {
         var _loc2_:Object = null;
         for each(_loc2_ in rest)
         {
            this._13E_._1W_k(_loc2_);
         }
         return this;
      }
      
      public function release(... rest) : _1Q_O_
      {
         var _loc2_:Object = null;
         for each(_loc2_ in rest)
         {
            this._13E_.release(_loc2_);
         }
         return this;
      }
      
      public function toString() : String
      {
         return this._0yi;
      }
      
      private function setup() : void
      {
         this._A_A_.map(Injector)._1as(this._A_A_);
         this._A_A_.map(_1Q_O_)._1as(this);
         this._1aY_ = this._1c4._A_9(this);
         this._U_h = new _I_w._01d(this);
         this._0Q_I_ = new _I_w._V_r(this);
         this._1M_C_ = new _I_w._0G_L_(this);
         this._U_h._0H_v(this._0H_v);
         this._U_h._1dl(this._1dl);
         this._U_h._1K_s(this._1K_s);
         this._U_h._Y_W_(this._Y_W_);
      }
      
      private function _0H_v() : void
      {
         this._1aY_.info("Initializing...");
      }
      
      private function _1dl() : void
      {
         this._1aY_.info("Initialize complete");
      }
      
      private function _1K_s() : void
      {
         this._1aY_.info("Destroying...");
      }
      
      private function _Y_W_() : void
      {
         this._13E_.flush();
         this._A_A_._1b__();
         this._1aY_.info("Destroy complete");
      }
   }
}
