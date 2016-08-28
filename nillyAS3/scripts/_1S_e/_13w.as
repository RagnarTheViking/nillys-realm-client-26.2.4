package _1S_e
{
   import _P_S_.Mediator;
   import flash.utils.getTimer;
   import com.company.assembleegameclient.game.GameSprite;
   import _0jo._hO_;
   import _1T_4._kc;
   import _1T_4._1U_z;
   import _1T_4._0es;
   import _0jo._1xX_;
   import _v4.Client;
   import _0jo._1Y_r;
   import _v4._f0;
   import _Z_U_._117;
   import _3b.CloseDialogsSignal;
   import _0da._07B_;
   import _K_r._17H_;
   import _K_r._1V_v;
   import _K_r._yK_;
   import _1T_4._0V_s;
   import _0pn._W_k;
   import _0pn._gF_;
   import _0pn._co;
   import _0b6._I_A_;
   import _1y1._al;
   import _0pn._1R_l;
   import _0l7._1O_Z_;
   import _0Z_d._0wS_;
   import _1E_7._0zq;
   import _1iT_._0K_U_;
   import _166.Package;
   import _0H_6.GameContext;
   import _0Z_d._ee;
   import _ge._1R_J_;
   import com.company.assembleegameclient.objects.Player;
   
   public class _13w extends Mediator
   {
       
      
      [Inject]
      public var view:GameSprite;
      
      [Inject]
      public var _1R_c:_hO_;
      
      [Inject]
      public var _11v:_kc;
      
      [Inject]
      public var _0rh:_1U_z;
      
      [Inject]
      public var _kU_:_0es;
      
      [Inject]
      public var _1M_n:_1xX_;
      
      [Inject]
      public var _0U_H_:Client;
      
      [Inject]
      public var _0R_S_:_1Y_r;
      
      [Inject]
      public var _0X_p:_f0;
      
      [Inject]
      public var _19F_:_117;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var _0rU_:_07B_;
      
      [Inject]
      public var _0lD_:_17H_;
      
      [Inject]
      public var _0dy:_1V_v;
      
      [Inject]
      public var _a__:_yK_;
      
      [Inject]
      public var _0ha:_0V_s;
      
      [Inject]
      public var _1gS_:_W_k;
      
      [Inject]
      public var _0B_G_:_gF_;
      
      [Inject]
      public var _0A_M_:_co;
      
      [Inject]
      public var _yM_:_I_A_;
      
      [Inject]
      public var _F_D_:_al;
      
      [Inject]
      public var _0H_H_:_1R_l;
      
      [Inject]
      public var _aD_:_1O_Z_;
      
      [Inject]
      public var _1x7:_0wS_;
      
      [Inject]
      public var _00q:_0zq;
      
      public function _13w()
      {
         super();
      }
      
      public static function _0fF_(param1:int) : void
      {
         var _loc2_:int = getTimer();
         while(getTimer() - _loc2_ < param1)
         {
         }
      }
      
      override public function initialize() : void
      {
         this._1x7.dispatch();
         this.view._F_D_ = this._F_D_;
         this._1R_c.add(this._R_K_);
         _1hQ_(_0K_U_.RECONNECT,this._1V_Z_);
         this.view._0J_7.add(this._F_k);
         this.view._11X_.add(this._4x);
         this._a__.add(this._09Z_);
         this._aD_.add(this._I_9);
         this.view._0rU_.add(this._0L_9);
         this.view.closed.add(this._qN_);
         this.view._0X_p = this._0X_p;
         this.view._19F_ = this._19F_;
         this.view.connect();
         this._0ha.dispatch("/gameStarted");
         this.view._yM_ = this._yM_;
         this.view._1m8.add(this._rC_);
         this._00q.add(this._0va);
      }
      
      private function _rC_() : void
      {
         var _loc1_:Package = this._F_D_._K_W_();
         if(_loc1_)
         {
            this._0H_H_.dispatch(_loc1_.packageID);
         }
      }
      
      override public function destroy() : void
      {
         this.view._1m8.remove(this._rC_);
         this._1R_c.remove(this._R_K_);
         _1y7(_0K_U_.RECONNECT,this._1V_Z_);
         this.view._0J_7.remove(this._F_k);
         this.view._11X_.remove(this._4x);
         this._a__.remove(this._09Z_);
         this._1gS_.remove(this._0g7);
         this._0B_G_.remove(this._00H_);
         this.view.closed.remove(this._qN_);
         this.view._0rU_.remove(this._0L_9);
         this._00q.remove(this._0va);
         this.view.disconnect();
      }
      
      private function _0L_9(param1:String, param2:int) : void
      {
         this._0rU_._0I_Q_(param1,param2);
      }
      
      public function _R_K_(param1:Boolean) : void
      {
         this.view.mui_.setEnablePlayerInput(param1);
      }
      
      private function _0g7() : void
      {
         this.view._13Z_();
      }
      
      private function _00H_() : void
      {
         this.view._18g();
      }
      
      private function _qN_() : void
      {
         this._0R_S_.dispatch();
         this.closeDialogs.dispatch();
         var _loc1_:_ee = GameContext.getInjector().getInstance(_ee);
         _loc1_.dispatch();
         _0fF_(100);
      }
      
      private function _1V_Z_(param1:_0K_U_) : void
      {
         if(this.view.isEditor)
         {
            return;
         }
         var _loc2_:_1R_J_ = new _1R_J_();
         _loc2_.server = param1.server_;
         _loc2_.gameId = param1.gameId_;
         _loc2_._1F_H_ = param1._S_a;
         _loc2_.charId = param1.charId_;
         _loc2_._B_o = param1.keyTime_;
         _loc2_.key = param1.key_;
         _loc2_._10h = param1.isFromArena_;
         this._1M_n.dispatch(_loc2_);
      }
      
      private function _F_k() : void
      {
         this._0lD_.dispatch(this.view);
         this._1gS_.add(this._0g7);
         this._0B_G_.add(this._00H_);
         this._0A_M_.dispatch();
      }
      
      private function _4x(param1:Player) : void
      {
         this._0dy.dispatch(param1);
      }
      
      private function _09Z_() : void
      {
         this.view._a__();
      }
      
      private function _I_9(param1:Boolean) : void
      {
         this.view._0K_D_(param1);
      }
      
      private function _0va() : void
      {
         this.view._Q_S_();
      }
   }
}
