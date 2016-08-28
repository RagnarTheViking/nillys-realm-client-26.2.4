package _05g
{
   import _P_S_.Mediator;
   import _4u.Account;
   import _0R_R_._0T_p;
   import _3b.CloseDialogsSignal;
   import _m2._27;
   
   public class _1U_X_ extends Mediator
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _U_I_:_0T_p;
      
      [Inject]
      public var view:_05g.NotEnoughGoldDialog;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var _1sl:_27;
      
      public function _1U_X_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._U_I_.start();
         this.view._1S_H_.add(this._0T_6);
         this.view.cancel.add(this.onCancel);
      }
      
      override public function destroy() : void
      {
         this.view._1S_H_.remove(this._0T_6);
         this.view.cancel.remove(this.onCancel);
      }
      
      public function onCancel() : void
      {
         this.closeDialogs.dispatch();
      }
      
      public function _0T_6() : void
      {
         this._1sl.dispatch();
      }
   }
}
