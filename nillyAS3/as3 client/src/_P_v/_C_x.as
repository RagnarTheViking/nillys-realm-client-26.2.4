package _P_v
{
   import _0pN_._049;
   import _4u.Account;
   import _1R_9._J_m;
   import _3b.DialogSignal;
   import _aW_.IWebRequest;
   import _1O_R_._0I_z;
   
   public class _C_x extends _049
   {
      
      private static const _1Z_T_:String = "Error: ${error}";
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var steam:_J_m;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var client:IWebRequest;
      
      public function _C_x()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         var _loc1_:Object = this.steam._K_v();
         this.client._R_L_(2);
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/steamworks/getcredentials",_loc1_);
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._0ys(param2);
         }
         else
         {
            this._06__(param2);
         }
         _0et(param1,param2);
      }
      
      private function _0ys(param1:String) : void
      {
         var _loc2_:XML = new XML(param1);
         this.account._0cX_(_loc2_.GUID,_loc2_.Secret);
         this.account._1Z_w(_loc2_.PlatformToken);
      }
      
      private function _06__(param1:String) : void
      {
         var _loc2_:String = _1Z_T_.replace("${error}",param1);
         var _loc3_:_0I_z = new _0I_z(_loc2_);
         this._06Z_.dispatch(_loc3_);
      }
   }
}
