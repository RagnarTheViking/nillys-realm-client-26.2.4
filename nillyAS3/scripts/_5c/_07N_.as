package _5c
{
   import _0pN_._049;
   import _0R_R_._1F_2;
   import _0O_c._H_0;
   import _4u.Account;
   import _v4.Client;
   import _aW_.IWebRequest;
   
   public class _07N_ extends _049 implements _1F_2
   {
       
      
      [Inject]
      public var data:_H_0;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var model:Client;
      
      [Inject]
      public var client:IWebRequest;
      
      public function _07N_()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/account/register",this._1I_v());
      }
      
      private function _1I_v() : Object
      {
         var _loc1_:Object = {};
         _loc1_.guid = this.account.getUserId();
         _loc1_.newGUID = this.data.username;
         _loc1_.newPassword = this.data.password;
         _loc1_.entrytag = this.account._1jd();
         _loc1_.isAgeVerified = 1;
         return _loc1_;
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         param1 && this._115();
         _0et(param1,param2);
      }
      
      private function _115() : void
      {
         this.model.setAgeVerification(true);
         this.account._0cX_(this.data.username,this.data.password);
      }
   }
}
