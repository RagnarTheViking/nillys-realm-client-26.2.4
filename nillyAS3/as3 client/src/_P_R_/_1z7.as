package _P_R_
{
   import _0pN_._049;
   import _0R_R_._1tP_;
   import _4u.Account;
   import _04a._0L___;
   import _3b.DialogSignal;
   import _aW_.IWebRequest;
   import _1N_W_._0D_Q_;
   import _00I_._0B_g;
   
   public class _1z7 extends _049 implements _1tP_
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var parameters:_0L___;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var client:IWebRequest;
      
      private var kabam:_0D_Q_;
      
      public function _1z7()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.kabam = this.account as _0D_Q_;
         this.kabam.signedRequest = this.parameters._0__r();
         this.kabam.userSession = this.parameters._46();
         if(this.kabam.userSession == null)
         {
            this._06Z_.dispatch(new _0B_g());
            _0et(false);
         }
         else
         {
            this.sendRequest();
         }
      }
      
      private function sendRequest() : void
      {
         var _loc1_:Object = {
            "signedRequest":this.kabam.signedRequest,
            "entrytag":this.account._1jd()
         };
         this.client._R_L_(2);
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/kabam/getcredentials",_loc1_);
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         param1 && this._0ys(param2);
         _0et(param1,param2);
      }
      
      private function _0ys(param1:String) : void
      {
         var _loc2_:XML = new XML(param1);
         this.account._0cX_(_loc2_.GUID,_loc2_.Secret);
         this.account._1Z_w(_loc2_.PlatformToken);
      }
   }
}
