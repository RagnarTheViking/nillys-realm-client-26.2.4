package _0C_2
{
   import _0pN_._049;
   import _0R_R_._1Q_g;
   import _4u.Account;
   import _0u4._0us;
   import _aW_.IWebRequest;
   
   public class _02c extends _049 implements _1Q_g
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _1iN_:_0us;
      
      [Inject]
      public var local:_0C_2._17f;
      
      [Inject]
      public var client:IWebRequest;
      
      public function _02c()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.client._R_L_(2);
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/kongregate/getcredentials",this._1iN_._11f());
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
         _0et(true);
      }
   }
}
