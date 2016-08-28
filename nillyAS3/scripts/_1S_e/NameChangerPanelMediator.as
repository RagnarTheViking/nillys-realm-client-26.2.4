package _1S_e
{
   import _P_S_.Mediator;
   import _4u.Account;
   import _3b.DialogSignal;
   import _K_r._0J_h;
   import Frames._kW_;
   import _0J_8.NeedRegistrationDialog;
   import _C_._1O_I_;
   
   public class NameChangerPanelMediator extends Mediator
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var view:_1S_e.NameChangerPanel;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _X_l:_0J_h;
      
      public function NameChangerPanelMediator()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.chooseName.add(this._mB_);
         this._X_l.add(this._0Y_D_);
      }
      
      override public function destroy() : void
      {
         this.view.chooseName.remove(this._mB_);
         this._X_l.remove(this._0Y_D_);
      }
      
      private function _mB_() : void
      {
         if(this.account.registered())
         {
            this._06Z_.dispatch(new _kW_(this.view.gs_,this.view._1y5));
         }
         else
         {
            this._06Z_.dispatch(new NeedRegistrationDialog(_1O_I_._1H_3));
         }
      }
      
      private function _0Y_D_(param1:String) : void
      {
         this.view._0cY_(param1);
      }
   }
}
