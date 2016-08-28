package _1S_e
{
   import _P_S_.Mediator;
   import _113.MapOverlay;
   import _0jo._rJ_;
   import _ge._1M_O_;
   import _4u.Account;
   import _ge._1bc;
   import _113._lz;
   
   public class _0iM_ extends Mediator
   {
       
      
      [Inject]
      public var view:MapOverlay;
      
      [Inject]
      public var addSpeechBalloon:_rJ_;
      
      [Inject]
      public var _1n8:_1M_O_;
      
      [Inject]
      public var account:Account;
      
      public function _0iM_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.addSpeechBalloon.add(this._0L_A_);
      }
      
      override public function destroy() : void
      {
         this.addSpeechBalloon.remove(this._0L_A_);
      }
      
      private function _0L_A_(param1:_1bc) : void
      {
         var _loc2_:String = this.account.registered() || this._1n8._C_u(param1.go.name_)?param1.text:". . .";
         this.view.addSpeechBalloon(new _lz(param1.go,_loc2_,param1.background,param1._0vc,param1._1U_M_,param1._S_6,param1.textColor,param1._T_v,param1.bold,param1._pG_));
      }
   }
}
