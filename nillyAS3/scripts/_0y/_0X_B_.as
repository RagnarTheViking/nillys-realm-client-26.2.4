package _0y
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _4u.Account;
   import _1V_8._jw;
   import _0O_c._0dr;
   import _m2._0S_X_;
   import _pX_._0fm;
   import _m2._y7;
   import _pX_._1E_v;
   import _m2._xU_;
   import _pX_._1V_W_;
   import _4w._1B_z;
   import _pX_._04v;
   import _m2._0dB_;
   import _pX_._14R_;
   import _m2._0U_b;
   import _pX_._package;
   import _m2._W_O_;
   import _pX_._X_3;
   import _0T_b._1fd;
   import _0T_b._1R_D_;
   import _0T_b.WebChangePasswordDialog;
   import _0T_b._0A_x;
   import _0T_b.WebForgotPasswordDialog;
   import _0T_b._18Y_;
   import _0T_b.WebAccountDetailDialog;
   import _0T_b._0dW_;
   import _0T_b._mb;
   import _0T_b._0W_Z_;
   import _0T_b.WebLoginDialog;
   import _0T_b._09G_;
   import _0T_b._0E___;
   import _0T_b._bk;
   import _0T_b._0cP_;
   import _0T_b._A_E_;
   import _0R_R_._1kH_;
   import _5c._hH_;
   import _0R_R_._1tP_;
   import _5c._180;
   import _0R_R_._1Q_g;
   import _5c._0p2;
   import _0R_R_._1D_F_;
   import _5c._cW_;
   import _0R_R_._0oQ_;
   import _5c._0z6;
   import _0R_R_._1F_2;
   import _5c._07N_;
   import _0R_R_._0K_S_;
   import _5c._12K_;
   import _0R_R_._o4;
   import _5c._1vY_;
   
   public class _0X_B_ implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      public function _0X_B_()
      {
         super();
      }
      
      public function configure() : void
      {
         this._0X_p();
         this._k();
         this._eP_();
         this._E_6();
      }
      
      protected function _0X_p() : void
      {
         this._T_X_.map(Account)._015(_0T_W_);
         this._T_X_.map(_jw)._015(_0dr);
      }
      
      protected function _k() : void
      {
         this._1S_M_.map(_0S_X_).toCommand(_0fm);
         this._1S_M_.map(_y7).toCommand(_1E_v);
         this._1S_M_.map(_xU_).toCommand(_1V_W_);
         this._1S_M_.map(_1B_z).toCommand(_04v);
         this._1S_M_.map(_0dB_).toCommand(_14R_);
         this._1S_M_.map(_0U_b).toCommand(_package);
         this._1S_M_.map(_W_O_).toCommand(_X_3);
      }
      
      protected function _eP_() : void
      {
         this.mediatorMap.map(_1fd).toMediator(_1R_D_);
         this.mediatorMap.map(WebChangePasswordDialog).toMediator(_0A_x);
         this.mediatorMap.map(WebForgotPasswordDialog).toMediator(_18Y_);
         this.mediatorMap.map(WebAccountDetailDialog).toMediator(_0dW_);
         this.mediatorMap.map(_mb).toMediator(_0W_Z_);
         this.mediatorMap.map(WebLoginDialog).toMediator(_09G_);
         this.mediatorMap.map(_0E___).toMediator(_bk);
         this.mediatorMap.map(_0cP_).toMediator(_A_E_);
      }
      
      protected function _E_6() : void
      {
         this._T_X_.map(_1kH_)._0L_2(_hH_);
         this._T_X_.map(_1tP_)._0L_2(_180);
         this._T_X_.map(_1Q_g)._0L_2(_0p2);
         this._T_X_.map(_1D_F_)._0L_2(_cW_);
         this._T_X_.map(_0oQ_)._0L_2(_0z6);
         this._T_X_.map(_1F_2)._0L_2(_07N_);
         this._T_X_.map(_0K_S_)._0L_2(_12K_);
         this._T_X_.map(_o4)._0L_2(_1vY_);
      }
   }
}
