package _0R_R_
{
   import _0pN_._049;
   import _4u.Account;
   import _v4.Client;
   import _aW_.IWebRequest;
   
   public class _105 extends _049
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _0U_H_:Client;
      
      [Inject]
      public var client:IWebRequest;
      
      public function _105()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         if(this.account.registered())
         {
            this._0qN_();
         }
         else
         {
            this._17t();
         }
      }
      
      private function _0qN_() : void
      {
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/account/verifyage",this._1I_v());
      }
      
      private function _1I_v() : Object
      {
         var _loc1_:Object = this.account.credentials();
         _loc1_.isAgeVerified = 1;
         return _loc1_;
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         param1 && this._17t();
         _0et(param1,param2);
      }
      
      private function _17t() : void
      {
         this._0U_H_.setAgeVerification(true);
         _0et(true);
      }
   }
}
