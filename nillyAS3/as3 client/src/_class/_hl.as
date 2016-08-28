package _class
{
   import _1__8._01s;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _1J_2._01x;
   import _0cj._0oO_;
   import _1__8._1Q_O_;
   import _0f._1iK_;
   import _0cj._2I_;
   import _0cj._1rI_;
   import _1J_2._1O_N_;
   import _I_w._0S_m;
   
   public class _hl implements _01s
   {
       
      
      private const _0yi:String = _0S_m.create(_hl);
      
      private var _A_A_:Injector;
      
      private var _00D_:IMediatorMap;
      
      private var _X_f:_01x;
      
      private var _K_z:_0oO_;
      
      public function _hl()
      {
         super();
      }
      
      public function extend(param1:_1Q_O_) : void
      {
         this._A_A_ = param1._T_X_;
         this._A_A_.map(_1iK_)._015(_2I_);
         this._A_A_.map(IMediatorMap)._015(_1rI_);
         param1._1za._0H_v(this._0H_v);
         param1._1za._1K_s(this._1K_s);
         param1._1za._0O_v(this._0O_v);
      }
      
      public function toString() : String
      {
         return this._0yi;
      }
      
      private function _0H_v() : void
      {
         this._00D_ = this._A_A_.getInstance(IMediatorMap);
         this._K_z = this._A_A_.getInstance(_0oO_);
         if(this._A_A_._T_c(_01x))
         {
            this._X_f = this._A_A_.getInstance(_01x);
            this._X_f._kd(this._00D_ as _1O_N_);
         }
      }
      
      private function _1K_s() : void
      {
         var _loc1_:_1iK_ = this._A_A_.getInstance(_1iK_);
         _loc1_._sj();
         if(this._A_A_._T_c(_01x))
         {
            this._X_f = this._A_A_.getInstance(_01x);
            this._X_f._1__n(this._00D_ as _1O_N_);
         }
      }
      
      private function _0O_v() : void
      {
         if(this._A_A_._T_c(IMediatorMap))
         {
            this._A_A_._1kw(IMediatorMap);
         }
         if(this._A_A_._T_c(_1iK_))
         {
            this._A_A_._1kw(_1iK_);
         }
      }
   }
}
