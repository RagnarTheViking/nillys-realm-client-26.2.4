package _P_v
{
   import _0pN_._049;
   import _0R_R_._1F_2;
   import _4u.Account;
   import _1R_9._J_m;
   import _0O_c._H_0;
   import _1__8._19A_;
   import _aW_.IWebRequest;
   
   public class _0C_H_ extends _049 implements _1F_2
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _1iN_:_J_m;
      
      [Inject]
      public var data:_H_0;
      
      [Inject]
      public var _0G_2:_19A_;
      
      [Inject]
      private var client:IWebRequest;
      
      public function _0C_H_()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this._0G_2.debug("startTask");
         this.client._R_L_(2);
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/steamworks/register",this._1I_v());
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._115(param2);
         }
         else
         {
            this._0A_D_(param2);
         }
      }
      
      private function _1I_v() : Object
      {
         var _loc1_:Object = this._1iN_._K_v();
         _loc1_.newGUID = this.data.username;
         _loc1_.newPassword = this.data.password;
         _loc1_.entrytag = this.account._1jd();
         return _loc1_;
      }
      
      private function _115(param1:String) : void
      {
         var _loc2_:XML = new XML(param1);
         this._0G_2.debug("done - {0}",[_loc2_.GUID]);
         this.account._0cX_(_loc2_.GUID,_loc2_.Secret);
         this.account._1Z_w(_loc2_.PlatformToken);
         _0et(true);
      }
      
      private function _0A_D_(param1:String) : void
      {
         this._0G_2.debug("error - {0}",[param1]);
         _0et(false,param1);
      }
   }
}
