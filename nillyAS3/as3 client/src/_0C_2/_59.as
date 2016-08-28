package _0C_2
{
   import _0pN_._049;
   import _0R_R_._47;
   import _4u.Account;
   import _0u4._0us;
   import _0O_c._H_0;
   import _0U_p._09S_;
   import _aW_.IWebRequest;
   
   public class _59 extends _049 implements _47
   {
      
      public static const _G_2:String = "Kongregate account already registered";
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _1iN_:_0us;
      
      [Inject]
      public var data:_H_0;
      
      [Inject]
      public var _0th:_09S_;
      
      [Inject]
      public var client:IWebRequest;
      
      public function _59()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.client._R_L_(2);
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/kongregate/internalRegister",this._1I_v());
      }
      
      private function _1I_v() : Object
      {
         var _loc1_:Object = this._1iN_._11f();
         _loc1_.guid = this.account.getUserId();
         return _loc1_;
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._0K_H_(param2);
         }
         else if(param2 == _G_2)
         {
            this._0th.dispatch(this.data);
         }
         _0et(param1,param2);
      }
      
      private function _0K_H_(param1:String) : void
      {
         var _loc2_:XML = new XML(param1);
         this.account._0cX_(_loc2_.GUID,_loc2_.Secret);
         this.account._1Z_w(_loc2_.PlatformToken);
      }
   }
}
