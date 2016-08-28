package _5c
{
   import _0pN_._049;
   import _0R_R_._o4;
   import _4u.Account;
   import _1T_4._1yM_;
   import _aW_.IWebRequest;
   import _0H_w._1P_e;
   
   public class _1vY_ extends _049 implements _o4
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _S_s:_1yM_;
      
      [Inject]
      public var client:IWebRequest;
      
      public function _1vY_()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/account/sendVerifyEmail",this.account.credentials());
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
         _0et(true);
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
         _0et(false);
      }
   }
}
