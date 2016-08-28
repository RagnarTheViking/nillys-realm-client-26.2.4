package _5c
{
   import _0pN_._049;
   import _0R_R_._1kH_;
   import _4u.Account;
   import _0O_c._0G_R_;
   import _aW_.IWebRequest;
   
   public class _hH_ extends _049 implements _1kH_
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var data:_0G_R_;
      
      [Inject]
      public var client:IWebRequest;
      
      public function _hH_()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/account/changePassword",this._1I_v());
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         param1 && this._hb();
         _0et(param1,param2);
      }
      
      private function _1I_v() : Object
      {
         var _loc1_:Object = {};
         _loc1_.guid = this.account.getUserId();
         _loc1_.password = this.data._1rh;
         _loc1_.newPassword = this.data.newPassword;
         return _loc1_;
      }
      
      private function _hb() : void
      {
         this.account._0cX_(this.account.getUserId(),this.data.newPassword);
         _0et(true);
      }
   }
}
