package _5c
{
   import _0pN_._049;
   import _0R_R_._1D_F_;
   import _4u._0dl;
   import _1V_8._1ks;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.util._0lH_;
   import flash.net.navigateToURL;
   import flash.net.URLRequest;
   
   public class _cW_ extends _049 implements _1D_F_
   {
       
      
      [Inject]
      public var data:_0dl;
      
      [Inject]
      public var model:_1ks;
      
      public function _cW_()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         Parameters.data_.paymentMethod = this.data.paymentMethod;
         Parameters.save();
         var _loc1_:_0lH_ = _0lH_._0W_J_(this.data.paymentMethod);
         var _loc2_:String = _loc1_._1i4(this.model._M_2.tok,this.model._M_2.exp,this.data.offer);
         navigateToURL(new URLRequest(_loc2_),"_blank");
         _0et(true);
      }
   }
}
