package _18E_
{
   import _1V_8._jw;
   import _1xa._1eo;
   import com.company.assembleegameclient.util.offer.Offer;
   import _1xa._dU_;
   import _C_._1O_I_;
   
   public class _N_O_ implements _jw
   {
       
      
      public function _N_O_()
      {
         super();
      }
      
      public function _0ev() : Boolean
      {
         return false;
      }
      
      public function _f2() : Boolean
      {
         return false;
      }
      
      public function _0kD_(param1:Offer) : _1eo
      {
         return new _dU_().setParams(_1O_I_._1C_Z_,{
            "cost":param1.price_,
            "currency":param1.currency_
         });
      }
      
      public function _1A_x() : String
      {
         throw new Error("No current support for new Kabam offer wall on Steam.");
      }
   }
}
