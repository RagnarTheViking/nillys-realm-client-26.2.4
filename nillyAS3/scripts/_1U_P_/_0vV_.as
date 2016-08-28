package _1U_P_
{
   import _P_S_.Mediator;
   import _3b.DialogSignal;
   import _1F_z._0P_4;
   import _4u.Account;
   import flash.events.MouseEvent;
   
   public class _0vV_ extends Mediator
   {
       
      
      [Inject]
      public var view:_1U_P_.ArenaQueryPanel;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _06I_:_0P_4;
      
      [Inject]
      public var account:Account;
      
      public function _0vV_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._Z_7();
      }
      
      private function _Z_7() : void
      {
         if(this.view._11d)
         {
            this.view._11d.addEventListener(MouseEvent.CLICK,this._0my);
            this.view._0R_w.addEventListener(MouseEvent.CLICK,this._ln);
         }
         else
         {
            this.view._0R_w.addEventListener(MouseEvent.CLICK,this._ln);
         }
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
      
      protected function _ln(param1:MouseEvent) : void
      {
         this._06Z_.dispatch(new _eO_());
      }
      
      protected function _0my(param1:MouseEvent) : void
      {
         this._06Z_.dispatch(new ArenaLeaderboard());
      }
   }
}
