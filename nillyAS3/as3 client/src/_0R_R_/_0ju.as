package _0R_R_
{
   import _0pN_._049;
   import _4u.Account;
   import _aW_.IWebRequest;
   import _3b.DialogSignal;
   import _v4.Client;
   
   public class _0ju extends _049
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var price:int;
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var model:Client;
      
      public function _0ju()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.client._R_L_(2);
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/account/purchaseCharSlot",this.account.credentials());
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         param1 && this._l2();
         _0et(param1,param2);
      }
      
      private function _l2() : void
      {
         this.model.setMaxNumChars(this.model.getMaxNumChars() + 1);
         if(this.model.getCharSlotCurrency() == 0)
         {
            this.model.UpdateCredits(-this.price);
         }
         else
         {
            this.model.UpdateFame(-this.price);
         }
      }
   }
}
