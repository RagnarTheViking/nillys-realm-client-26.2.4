package _0pN_
{
   public class _M_Y_ extends _049
   {
       
      
      private var _0pM_:_0pN_._1nd;
      
      private var success:_0pN_._1nd;
      
      private var failure:_0pN_._1nd;
      
      public function _M_Y_(param1:_0pN_._1nd, param2:_0pN_._1nd = null, param3:_0pN_._1nd = null)
      {
         super();
         this._0pM_ = param1;
         this.success = param2;
         this.failure = param3;
      }
      
      public function _1hh(param1:_0pN_._1nd) : void
      {
         this.success = param1;
      }
      
      public function _9c(param1:_0pN_._1nd) : void
      {
         this.failure = param1;
      }
      
      override protected function startTask() : void
      {
         this._0pM_._0P_3.addOnce(this._07n);
         this._0pM_.start();
      }
      
      private function _07n(param1:_0pN_._1nd, param2:Boolean, param3:String = "") : void
      {
         if(param2)
         {
            this._1r2(this.success);
         }
         else
         {
            this._1r2(this.failure);
         }
      }
      
      private function _1r2(param1:_0pN_._1nd) : void
      {
         if(param1)
         {
            param1._0P_3.addOnce(this._xe);
            param1.start();
         }
         else
         {
            _0et(true);
         }
      }
      
      private function _xe(param1:_0pN_._1nd, param2:Boolean, param3:String = "") : void
      {
         _0et(param2,param3);
      }
   }
}
