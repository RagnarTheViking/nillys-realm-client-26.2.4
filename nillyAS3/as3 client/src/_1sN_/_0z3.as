package _1sN_
{
   import _0pN_._049;
   import _4u.Account;
   import _Z_U_._117;
   import _aW_.IWebRequest;
   
   public class _0z3 extends _049
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var model:_117;
      
      [Inject]
      public var client:IWebRequest;
      
      public function _0z3()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/account/getBeginnerPackageTimeLeft",this.account.credentials());
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         this._0fY_(param2);
      }
      
      private function _0fY_(param1:String) : void
      {
         var _loc2_:int = new XML(param1)[0];
         this.model._1hN_(_loc2_);
         _0et(_loc2_ > 0);
      }
   }
}
