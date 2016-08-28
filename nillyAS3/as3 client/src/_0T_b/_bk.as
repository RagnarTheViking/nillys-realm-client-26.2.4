package _0T_b
{
   import _P_S_.Mediator;
   import _m2._y7;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import _1T_4._34;
   import _4u.Account;
   import _0O_c._H_0;
   import _aW_.IWebRequest;
   import _0H_6.GameContext;
   import _C_._1O_I_;
   
   public class _bk extends Mediator
   {
       
      
      [Inject]
      public var view:_0T_b._0E___;
      
      [Inject]
      public var login:_y7;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      [Inject]
      public var _0F_n:_34;
      
      [Inject]
      public var account:Account;
      
      public function _bk()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._1fC_.add(this._1ut);
         this.view.register.add(this._02T_);
         this.view.forgot.add(this._P_f);
         this._0F_n.add(this.__true);
      }
      
      override public function destroy() : void
      {
         this.view._1fC_.remove(this._1ut);
         this.view.register.remove(this._02T_);
         this.view.forgot.remove(this._P_f);
         this._0F_n.remove(this.__true);
      }
      
      private function _1ut(param1:_H_0) : void
      {
         var _loc2_:IWebRequest = null;
         this.view.email.clearErrorText();
         this.view.disable();
         if(this.account.getUserId().toLowerCase() == param1.username.toLowerCase())
         {
            _loc2_ = GameContext.getInjector().getInstance(IWebRequest);
            _loc2_.sendRequest("/account/verify",{
               "guid":param1.username,
               "password":param1.password,
               "fromResetFlow":"yes"
            });
            _loc2_.complete.addOnce(this.onComplete);
         }
         else
         {
            this.view.email.setErrorText(_1O_I_._1N_f);
            this.view._0F_M_();
         }
      }
      
      private function _02T_() : void
      {
         this._06Z_.dispatch(new _mb());
      }
      
      private function _P_f() : void
      {
         this._06Z_.dispatch(new WebForgotPasswordDialog());
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(!param1)
         {
            this.__true(param2);
         }
         else
         {
            this._06Z_.dispatch(new _0cP_());
         }
      }
      
      private function __true(param1:String) : void
      {
         this.view._0gM_(param1);
         this.view._0F_M_();
      }
   }
}
