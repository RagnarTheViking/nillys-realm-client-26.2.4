package _0T_b
{
   import _P_S_.Mediator;
   import _4u.Account;
   import _1T_4._1yM_;
   import _m2._0Z_7;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import _m2._1N_l;
   import _0H_w._1P_e;
   import _0H_6.GameContext;
   import _aW_.IWebRequest;
   
   public class _0dW_ extends Mediator
   {
       
      
      [Inject]
      public var view:_0T_b.WebAccountDetailDialog;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _S_s:_1yM_;
      
      [Inject]
      public var verify:_0Z_7;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      [Inject]
      public var _050:_1N_l;
      
      public function _0dW_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._1vi(this.account._1yb(),this.account._0aB_());
         this.view.change.add(this._1C___);
         this.view.logout.add(this._Q_y);
         this.view.cancel.add(this._11L_);
         this.view.verify.add(this._13p);
      }
      
      override public function destroy() : void
      {
         this.view.change.remove(this._1C___);
         this.view.logout.remove(this._Q_y);
         this.view.cancel.remove(this._11L_);
         this.view.verify.remove(this._13p);
      }
      
      private function _1C___() : void
      {
         this._06Z_.dispatch(new WebChangePasswordDialog());
      }
      
      private function _Q_y() : void
      {
         this._l__();
         this.account.clear();
         this._050.dispatch();
         this._06Z_.dispatch(new WebLoginDialog());
      }
      
      private function _l__() : void
      {
         var _loc1_:_1P_e = new _1P_e();
         _loc1_.category = "account";
         _loc1_._19E_ = "loggedOut";
         this._S_s.dispatch(_loc1_);
      }
      
      private function _11L_() : void
      {
         this._0dR_.dispatch();
      }
      
      private function _13p() : void
      {
         var _loc1_:IWebRequest = GameContext.getInjector().getInstance(IWebRequest);
         _loc1_.complete.addOnce(this.onComplete);
         _loc1_.sendRequest("/account/sendVerifyEmail",this.account.credentials());
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._uR_();
         }
         else
         {
            this._B_H_(param2);
         }
      }
      
      private function _uR_() : void
      {
         this._18B_();
      }
      
      private function _18B_() : void
      {
         var _loc1_:_1P_e = new _1P_e();
         _loc1_.category = "account";
         _loc1_._19E_ = "verifyEmailSent";
         this._S_s.dispatch(_loc1_);
      }
      
      private function _B_H_(param1:String) : void
      {
         this.account.clear();
      }
   }
}
