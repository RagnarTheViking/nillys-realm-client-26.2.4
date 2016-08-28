package _1R_9
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _4u.Account;
   import _1V_8._jw;
   import _18E_._N_O_;
   import _m2._W_O_;
   import _m2._0S_X_;
   import _0R_z._0v;
   import _m2._D_h;
   import _0R_z._14e;
   import _1dw.SteamAccountDetailDialog;
   import _1dw._0A_9;
   import _0J_8.RegisterWebAccountDialog;
   import _1dw._1G_O_;
   import _P_v._nQ_;
   import _0R_R_._1tP_;
   import _P_v._1V_6;
   import _P_v._0ex;
   import _0R_R_._1D_F_;
   import _P_v._X_k;
   import _0R_R_._0oQ_;
   import _P_v._1oG_;
   import _0R_R_._1F_2;
   import _P_v._0C_H_;
   
   public class _case implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      public function _case()
      {
         super();
      }
      
      public function configure() : void
      {
         this._0X_p();
         this._k();
         this._eP_();
         this._J_E_();
      }
      
      protected function _0X_p() : void
      {
         this._T_X_.map(Account)._015(_0Z_x);
         this._T_X_.map(_jw)._015(_N_O_);
         this._T_X_.map(_W_O_).asSingleton();
      }
      
      protected function _k() : void
      {
         this._1S_M_.map(_0S_X_).toCommand(_0v);
         this._1S_M_.map(_D_h).toCommand(_14e);
      }
      
      protected function _eP_() : void
      {
         this.mediatorMap.map(SteamAccountDetailDialog).toMediator(_0A_9);
         this.mediatorMap.map(RegisterWebAccountDialog).toMediator(_1G_O_);
      }
      
      protected function _J_E_() : void
      {
         this._T_X_.map(_J_m)._015(_nQ_);
         this._T_X_.map(_1tP_)._0L_2(_1V_6);
         this._T_X_.map(_0ex);
         this._T_X_.map(_1D_F_)._0L_2(_X_k);
         this._T_X_.map(_0oQ_)._0L_2(_1oG_);
         this._T_X_.map(_1F_2)._0L_2(_0C_H_);
      }
   }
}
