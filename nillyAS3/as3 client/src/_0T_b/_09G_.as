package _0T_b
{
   import _P_S_.Mediator;
   import _m2._y7;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import _1T_4._34;
   import _0O_c._H_0;
   import _0pN_._1nd;
   
   public class _09G_ extends Mediator
   {
       
      
      [Inject]
      public var view:_0T_b.WebLoginDialog;
      
      [Inject]
      public var login:_y7;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      [Inject]
      public var _0F_n:_34;
      
      public function _09G_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.signIn.add(this._1ut);
         this.view.register.add(this._02T_);
         this.view.cancel.add(this.onCancel);
         this.view.forgot.add(this._P_f);
         this._0F_n.add(this.__true);
      }
      
      override public function destroy() : void
      {
         this.view.signIn.remove(this._1ut);
         this.view.register.remove(this._02T_);
         this.view.cancel.remove(this.onCancel);
         this.view.forgot.remove(this._P_f);
         this._0F_n.remove(this.__true);
      }
      
      private function _1ut(param1:_H_0) : void
      {
         this.view.disable();
         this.login.dispatch(param1);
      }
      
      private function _02T_() : void
      {
         this._06Z_.dispatch(new _mb());
      }
      
      private function onCancel() : void
      {
         this._0dR_.dispatch();
      }
      
      private function _P_f() : void
      {
         this._06Z_.dispatch(new WebForgotPasswordDialog());
      }
      
      private function __true(param1:_1nd) : void
      {
         this.view._0gM_(param1.error);
         this.view._0F_M_();
      }
   }
}
