package _0H_w
{
   import _0pN_._049;
   import _4u.Account;
   import _aW_.IWebRequest;
   import _v4.Client;
   import _1__8._19A_;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.util._l5;
   import com.company.assembleegameclient.appengine.CharList;
   
   public class PurchaseCharacterClassTask extends _049
   {
       
      
      [Inject]
      public var classType:int;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var _0U_H_:Client;
      
      [Inject]
      public var _0G_2:_19A_;
      
      public function PurchaseCharacterClassTask()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this._0G_2.info("PurchaseCharacterClassTask.startTask: Started ");
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/char/purchaseClassUnlock",this._0vJ_());
      }
      
      public function _0vJ_() : Object
      {
         var _loc1_:Object = {};
         _loc1_.game_net_user_id = this.account._00Z_();
         _loc1_.game_net = this.account._L_y();
         _loc1_.play_platform = this.account._0fT_();
         _loc1_.do_login = Parameters._1C_j;
         _loc1_.classType = this.classType;
         _l5._0an(_loc1_,this.account.credentials());
         return _loc1_;
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         this._0G_2.info("PurchaseCharacterClassTask.onComplete: Ended ");
         param1 && this._0iE_();
         _0et(param1,param2);
      }
      
      private function _0iE_() : void
      {
         this._0U_H_._07V_(this.classType,CharList._1lc);
         _0et(true);
      }
   }
}
