package _0pN_
{
   import _f7.Signal;
   
   public class _1my extends _049
   {
       
      
      private var _1N_V_:Signal;
      
      private var params:Array;
      
      public function _1my(param1:Signal, ... rest)
      {
         super();
         this._1N_V_ = param1;
         this.params = rest;
      }
      
      override protected function startTask() : void
      {
         this._1N_V_.dispatch.apply(null,this.params);
         _0et(true);
      }
   }
}
