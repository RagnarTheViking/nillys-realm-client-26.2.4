package _0Y_H_
{
   import _1V_8._jw;
   import _1xa._1eo;
   import com.company.assembleegameclient.util.offer.Offer;
   import _1xa._dU_;
   import _C_._1O_I_;
   
   public class _Y_k implements _jw
   {
       
      
      public function _Y_k()
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
         return new _dU_().setParams(_1O_I_._15r,{"cost":param1.price_});
      }
      
      public function _1A_x() : String
      {
         throw new Error("No current support for new Kabam offer wall on Kongregate.");
      }
   }
}
