package _P_v
{
   import _0pN_._049;
   import _0R_R_._1D_F_;
   import _1R_9._J_m;
   import _4u._0dl;
   import _3b.DialogSignal;
   import _1__8._19A_;
   import _aW_.IWebRequest;
   import com.company.assembleegameclient.util.offer.Offer;
   import _1O_R_._0I_z;
   
   public class _X_k extends _049 implements _1D_F_
   {
       
      
      [Inject]
      public var steam:_J_m;
      
      [Inject]
      public var payment:_0dl;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0G_2:_19A_;
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var _oS_:IWebRequest;
      
      private var offer:Offer;
      
      public function _X_k()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this._0G_2.debug("start task");
         this.offer = this.payment.offer;
         this.client._R_L_(2);
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/steamworks/purchaseOffer",{
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
            this._iu(param2);
         }
      }
      
      private function _1be() : void
      {
         this._0G_2.debug("purchaseOffer complete");
         this.steam._1R_E_.addOnce(this._1__w);
      }
      
      private function _1__w(param1:uint, param2:String, param3:Boolean) : void
      {
         this._0G_2.debug("payment authorized {0},{1},{2}",[param1,param2,param3]);
         this._oS_._R_L_(2);
         this.client.complete.addOnce(this._gr);
         this._oS_.sendRequest("/steamworks/finalizePurchase",{
            "appid":param1,
            "orderid":param2,
            "authorized":(!!param3?1:0)
         });
      }
      
      private function _gr(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._1pU_();
         }
         else
         {
            this._1pL_(param2);
         }
      }
      
      private function _1pU_() : void
      {
         this._0G_2.debug("purchaseFinalized complete");
         _0et(true);
      }
      
      private function _1pL_(param1:String) : void
      {
         this._0G_2.debug("purchaseFinalized error {0}",[param1]);
         this._06Z_.dispatch(new _0I_z("Error: " + param1));
         _0et(false);
      }
      
      private function _iu(param1:String) : void
      {
         this._0G_2.debug("purchaseOffer request error {0}",[param1]);
         this._06Z_.dispatch(new _0I_z("Error: " + param1));
         _0et(false);
      }
   }
}
