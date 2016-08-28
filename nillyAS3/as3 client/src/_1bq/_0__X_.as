package _1bq
{
   import _1__8._1Q_O_;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _1cV_.Console;
   import _0sm._17m;
   import _0sm._bK_;
   import _0sm._0sX_;
   import _0sm._qE_;
   import _0sm._0H_i;
   import _1O___._1cO_;
   import _0sm._00n;
   import _1O___._0ms;
   import _0sm._1E___;
   import _1O___._0N_S_;
   import _0sm._S___;
   import _0sm._L_N_;
   import _0sm._1br;
   import _0sm._tp;
   import _0sm._1P_X_;
   import _R_o._0J_y;
   import _R_o._1eJ_;
   import _R_o._01Y_;
   import _R_o._0xm;
   import _R_o._U_V_;
   import _R_o._0fB_;
   import _R_o._1G_y;
   import _uL_._03X_;
   import _0E_n._jE_;
   
   public class _0__X_
   {
       
      
      [Inject]
      public var context:_1Q_O_;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      public function _0__X_()
      {
         super();
      }
      
      [PostConstruct]
      public function setup() : void
      {
         this._0X_p();
         this._k();
         this._1L_C_();
         this._eP_();
         this.context._1za._1dl(this.init);
      }
      
      private function _0X_p() : void
      {
         this._T_X_.map(Console).asSingleton();
         this._T_X_.map(_17m).asSingleton();
         this._T_X_.map(_bK_).asSingleton();
         this._T_X_.map(_0sX_).asSingleton();
         this._T_X_.map(_qE_).asSingleton();
      }
      
      private function _k() : void
      {
         this._1S_M_.map(_0H_i).toCommand(_1cO_);
         this._1S_M_.map(_00n).toCommand(_0ms);
         this._1S_M_.map(_1E___).toCommand(_0N_S_);
      }
      
      private function _1L_C_() : void
      {
         this._T_X_.map(_S___).asSingleton();
         this._T_X_.map(_L_N_).asSingleton();
         this._T_X_.map(_1br).asSingleton();
         this._T_X_.map(_tp).asSingleton();
         this._T_X_.map(_1P_X_).asSingleton();
      }
      
      private function _eP_() : void
      {
         this.mediatorMap.map(_0J_y).toMediator(_1eJ_);
         this.mediatorMap.map(_01Y_).toMediator(_0xm);
         this.mediatorMap.map(_U_V_).toMediator(_0fB_);
         this.mediatorMap.map(_U_V_).toMediator(_1G_y);
      }
      
      private function init() : void
      {
         this.context._1T_1(new _03X_(this.context));
         this._T_X_.getInstance(_1E___).dispatch();
         var _loc1_:_jE_ = this.context._T_X_.getInstance(_jE_);
         _loc1_.console.addChild(new _U_V_());
      }
   }
}
