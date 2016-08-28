package _1V_w
{
   import _1__8._01s;
   import _1I_2._O_g;
   import _wi.Injector;
   import _1J_2._01x;
   import _1__8._1Q_O_;
   import _1I_2._1Q_l;
   import _I_w._0S_m;
   
   public class _0Z_L_ implements _01s
   {
      
      private static var _1F_c:_O_g;
       
      
      private const _0yi:String = _0S_m.create(_0Z_L_);
      
      private var _A_A_:Injector;
      
      private var _X_f:_01x;
      
      public function _0Z_L_()
      {
         super();
      }
      
      public function extend(param1:_1Q_O_) : void
      {
         this._A_A_ = param1._T_X_;
         _1F_c = _1F_c || new _O_g();
         this._A_A_.map(_O_g)._1as(_1F_c);
         this._A_A_.map(_01x)._015(_1Q_l);
         param1._1za._15q(this._15q);
         param1._1za._0O_v(this._0O_v);
      }
      
      public function toString() : String
      {
         return this._0yi;
      }
      
      private function _15q() : void
      {
         this._X_f = this._A_A_.getInstance(_01x);
      }
      
      private function _0O_v() : void
      {
         this._X_f._2a();
         this._A_A_._1kw(_01x);
         this._A_A_._1kw(_O_g);
      }
   }
}
