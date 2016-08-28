package _0H_w
{
   import _0pN_._049;
   import _1__8._19A_;
   import _aW_.IWebRequest;
   import _4u.Account;
   import _1T_4._Q_G_;
   import Settings.App;
   
   public class _E_h extends _049
   {
       
      
      [Inject]
      public var _0G_2:_19A_;
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _1E_9:_Q_G_;
      
      public function _E_h()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this.client._R_L_(2);
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest("/app/init",{"game_net":this.account._L_y()});
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         var _loc3_:XML = XML(param2);
         param1 && this._1E_9.dispatch(_loc3_);
         this._1J_A_(_loc3_);
         _0et(param1,param2);
      }
      
      private function _1J_A_(param1:XML) : void
      {
         if(param1 != null)
         {
            App.xml = param1;
         }
      }
   }
}
