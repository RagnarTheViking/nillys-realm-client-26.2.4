package _0C_2
{
   import _0pN_._049;
   import _0R_R_._1D_F_;
   import _4u._0dl;
   import _4u.Account;
   import _0u4._0us;
   import com.company.assembleegameclient.util.offer.Offer;
   
   public class _1T_N_ extends _049 implements _1D_F_
   {
       
      
      [Inject]
      public var payment:_0dl;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _1iN_:_0us;
      
      public function _1T_N_()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         var _loc1_:Offer = this.payment.offer;
         var _loc2_:Object = {
            "identifier":_loc1_.id_,
            "data":_loc1_.data_
         };
         this._1iN_._E_W_.addOnce(this._1oL_);
         this._1iN_.purchaseItems(_loc2_);
      }
      
      private function _1oL_(param1:Object) : void
      {
         _0et(true);
      }
   }
}
