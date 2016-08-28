package _5c
{
   import _0pN_._049;
   import _0R_R_._1Q_g;
   import _4u.Account;
   import _0O_c._H_0;
   import _aW_.IWebRequest;
   
   public class _0p2 extends _049 implements _1Q_g
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var data:_H_0;
      
      [Inject]
      public var client:IWebRequest;
      
      public function _0p2()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/account/verify",{
            "guid":this.data.username,
            "password":this.data.password
         });
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._0cX_(param2);
         }
         _0et(param1,param2);
      }
      
      private function _0cX_(param1:String) : void
      {
         var _loc2_:XML = new XML(param1);
         this.account._0cX_(this.data.username,this.data.password);
         this.account.verify(_loc2_.hasOwnProperty("VerifiedEmail"));
      }
   }
}
