package _0fP_
{
   import _0pN_._049;
   import _0E_T_._Y_F_;
   import _aW_.IWebRequest;
   import _4u.Account;
   import _v4.Client;
   import _3b.DialogSignal;
   import _0E_T_._1G_k;
   import _1O_R_.ErrorDialog;
   
   public class _1E_3 extends _049
   {
       
      
      [Inject]
      public var skin:_Y_F_;
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var player:Client;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _1E_3()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.skin.setState(_1G_k.PURCHASING);
         this.player.UpdateCredits(-this.skin.cost);
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("account/purchaseSkin",this._1Z_W_());
      }
      
      private function _1Z_W_() : Object
      {
         var _loc1_:Object = this.account.credentials();
         _loc1_.skinType = this.skin.id;
         return _loc1_;
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._0C_v();
         }
         else
         {
            this._hS_(param2);
         }
         _0et(param1,param2);
      }
      
      private function _0C_v() : void
      {
         this.skin.setState(_1G_k.OWNED);
         this.skin._u5(true);
      }
      
      private function _hS_(param1:String) : void
      {
         var _loc2_:ErrorDialog = new ErrorDialog(param1);
         this._06Z_.dispatch(_loc2_);
         this.skin.setState(_1G_k.PURCHASABLE);
         this.player.UpdateCredits(this.skin.cost);
      }
   }
}
