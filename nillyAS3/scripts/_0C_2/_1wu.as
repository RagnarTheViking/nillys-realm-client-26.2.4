package _0C_2
{
   import _0pN_._049;
   import _0R_R_._1F_2;
   import _0O_c._H_0;
   import _0u4._0us;
   import _4u.Account;
   import _1T_4._1yM_;
   import _aW_.IWebRequest;
   import _0H_w._1P_e;
   
   public class _1wu extends _049 implements _1F_2
   {
       
      
      [Inject]
      public var data:_H_0;
      
      [Inject]
      public var _1iN_:_0us;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _S_s:_1yM_;
      
      [Inject]
      public var client:IWebRequest;
      
      public function _1wu()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.client._R_L_(2);
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/kongregate/register",this._1I_v());
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         param1 && this._0K_H_(param2);
         _0et(param1,param2);
      }
      
      private function _1I_v() : Object
      {
         var _loc1_:Object = this._1iN_._11f();
         _loc1_.newGUID = this.data.username;
         _loc1_.newPassword = this.data.password;
         _loc1_.entrytag = this.account._1jd();
         return _loc1_;
      }
      
      private function _0K_H_(param1:String) : void
      {
         this._050(param1);
         this._q8();
      }
      
      private function _q8() : void
      {
         var _loc1_:_1P_e = new _1P_e();
         _loc1_.category = "kongregateAccount";
         _loc1_._19E_ = "accountRegistered";
         this._S_s.dispatch(_loc1_);
      }
      
      private function _050(param1:String) : void
      {
         var _loc2_:XML = new XML(param1);
         this.account._0cX_(_loc2_.GUID,_loc2_.Secret);
         this.account._1Z_w(_loc2_.PlatformToken);
      }
   }
}
