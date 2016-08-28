package _yv
{
   import _1__8.IConfig;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _1kz.ICommandCenter;
   import _0l7._1O_Z_;
   import _1F_z._0P_4;
   import _0l7._15g;
   import _0xn._1uk;
   import _1F_z._07p;
   import _0l7._1ba;
   import _0xn._14N_;
   import _1__H_._0jK_;
   import _1__H_._0f4;
   import _1__H_._1O_8;
   import _1__H_._0fM_;
   import _1__H_._0vs;
   import _1__H_._0gG_;
   import _17B_._F_r;
   import _17B_._1Q_0;
   import _1oP_.PetPanel;
   import _17B_._1sh;
   import _17B_._1X_A_;
   import _17B_._1F_9;
   import _17B_._0Q_e;
   import _17B_._0Q_g;
   import Market.MarketNPCPanel;
   import Market.MarketNPCPanelMediator;
   import _P_N_.PetPicker;
   import _P_N_._1V_;
   import _17B_.PetFeeder;
   import _17B_._1lM_;
   import _17B_.PetFuser;
   import _17B_._0t3;
   import _17B_.XImageButton;
   import _17B_._fQ_;
   import _17B_._18A_;
   import _17B_._L_P_;
   import _17B_._02G_;
   import _17B_._K_F_;
   import _1__H_.YardUpgraderView;
   import _1__H_._0__7;
   import _P_N_.CaretakerQueryDialog;
   import _1__H_._U_v;
   import Market.InfoDialog;
   import Market.InfoDialogEvents;
   import _17B_.FusionStrength;
   import _17B_._09y;
   import _P_N_._0at;
   import _P_N_._0__V_;
   import _P_N_._0jy;
   import _P_N_._72;
   import _1O_R_._1uu;
   import _1O_R_._0e8;
   import _P_N_._1ay;
   import _1__H_._0P_s;
   import _0l7._I_J_;
   import _0l7._45;
   import _0l7._L_z;
   import _0l7._0H_s;
   import _0l7._0G_y;
   import _0l7._9H_;
   import _0l7._1Y_f;
   import _0l7._1bk;
   import _0l7._O_B_;
   import _0l7._1vu;
   import _0l7._0N_j;
   import _0l7._3f;
   import _0l7._Y_U_;
   import _0l7._5O_;
   import _0l7._1nt;
   import _0l7._1ez;
   import _0l7._04I_;
   import _0l7._1D_L_;
   import _0l7._0vW_;
   import _0l7._ji;
   import _0l7._kb;
   import _0l7._1O_C_;
   import _1oP_._9L_;
   import _0l7._0Y_9;
   
   public class _0bW_ implements IConfig
   {
       
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var commandCenter:ICommandCenter;
      
      public function _0bW_()
      {
         super();
      }
      
      public function configure() : void
      {
         this._T_X_.map(_1O_Z_).asSingleton();
         this._T_X_.map(_0P_4).asSingleton();
         this._T_X_.map(_15g).asSingleton();
         this._T_X_.map(_1uk).asSingleton();
         this._T_X_.map(_07p).asSingleton();
         this._T_X_.map(_1ba).asSingleton();
         this._T_X_.map(_14N_).asSingleton();
         this.mediatorMap.map(_0jK_).toMediator(_0f4);
         this.mediatorMap.map(_1O_8).toMediator(_0fM_);
         this.mediatorMap.map(_0vs).toMediator(_0gG_);
         this.mediatorMap.map(_0vs).toMediator(_0gG_);
         this.mediatorMap.map(_F_r).toMediator(_1Q_0);
         this.mediatorMap.map(PetPanel).toMediator(_1sh);
         this.mediatorMap.map(_1X_A_).toMediator(_1F_9);
         this.mediatorMap.map(_0Q_e).toMediator(_0Q_g);
         this.mediatorMap.map(MarketNPCPanel).toMediator(MarketNPCPanelMediator);
         this.mediatorMap.map(PetPicker).toMediator(_1V_);
         this.mediatorMap.map(PetFeeder).toMediator(_1lM_);
         this.mediatorMap.map(PetFuser).toMediator(_0t3);
         this.mediatorMap.map(XImageButton).toMediator(_fQ_);
         this.mediatorMap.map(_18A_).toMediator(_L_P_);
         this.mediatorMap.map(_02G_).toMediator(_K_F_);
         this.mediatorMap.map(YardUpgraderView).toMediator(_0__7);
         this.mediatorMap.map(CaretakerQueryDialog).toMediator(_U_v);
         this.mediatorMap.map(InfoDialog).toMediator(InfoDialogEvents);
         this.mediatorMap.map(FusionStrength).toMediator(_09y);
         this.mediatorMap.map(_0at).toMediator(_0__V_);
         this.mediatorMap.map(_0jy).toMediator(_72);
         this.mediatorMap.map(_1uu).toMediator(_0e8);
         this.mediatorMap.map(_1ay).toMediator(_0P_s);
         this._1S_M_.map(_I_J_).toCommand(_45);
         this._1S_M_.map(_L_z).toCommand(_0H_s);
         this._1S_M_.map(_0G_y).toCommand(_9H_);
         this._1S_M_.map(_1Y_f).toCommand(_1bk);
         this._1S_M_.map(_O_B_).toCommand(_1vu);
         this._1S_M_.map(_0N_j).toCommand(_3f);
         this._1S_M_.map(_Y_U_).toCommand(_5O_);
         this._1S_M_.map(_1nt).toCommand(_1ez);
         this._1S_M_.map(_04I_).toCommand(_1D_L_);
         this._1S_M_.map(_0vW_).toCommand(_ji);
         this._1S_M_.map(_kb).toCommand(_1O_C_);
         this._1S_M_.map(_9L_).toCommand(_0Y_9);
         this._T_X_.getInstance(_0N_j).dispatch();
      }
   }
}
