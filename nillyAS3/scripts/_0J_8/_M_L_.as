package _0J_8
{
   import _P_S_.Mediator;
   import _m2._0S_X_;
   import _3b.CloseDialogsSignal;
   
   public class _M_L_ extends Mediator
   {
       
      
      [Inject]
      public var view:_0J_8.NeedRegistrationDialog;
      
      [Inject]
      public var _0yK_:_0S_X_;
      
      [Inject]
      public var close:CloseDialogsSignal;
      
      public function _M_L_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.cancel.add(this.onCancel);
         this.view.register.add(this._02T_);
      }
      
      override public function destroy() : void
      {
         this.view.cancel.remove(this.onCancel);
         this.view.register.remove(this._02T_);
      }
      
      private function _02T_() : void
      {
         this.onCancel();
         this._0yK_.dispatch();
      }
      
      private function onCancel() : void
      {
         this.close.dispatch();
      }
   }
}
