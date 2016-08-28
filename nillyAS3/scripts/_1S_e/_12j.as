package _1S_e
{
   import _P_S_.Mediator;
   import _4u.Account;
   import _3b.DialogSignal;
   import _m2._27;
   import _0J_8.NeedRegistrationDialog;
   import _C_._1O_I_;
   
   public class _12j extends Mediator
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var view:_1S_e.MoneyChangerPanel;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _1sl:_27;
      
      public function _12j()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._sp.add(this._16w);
      }
      
      override public function destroy() : void
      {
         this.view._sp.remove(this._16w);
      }
      
      private function _16w() : void
      {
         if(this.account.registered())
         {
            this._1sl.dispatch();
         }
         else
         {
            this._06Z_.dispatch(new NeedRegistrationDialog(_1O_I_._1bl));
         }
      }
   }
}
