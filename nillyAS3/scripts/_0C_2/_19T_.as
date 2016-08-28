package _0C_2
{
   import _0pN_._049;
   import _0R_R_._0oQ_;
   import com.company.assembleegameclient.util.offer.Offer;
   import _0u4._0us;
   import _0nP_._H_w;
   
   public class _19T_ extends _049 implements _0oQ_
   {
       
      
      [Inject]
      public var offer:Offer;
      
      [Inject]
      public var _1iN_:_0us;
      
      [Inject]
      public var _jS_:_H_w;
      
      public function _19T_()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         var _loc1_:Object = {
            "identifier":this.offer.id_,
            "data":this.offer.data_
         };
         this._1iN_._E_W_.addOnce(this._1oL_);
         this._1iN_.purchaseItems(_loc1_);
      }
      
      private function _1oL_(param1:Object) : void
      {
         this._jS_.dispatch();
         _0et(true);
      }
   }
}
