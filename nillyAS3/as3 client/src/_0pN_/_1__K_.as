package _0pN_
{
   public class _1__K_ extends _0pN_._049
   {
       
      
      private var _0S_t:Vector.<_0pN_._049>;
      
      private var _0T_V_:int;
      
      public function _1__K_()
      {
         super();
         this._0S_t = new Vector.<_0pN_._049>();
      }
      
      public function add(param1:_0pN_._049) : void
      {
         this._0S_t.push(param1);
      }
      
      override protected function startTask() : void
      {
         this._0T_V_ = this._0S_t.length;
         if(this._0T_V_ > 0)
         {
            this._1V_9();
         }
         else
         {
            _0et(true);
         }
      }
      
      override protected function onReset() : void
      {
         var _loc1_:_0pN_._049 = null;
         for each(_loc1_ in this._0S_t)
         {
            _loc1_.reset();
         }
      }
      
      private function _1V_9() : void
      {
         var _loc1_:int = this._0T_V_;
         while(_loc1_--)
         {
            this._0S_t[_loc1_].lastly.addOnce(this._07n);
            this._0S_t[_loc1_].start();
         }
      }
      
      private function _07n(param1:_0pN_._049, param2:Boolean, param3:String) : void
      {
         if(param2)
         {
            if(--this._0T_V_ == 0)
            {
               _0et(true);
            }
         }
         else
         {
            _0et(false,param3);
         }
      }
      
      public function toString() : String
      {
         return "[TaskGroup(" + this._0S_t.join(",") + ")]";
      }
   }
}
