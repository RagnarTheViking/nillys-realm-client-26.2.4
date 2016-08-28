package _00X_
{
   import _0pN_._049;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   import _aW_.IWebRequest;
   import _4u.Account;
   import _0db._1A_c;
   
   public class _0b9 extends _049
   {
       
      
      [Inject]
      public var character:SavedCharacter;
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var model:_1A_c;
      
      public function _0b9()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.client._R_L_(2);
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/char/delete",this._0zx());
      }
      
      private function _0zx() : Object
      {
         var _loc1_:Object = this.account.credentials();
         _loc1_.charId = this.character.charId();
         _loc1_.reason = 1;
         return _loc1_;
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         param1 && this._0md();
         _0et(param1,param2);
      }
      
      private function _0md() : void
      {
         this.model.deleteCharacter(this.character.charId());
      }
   }
}
