package _I_w
{
   import flash.utils.Dictionary;
   
   public class _1W_N_
   {
       
      
      private const _1S_C_:Dictionary = new Dictionary(false);
      
      public function _1W_N_()
      {
         super();
      }
      
      public function _1W_k(param1:Object) : void
      {
         this._1S_C_[param1] = true;
      }
      
      public function release(param1:Object) : void
      {
         delete this._1S_C_[param1];
      }
      
      public function flush() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in this._1S_C_)
         {
            delete this._1S_C_[_loc1_];
         }
      }
   }
}
