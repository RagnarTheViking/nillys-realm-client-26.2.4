package _1N_W_
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _04a._0L___;
   import _04a._gi;
   import _4u.Account;
   import _1V_8._jw;
   import _04a._13__;
   import _m2._W_O_;
   import _m2._0S_X_;
   import _hs._1T_K_;
   import _00I_.KabamAccountDetailDialog;
   import _00I_._1J_P_;
   import _00I_._0B_g;
   import _00I_._js;
   import _0R_R_._1D_F_;
   import _5c._cW_;
   import _0R_R_._1tP_;
   import _P_R_._1z7;
   import _0R_R_._0oQ_;
   import _5c._0z6;
   
   public class _0W_j implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      public function _0W_j()
      {
         super();
      }
      
      public function configure() : void
      {
         this._A_O_();
         this._k();
         this._eP_();
         this._J_E_();
      }
      
      protected function _A_O_() : void
      {
         this._T_X_.map(_0L___)._015(_gi);
         this._T_X_.map(Account)._015(_0D_Q_);
         this._T_X_.map(_jw)._015(_13__);
         this._T_X_.map(_W_O_).asSingleton();
      }
      
      private function _k() : void
      {
         this._1S_M_.map(_0S_X_).toCommand(_1T_K_);
      }
      
      protected function _eP_() : void
      {
         this.mediatorMap.map(KabamAccountDetailDialog).toMediator(_1J_P_);
         this.mediatorMap.map(_0B_g).toMediator(_js);
      }
      
      protected function _J_E_() : void
      {
         this._T_X_.map(_1D_F_)._0L_2(_cW_);
         this._T_X_.map(_1tP_)._0L_2(_1z7);
         this._T_X_.map(_0oQ_)._0L_2(_0z6);
      }
   }
}
