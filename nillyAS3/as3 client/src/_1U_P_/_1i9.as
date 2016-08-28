package _1U_P_
{
   import _P_S_.Mediator;
   import _3b.CloseDialogsSignal;
   import _jQ_.SocketServer;
   import _0wP_.MessageProvider;
   import _S_b._O_e;
   import _04h._1Q_v;
   import _ge._v1;
   import _0nP_._G_N_;
   import _m2._27;
   import _1M_z.EnterArena;
   import Packets.PacketManagerBase;
   
   public class _1i9 extends Mediator
   {
       
      
      [Inject]
      public var view:_1U_P_.ContinueOrQuitDialog;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var _wG_:SocketServer;
      
      [Inject]
      public var _1S_W_:MessageProvider;
      
      [Inject]
      public var _1tf:_O_e;
      
      [Inject]
      public var _1A_A_:_1Q_v;
      
      [Inject]
      public var _R_U_:_v1;
      
      [Inject]
      public var _Q_2:_G_N_;
      
      [Inject]
      public var _1sl:_27;
      
      public function _1i9()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._Q_2.add(this._0I_m);
         this.view.quit.add(this._0Q_U_);
         this.view._0F_W_.add(this._61);
         this.view.init(this._1A_A_._0P_9.arenaWave,this._R_U_.player.credits_);
      }
      
      private function _0I_m() : void
      {
         this.view._0bC_(false);
      }
      
      override public function destroy() : void
      {
         this._Q_2.remove(this._0I_m);
         this.view.quit.remove(this._0Q_U_);
         this.view._0F_W_.remove(this._61);
         this.view.destroy();
      }
      
      private function _61(param1:int, param2:int) : void
      {
         var _loc3_:EnterArena = null;
         if(this._R_U_.player.credits_ >= param2)
         {
            this.closeDialogs.dispatch();
            _loc3_ = this._1S_W_.require(PacketManagerBase.ENTERARENA) as EnterArena;
            _loc3_.currency = param1;
            this._wG_.queueMessage(_loc3_);
         }
         else
         {
            this.view._0bC_(true);
            this._1sl.dispatch();
         }
      }
      
      private function _0Q_U_() : void
      {
         this.closeDialogs.dispatch();
         this._1tf._14O_.gsc_.escape();
      }
   }
}
