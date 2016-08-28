package _T_E_
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _2l.ClientSettings;
   import _S_U_._1yd;
   import _K_r._0J_h;
   import _ge._I_I_;
   import _K_r._kn;
   import _K_r._15w;
   import _18._0as;
   import _05g._0O_3;
   import _18._0A_6;
   import _1jl._1fv;
   import com.company.assembleegameclient.objects._1D_v;
   import _K_r._eo;
   import _11G_._0T_R_;
   import _K_r._0F_j;
   import _11G_._1O_M_;
   import _K_r._1V_z;
   import _11G_._1dH_;
   import _K_r._09p;
   import _11G_._E_V_;
   import _W_Q_._0ag;
   import _05g._1jA_;
   import _W_Q_._S_2;
   import _05g._1Z_Q_;
   import _W_Q_._F_g;
   import _05g._0V_f;
   import _W_Q_.CharacterSelectionAndNewsScreen;
   import _05g.CharacterSelectionAndNewsScreenMediator;
   import _0J_8._0C_M_;
   import _0J_8._1X_y;
   import _W_Q_.TitleBasicAccountInfo;
   import _05g._0T_Z_;
   import _05g.TitleView;
   import _05g.TitleViewMediator;
   import _W_Q_._1R_U_;
   import _05g._1L_k;
   import _0S_w._rn;
   import _05g._1s6;
   import com.company.assembleegameclient.screens.charrects.CurrentCharacterRect;
   import _05g._1kD_;
   import com.company.assembleegameclient.screens.charrects.CharacterRectList;
   import _05g._1E_0;
   import _1O_R_.ErrorDialog;
   import _05g._152;
   import _W_Q_._oG_;
   import _05g._0S_h;
   import _05g.NotEnoughGoldDialog;
   import _05g._1U_X_;
   import _0Z_1._1K_b;
   import _E_o._1js;
   import _1S_e.TextPanel;
   import _1S_e._0od;
   import _1O_n._zL_;
   import _E_o._1D_C_;
   import _05g.ChooseNameRegisterDialog;
   import _05g._5e;
   import _05g._1X_G_;
   import _05g._ld;
   import _0J_8.NeedRegistrationDialog;
   import _0J_8._M_L_;
   import _05g.CharacterSlotNeedGoldDialog;
   import _05g._1kB_;
   import _1S_e.NameChangerPanel;
   import _1S_e.NameChangerPanelMediator;
   import _0Z_1.GuildRegisterPanel;
   import _E_o._0bg;
   import Frames._kW_;
   import Frames._k3;
   import Frames.CreateGuildFrame;
   import _K_t._1R_e;
   import Frames.NewChooseNameFrame;
   import Frames._hL_;
   import _Y_M_._02U_;
   import _05g.AgeVerificationDialog;
   import _05g._0C_5;
   import _0h3._4i;
   import _0h3._0sS_;
   import _0Z_1.ArenaPortalPanel;
   import _E_o._0A_z;
   import _05g._0F_q;
   import _05g._0l4;
   import _05g.UserHud;
   import _05g._1cr;
   import _ju._0j1;
   import _ju._xs;
   import _w1.ResurrectionView;
   import _w1._ye;
   import _0bE_._1Y_;
   import _0mL_._d1;
   import _05g._02n;
   import _0mL_._13a;
   import _0R_R_._1tP_;
   import _0R_R_._1uC_;
   import _0R_R_.GetServerXmls;
   import _0R_R_.GetTextures;
   import _0H_6.GameContext;
   import _K_r._1C_w;
   import _K_r._1x1;
   import _K_r._1ep;
   import _11G_._0Q_h;
   import _K_r._01k;
   import _11G_._0h9;
   import _05g._L_D_;
   import _05g._0pv;
   import _uO_._0N_w;
   import _uO_.ProductionNoServersDialogFactory;
   import _uO_._0X_U_;
   import _S_b._O_e;
   import _K_r._1V_v;
   import _K_r._yK_;
   import _K_r._17H_;
   import _11G_._1kY_;
   import _05g.CharacterDetailsView;
   import _05g._1ic;
   
   public class _wF_ implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var setup:ClientSettings;
      
      [Inject]
      public var startup:_1yd;
      
      public function _wF_()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_0J_h).asSingleton();
         this._T_X_.map(_I_I_).asSingleton();
         this._T_X_.map(_kn).asSingleton();
         this._T_X_.map(_15w).asSingleton();
         this._T_X_.map(_0as).asSingleton();
         this._T_X_.map(_0O_3).asSingleton();
         this._T_X_.map(_0A_6).asSingleton();
         this._T_X_.map(_1fv).asSingleton();
         this._T_X_.map(_1D_v).asSingleton();
         this._1S_M_.map(_eo).toCommand(_0T_R_);
         this._1S_M_.map(_0F_j).toCommand(_1O_M_);
         this._1S_M_.map(_1V_z).toCommand(_1dH_);
         this._1S_M_.map(_09p).toCommand(_E_V_);
         this.mediatorMap.map(_0ag).toMediator(_1jA_);
         this.mediatorMap.map(_S_2).toMediator(_1Z_Q_);
         this.mediatorMap.map(_F_g).toMediator(_0V_f);
         this.mediatorMap.map(CharacterSelectionAndNewsScreen).toMediator(CharacterSelectionAndNewsScreenMediator);
         this.mediatorMap.map(_0C_M_).toMediator(_1X_y);
         this.mediatorMap.map(TitleBasicAccountInfo).toMediator(_0T_Z_);
         this.mediatorMap.map(TitleView).toMediator(TitleViewMediator);
         this.mediatorMap.map(_1R_U_).toMediator(_1L_k);
         this.mediatorMap.map(_rn).toMediator(_1s6);
         this.mediatorMap.map(CurrentCharacterRect).toMediator(_1kD_);
         this.mediatorMap.map(CharacterRectList).toMediator(_1E_0);
         this.mediatorMap.map(ErrorDialog).toMediator(_152);
         this.mediatorMap.map(_oG_).toMediator(_0S_h);
         this.mediatorMap.map(NotEnoughGoldDialog).toMediator(_1U_X_);
         this.mediatorMap.map(_1K_b).toMediator(_1js);
         this.mediatorMap.map(TextPanel).toMediator(_0od);
         this.mediatorMap.map(_zL_).toMediator(_1D_C_);
         this.mediatorMap.map(ChooseNameRegisterDialog).toMediator(_5e);
         this.mediatorMap.map(_1X_G_).toMediator(_ld);
         this.mediatorMap.map(NeedRegistrationDialog).toMediator(_M_L_);
         this.mediatorMap.map(CharacterSlotNeedGoldDialog).toMediator(_1kB_);
         this.mediatorMap.map(NameChangerPanel).toMediator(NameChangerPanelMediator);
         this.mediatorMap.map(GuildRegisterPanel).toMediator(_0bg);
         this.mediatorMap.map(_kW_).toMediator(_k3);
         this.mediatorMap.map(CreateGuildFrame).toMediator(_1R_e);
         this.mediatorMap.map(NewChooseNameFrame).toMediator(_hL_);
         this.mediatorMap.map(_02U_).toMediator(_Z_);
         this.mediatorMap.map(AgeVerificationDialog).toMediator(_0C_5);
         this.mediatorMap.map(_4i).toMediator(_0sS_);
         this.mediatorMap.map(ArenaPortalPanel).toMediator(_0A_z);
         this.mediatorMap.map(_0F_q).toMediator(_0l4);
         this.mediatorMap.map(UserHud).toMediator(_1cr);
         this.mediatorMap.map(_0j1).toMediator(_xs);
         this.mediatorMap.map(ResurrectionView).toMediator(_ye);
         this.mediatorMap.map(_1Y_).toMediator(_d1);
         this.mediatorMap.map(_02n).toMediator(_13a);
         this._2__9();
         this._1E_P_();
         this._b3();
         this.startup._T_y(_eo,-1);
         this.startup._1rF_(_1tP_);
         this.startup._1rF_(_1uC_);
         if(WebMain.pserver)
         {
            this.startup._1rF_(GetServerXmls);
            if(WebMain.requestTextures && !this._0s3())
            {
               this.startup._1rF_(GetTextures);
            }
         }
         this.startup._T_y(_0F_j,_1yd._A_K_);
      }
      
      private function _0s3() : Boolean
      {
         var _loc1_:ClientSettings = GameContext.getInjector().getInstance(ClientSettings);
         return _loc1_.UsesRemoteTextures();
      }
      
      private function _2__9() : void
      {
         this._T_X_.map(_1C_w)._1as(new _1C_w());
         this._T_X_.map(_1x1)._1as(new _1x1());
         this._1S_M_.map(_1ep).toCommand(_0Q_h);
         this._1S_M_.map(_01k).toCommand(_0h9);
         this.mediatorMap.map(_L_D_).toMediator(_0pv);
      }
      
      private function _1E_P_() : void
      {
         if(this.setup._1xr())
         {
            this._T_X_.map(_0N_w)._015(ProductionNoServersDialogFactory);
         }
         else
         {
            this._T_X_.map(_0N_w)._015(_0X_U_);
         }
      }
      
      private function _b3() : void
      {
         this._T_X_.map(_O_e).asSingleton();
         this._T_X_.map(_1V_v).asSingleton();
         this._T_X_.map(_yK_).asSingleton();
         this._1S_M_.map(_17H_).toCommand(_1kY_);
         this.mediatorMap.map(CharacterDetailsView).toMediator(_1ic);
      }
   }
}
