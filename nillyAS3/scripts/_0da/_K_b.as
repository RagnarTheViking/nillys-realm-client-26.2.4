package _0da
{
   import _0sm._bK_;
   
   public class _K_b implements _07B_
   {
       
      
      [Inject]
      public var _M_b:_bK_;
      
      private var _1M_b:Object;
      
      public function _K_b()
      {
         super();
         this._1M_b = {};
      }
      
      public function _0I_Q_(param1:String, param2:int) : void
      {
         var _loc3_:_I_N_ = this._1M_b[param1] = this._1M_b[param1] || new _I_N_(param1);
         _loc3_._1dU_(param2);
         this._M_b.dispatch(_loc3_);
      }
   }
}
