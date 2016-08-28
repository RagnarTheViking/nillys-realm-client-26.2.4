package _pX_
{
   import _4u.Account;
   import _0y._0T_W_;
   
   public class _X_3
   {
       
      
      [Inject]
      public var _1B_S_:XML;
      
      [Inject]
      public var account:Account;
      
      public function _X_3()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:XML = null;
         var _loc2_:_0T_W_ = this.account as _0T_W_;
         if(this._1B_S_.hasOwnProperty("KabamPaymentInfo"))
         {
            _loc1_ = XML(this._1B_S_.KabamPaymentInfo);
            _loc2_.signedRequest = _loc1_.signedRequest;
            _loc2_._066 = _loc1_.naid;
         }
      }
   }
}
