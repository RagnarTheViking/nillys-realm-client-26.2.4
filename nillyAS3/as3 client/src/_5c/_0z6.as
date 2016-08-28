package _5c
{
   import _0pN_._049;
   import _0R_R_._0oQ_;
   import _4u.Account;
   import com.company.assembleegameclient.util.offer.Offer;
   import _1V_8._1ks;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.util.offer.Offers;
   import com.company.assembleegameclient.util._0lH_;
   import flash.net.navigateToURL;
   import flash.net.URLRequest;
   
   public class _0z6 extends _049 implements _0oQ_
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var offer:Offer;
      
      [Inject]
      public var _0pc:_1ks;
      
      [Inject]
      public var paymentMethod:String;
      
      public function _0z6()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         Parameters.data_.paymentMethod = this.paymentMethod;
         Parameters.save();
         var _loc1_:Offers = this._0pc._M_2;
         var _loc2_:_0lH_ = _0lH_._0W_J_(this.paymentMethod);
         var _loc3_:String = _loc2_._1i4(_loc1_.tok,_loc1_.exp,this.offer);
         navigateToURL(new URLRequest(_loc3_),"_blank");
         _0et(true);
      }
   }
}
