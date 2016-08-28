package _0R_R_
{
   import _0pN_._049;
   import _4u.Account;
   import _aW_.IWebRequest;
   import _v4.Client;
   import _1T_4._1pn;
   import _m2._W_O_;
   import _1__8._19A_;
   import flash.utils.Timer;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.util._l5;
   import flash.events.TimerEvent;
   
   public class _1uC_ extends _049
   {
      
      private static const _T_g:int = 1000;
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var model:Client;
      
      [Inject]
      public var _0O_o:_1pn;
      
      [Inject]
      public var _0O_D_:_W_O_;
      
      [Inject]
      public var _0G_2:_19A_;
      
      private var _1mn:Object;
      
      private var _0v2:Timer;
      
      public function _1uC_()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this._0G_2.info("GetUserDataTask start");
         this._1mn = this._e2();
         this.sendRequest();
         Parameters._1C_j = false;
      }
      
      private function sendRequest() : void
      {
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/char/list",this._1mn);
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._0g5(param2);
         }
         else
         {
            this._0W_S_(param2);
         }
      }
      
      public function _e2() : Object
      {
         var _loc1_:Object = {};
         _loc1_.game_net_user_id = this.account._00Z_();
         _loc1_.game_net = this.account._L_y();
         _loc1_.play_platform = this.account._0fT_();
         _loc1_.do_login = Parameters._1C_j;
         _l5._0an(_loc1_,this.account.credentials());
         return _loc1_;
      }
      
      private function _0g5(param1:String) : void
      {
         this._0O_D_.dispatch(XML(param1));
         _0et(true);
         if(this._0v2 != null)
         {
            this._0S_c();
         }
      }
      
      private function _0W_S_(param1:String) : void
      {
         this._0O_o.dispatch("error.loadError");
         if(param1 == "Account credentials not valid")
         {
            this._00C_();
         }
         else
         {
            this._0O_Y_();
         }
      }
      
      private function _00C_() : void
      {
         this._0G_2.info("GetUserDataTask invalid credentials");
         this.account.clear();
         this.client.sendRequest("/char/list",this._1mn);
      }
      
      private function _0O_Y_() : void
      {
         this._0G_2.info("GetUserDataTask error - retrying");
         this._0v2 = new Timer(_T_g,1);
         this._0v2.addEventListener(TimerEvent.TIMER_COMPLETE,this._W_D_);
         this._0v2.start();
      }
      
      private function _0S_c() : void
      {
         this._0v2.stop();
         this._0v2.removeEventListener(TimerEvent.TIMER_COMPLETE,this._W_D_);
         this._0v2 = null;
      }
      
      private function _W_D_(param1:TimerEvent) : void
      {
         this._0S_c();
         this.sendRequest();
      }
   }
}
