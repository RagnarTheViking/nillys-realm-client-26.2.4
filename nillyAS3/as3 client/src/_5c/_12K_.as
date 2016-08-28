package _5c
{
   import _0pN_._049;
   import _0R_R_._0K_S_;
   import _1T_4._1yM_;
   import _aW_.IWebRequest;
   import _0H_w._1P_e;
   
   public class _12K_ extends _049 implements _0K_S_
   {
       
      
      [Inject]
      public var email:String;
      
      [Inject]
      public var _S_s:_1yM_;
      
      [Inject]
      public var client:IWebRequest;
      
      public function _12K_()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/account/forgotPassword",{"guid":this.email});
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._1me();
         }
         else
         {
            this._0R_4(param2);
         }
      }
      
      private function _1me() : void
      {
         this._0cK_();
         _0et(true);
      }
      
      private function _0cK_() : void
      {
         var _loc1_:_1P_e = new _1P_e();
         _loc1_.category = "account";
         _loc1_._19E_ = "passwordSent";
         this._S_s.dispatch(_loc1_);
      }
      
      private function _0R_4(param1:String) : void
      {
         _0et(false,param1);
      }
   }
}
