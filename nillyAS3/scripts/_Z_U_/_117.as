package _Z_U_
{
   import _4u.Account;
   import _1V_8._1ks;
   import _f7.Signal;
   import com.company.assembleegameclient.util.TimeConversions;
   import com.company.assembleegameclient.util.offer.Offer;
   
   public class _117
   {
      
      private static const _0E_b:int = 2600;
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var model:_1ks;
      
      public var _W_v:Signal;
      
      private var _09D_:Number;
      
      public function _117()
      {
         this._W_v = new Signal();
         super();
      }
      
      public function _0D_m() : Boolean
      {
         return this._09D_ > 0;
      }
      
      public function _1hN_(param1:Number) : void
      {
         this._09D_ = param1;
      }
      
      public function _Q_u() : Number
      {
         return this._09D_;
      }
      
      public function _0__z() : Number
      {
         return Math.ceil(TimeConversions.secondsToDays(this._Q_u()));
      }
      
      public function _D_o() : Offer
      {
         var _loc1_:Offer = null;
         if(!this.model._M_2)
         {
            return null;
         }
         for each(_loc1_ in this.model._M_2.offerList)
         {
            if(_loc1_.realmGold_ == _0E_b)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function _07M_() : void
      {
         this._1hN_(-1);
         this._W_v.dispatch();
      }
   }
}
