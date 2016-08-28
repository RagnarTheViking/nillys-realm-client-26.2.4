package _0R_R_
{
   import _0pN_._049;
   import _4u.Account;
   import _1V_8._1ks;
   import _1__8._19A_;
   import _aW_.IWebRequest;
   import flash.utils.getTimer;
   import com.company.assembleegameclient.util.offer.Offers;
   
   public class _0T_p extends _049
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var model:_1ks;
      
      [Inject]
      public var _0G_2:_19A_;
      
      [Inject]
      public var client:IWebRequest;
      
      private var target:String;
      
      private var guid:String;
      
      public function _0T_p()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.target = this.account._2R_() + "/getoffers";
         this.guid = this.account.getUserId();
         this._06Y_();
         this._1aX_();
      }
      
      private function _06Y_() : void
      {
         var _loc1_:int = getTimer();
         if(this.guid != this.model._1s2 || _loc1_ - this.model._05d > _1ks._yr)
         {
            this.model._1s2 = this.guid;
            this.model._05d = _loc1_;
         }
      }
      
      private function _1aX_() : void
      {
         this.client._R_L_(2);
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest(this.target,this._bG_());
      }
      
      private function _bG_() : Object
      {
         var _loc1_:Object = this.account.credentials();
         _loc1_.time = this.model._05d;
         _loc1_.game_net_user_id = this.account._00Z_();
         _loc1_.game_net = this.account._L_y();
         _loc1_.play_platform = this.account._0fT_();
         return _loc1_;
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._1__G_(param2);
         }
         else
         {
            this._0W_S_(param2);
         }
         _0et(param1);
      }
      
      private function _1__G_(param1:String) : void
      {
         this.model._M_2 = new Offers(new XML(param1));
      }
      
      private function _0W_S_(param1:String) : void
      {
         this._0G_2.error(param1);
      }
   }
}
