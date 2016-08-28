package _P_v
{
   import _0pN_._049;
   import _0R_R_._0oQ_;
   import _4u.Account;
   import _1R_9._J_m;
   import com.company.assembleegameclient.util.offer.Offer;
   import _3b.DialogSignal;
   import _1T_4._0zP_;
   import _1__8._19A_;
   import _aW_.IWebRequest;
   import _0nP_._H_w;
   import flash.utils.setTimeout;
   import _1O_R_._0I_z;
   
   public class _1oG_ extends _049 implements _0oQ_
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var steam:_J_m;
      
      [Inject]
      public var offer:Offer;
      
      [Inject]
      public var paymentMethod:String;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _19M_:_0zP_;
      
      [Inject]
      public var _0G_2:_19A_;
      
      [Inject]
      public var first:IWebRequest;
      
      [Inject]
      public var _oS_:IWebRequest;
      
      [Inject]
      public var _jS_:_H_w;
      
      public function _1oG_()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this._0G_2.debug("SteamPurchaseGoldTask startTask");
         this.steam._1R_E_.addOnce(this._1__w);
         this.first._R_L_(2);
         this.first.complete.addOnce(this.onComplete);
         this.first.sendRequest("/steamworks/purchaseOffer",{
            "steamid":this.steam._0mw(),
            "data":this.offer.data_
         });
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._1be();
         }
         else
         {
            this.reportError(param2);
         }
      }
      
      private function _1be() : void
      {
         this._0G_2.debug("SteamPurchaseGoldTask purchaseOffer confirmed by AppEngine");
         setTimeout(function():void
         {
            _19M_.dispatch();
         },1100);
      }
      
      private function _1__w(param1:uint, param2:String, param3:Boolean) : void
      {
         if(param3 == false)
         {
            this._0G_2.debug("SteamPurchaseGoldTask payment canceled by user");
            _0et(true);
            this._oS_._R_L_(2);
            this._oS_.sendRequest("/steamworks/finalizePurchase",{
               "appid":param1,
               "orderid":param2,
               "authorized":0
            });
         }
         else
         {
            this._0G_2.debug("SteamPurchaseGoldTask payment authorized by Steam");
            this._oS_._R_L_(2);
            this._oS_.complete.addOnce(this._gr);
            this._oS_.sendRequest("/steamworks/finalizePurchase",{
               "appid":param1,
               "orderid":param2,
               "authorized":(!!param3?1:0)
            });
         }
      }
      
      private function _gr(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._1pU_();
         }
         else
         {
            this.reportError(param2);
         }
      }
      
      private function _1pU_() : void
      {
         this._0G_2.debug("SteamPurchaseGoldTask purchase finalized");
         this._jS_.dispatch();
         _0et(true);
      }
      
      private function reportError(param1:String) : void
      {
         var _loc2_:String = "Error: " + param1;
         this._0G_2.debug("finalize error {0}",[_loc2_]);
         this._06Z_.dispatch(new _0I_z(_loc2_));
         _0et(false);
      }
   }
}
