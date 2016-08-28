package _y0
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _4u.Account;
   import _0C_2._17f;
   import _1V_8._jw;
   import _0Y_H_._Y_k;
   import _m2._W_O_;
   import _m2._0S_X_;
   import _dM_._pH_;
   import _m2._D_h;
   import _dM_._01l;
   import _0U_p._0T_r;
   import _dM_._17b;
   import _0U_p._09S_;
   import _dM_._Z_Z_;
   import _0u4.KongregateAccountInfoView;
   import _0u4._1qq;
   import _0u4.KongregateAccountDetailDialog;
   import _0u4._V_g;
   import _0J_8.RegisterWebAccountDialog;
   import _0u4._1R_u;
   import _0u4._0us;
   import _0u4._ow;
   import _0R_R_._1tP_;
   import _0C_2._1xq;
   import _0C_2._V_F_;
   import _0R_R_._1Q_g;
   import _0C_2._02c;
   import _0R_R_._47;
   import _0C_2._59;
   import _0R_R_._1D_F_;
   import _0C_2._1T_N_;
   import _0R_R_._0oQ_;
   import _0C_2._19T_;
   import _0R_R_._1F_2;
   import _0C_2._1wu;
   
   public class _0O_8 implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      public function _0O_8()
      {
         super();
      }
      
      public function configure() : void
      {
         this._0X_p();
         this._k();
         this._J_E_();
         this._eP_();
      }
      
      protected function _0X_p() : void
      {
         this._T_X_.map(Account)._015(Kong);
         this._T_X_.map(_17f).asSingleton();
         this._T_X_.map(_jw)._015(_Y_k);
         this._T_X_.map(_W_O_).asSingleton();
      }
      
      protected function _k() : void
      {
         this._1S_M_.map(_0S_X_).toCommand(_pH_);
         this._1S_M_.map(_D_h).toCommand(_01l);
         this._1S_M_.map(_0T_r).toCommand(_17b);
         this._1S_M_.map(_09S_).toCommand(_Z_Z_);
      }
      
      protected function _eP_() : void
      {
         this.mediatorMap.map(KongregateAccountInfoView).toMediator(_1qq);
         this.mediatorMap.map(KongregateAccountDetailDialog).toMediator(_V_g);
         this.mediatorMap.map(RegisterWebAccountDialog).toMediator(_1R_u);
      }
      
      protected function _J_E_() : void
      {
         this._T_X_.map(_0us)._015(_ow);
         this._T_X_.map(_1tP_)._0L_2(_1xq);
         this._T_X_.map(_V_F_);
         this._T_X_.map(_1Q_g)._0L_2(_02c);
         this._T_X_.map(_47)._0L_2(_59);
         this._T_X_.map(_1D_F_)._0L_2(_1T_N_);
         this._T_X_.map(_0oQ_)._0L_2(_19T_);
         this._T_X_.map(_1F_2)._0L_2(_1wu);
      }
   }
}
