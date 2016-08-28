package _0O_c
{
   import _1V_8._jw;
   import _1xa._1eo;
   import com.company.assembleegameclient.util.offer.Offer;
   import _1xa._dU_;
   import _C_._1O_I_;
   
   public class _0dr implements _jw
   {
       
      
      public function _0dr()
      {
         super();
      }
      
      public function _0ev() : Boolean
      {
         return true;
      }
      
      public function _f2() : Boolean
      {
         return true;
      }
      
      public function _0kD_(param1:Offer) : _1eo
      {
         return new _dU_().setParams(_1O_I_._0jd,{"cost":param1.price_});
      }
      
      public function _1A_x() : String
      {
         return "rotmg.KabamPayment.setupRotmgAccount";
      }
   }
}
