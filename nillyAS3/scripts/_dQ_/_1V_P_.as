package _dQ_
{
   import _1__8.IConfig;
   import _1__8._1Q_O_;
   import _wi.Injector;
   import _0f.IMediatorMap;
   import _V_y.ISignalCommandMap;
   import _2l.ClientSettings;
   import _0jo._1N_E_;
   import _0jo._hO_;
   import _0jo._r8;
   import _0jo._rJ_;
   import _ge._1M_O_;
   import com.company.assembleegameclient.game.__set;
   import _S_b._1K_S_;
   import _0jo._1E_1;
   import com.company.assembleegameclient.map._1mU_;
   import _jQ_.SocketServerModel;
   import _1S_e.GlobalArenaInformation;
   import _0Z_1.PortalPanel;
   import _1S_e._0O_h;
   import _0Z_1._1D_S_;
   import _E_o._O_K_;
   import _0Z_1._1K_b;
   import _E_o._1js;
   import _1O_n._zL_;
   import _E_o._1D_C_;
   import _1O_n._1S_u;
   import _E_o._N_C_;
   import _1H_T_._yF_;
   import _1H_T_._1xA_;
   import com.company.assembleegameclient.ui._1o2;
   import com.company.assembleegameclient.ui._Z_t;
   import _113.MapOverlay;
   import _1S_e._0iM_;
   import com.company.assembleegameclient.map.Map;
   import com.company.assembleegameclient.map._1R_5;
   import _18._1R_C_;
   import _18._1iS_;
   import _18._0I_h;
   import _18._0X_o;
   import _18._15m;
   import _18._0V_U_;
   import _1T_4._Q_G_;
   import _0A_T_._0B_8;
   import _0jo._0eZ_;
   import _0A_T_._0wf;
   import _0jo._1D_h;
   import _0A_T_.UseBuyPotionCommand;
   import _0jo._1Y_r;
   import _0A_T_._1nC_;
   import _0jo._1xX_;
   import _0A_T_._fI_;
   import _M_3._0lw;
   import _ge._v1;
   import _15G_._1ty;
   import _ge._pj;
   import _0jo._1aV_;
   import _0A_T_._085;
   import _1S_e.TextPanel;
   import _1S_e._0od;
   import _1S_e.GiftDisplay;
   import _1S_e._1rq;
   import com.company.assembleegameclient.game.GameSprite;
   import _1S_e._13w;
   import _1S_e.CurrencyDisplay;
   import _1S_e._1A_D_;
   import _1S_e.MoneyChangerPanel;
   import _1S_e._12j;
   import _1S_e.SellableObjectPanel;
   import _1S_e.SellableObjectPanelMediator;
   import _0da._07B_;
   import _0da._K_b;
   import _0da._0X_3;
   
   public class _1V_P_ implements IConfig
   {
       
      
      [Inject]
      public var context:_1Q_O_;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var mediatorMap:IMediatorMap;
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var setup:ClientSettings;
      
      public function _1V_P_()
      {
         super();
      }
      
      private function _B_m() : void
      {
         this._T_X_.map(_1N_E_).asSingleton();
         this._T_X_.map(_hO_).asSingleton();
         this._T_X_.map(_r8).asSingleton();
         this._T_X_.map(_rJ_).asSingleton();
         this._T_X_.map(_1M_O_).asSingleton();
         this._T_X_.map(__set).asSingleton();
         this._T_X_.map(_1K_S_).asSingleton();
         this._T_X_.map(_1E_1).asSingleton();
         this._T_X_.map(_1mU_).asSingleton();
         this._T_X_.map(SocketServerModel).asSingleton();
         this._T_X_.map(GlobalArenaInformation).asSingleton();
         this._9n();
         this._1E_8();
         this.mediatorMap.map(PortalPanel).toMediator(_0O_h);
         this.mediatorMap.map(_1D_S_).toMediator(_O_K_);
         this.mediatorMap.map(_1K_b).toMediator(_1js);
         this.mediatorMap.map(_zL_).toMediator(_1D_C_);
         this.mediatorMap.map(_1S_u).toMediator(_N_C_);
         this.mediatorMap.map(_yF_).toMediator(_1xA_);
         this.mediatorMap.map(_1o2).toMediator(_Z_t);
         this.mediatorMap.map(MapOverlay).toMediator(_0iM_);
         this.mediatorMap.map(Map).toMediator(_1R_5);
         this.mediatorMap.map(_1R_C_).toMediator(_1iS_);
         this.mediatorMap.map(_0I_h).toMediator(_0X_o);
         this.mediatorMap.map(_15m).toMediator(_0V_U_);
         this._1S_M_.map(_Q_G_).toCommand(_0B_8);
         this._1S_M_.map(_0eZ_).toCommand(_0wf);
         this._1S_M_.map(_1D_h).toCommand(UseBuyPotionCommand);
         this._1S_M_.map(_1Y_r).toCommand(_1nC_);
         this._1S_M_.map(_1xX_).toCommand(_fI_);
         this._1Y_C_();
      }
      
      public function configure() : void
      {
         this.context.configure(_0lw);
         this._T_X_.map(_v1).asSingleton();
         this._B_m();
         this.context.configure(_1ty);
      }
      
      private function _9n() : void
      {
         this._T_X_.map(_pj).asSingleton();
         this._1S_M_.map(_1aV_,true).toCommand(_085);
         this.mediatorMap.map(TextPanel).toMediator(_0od);
      }
      
      private function _1E_8() : void
      {
         this.mediatorMap.map(GiftDisplay).toMediator(_1rq);
         this.mediatorMap.map(GameSprite).toMediator(_13w);
         this.mediatorMap.map(CurrencyDisplay).toMediator(_1A_D_);
         this.mediatorMap.map(MoneyChangerPanel).toMediator(_12j);
         this.mediatorMap.map(SellableObjectPanel).toMediator(SellableObjectPanelMediator);
      }
      
      private function _1Y_C_() : void
      {
         if(this.setup._T_a())
         {
            this._T_X_.map(_07B_)._0L_2(_K_b);
         }
         else
         {
            this._T_X_.map(_07B_)._0L_2(_0X_3);
         }
      }
   }
}
