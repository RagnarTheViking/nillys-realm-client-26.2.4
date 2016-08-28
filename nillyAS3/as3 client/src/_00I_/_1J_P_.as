package _00I_
{
   import _P_S_.Mediator;
   import _4u.Account;
   import _3b.CloseDialogsSignal;
   
   public class _1J_P_ extends Mediator
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var view:_00I_.KabamAccountDetailDialog;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      public function _1J_P_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._06H_.add(this._11L_);
         this.view._G_z(this.account._1yb());
      }
      
      override public function destroy() : void
      {
         this.view._06H_.remove(this._11L_);
      }
      
      private function _11L_() : void
      {
         this._0dR_.dispatch();
      }
   }
}
