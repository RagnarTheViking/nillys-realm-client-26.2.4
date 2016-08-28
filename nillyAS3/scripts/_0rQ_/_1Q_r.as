package _0rQ_
{
   import _aW_.IWebRequest;
   import _1T_4._1yM_;
   import _f7._0K_8;
   import flash.utils.getTimer;
   import _0H_w._1P_e;
   
   public class _1Q_r implements IWebRequest
   {
       
      
      [Inject]
      public var _S_s:_1yM_;
      
      [Inject]
      public var _0gu:_0rQ_._0H_t;
      
      private var target:String;
      
      private var time:int;
      
      public function _1Q_r()
      {
         super();
      }
      
      public function get complete() : _0K_8
      {
         return this._0gu.complete;
      }
      
      public function _gP_(param1:String) : void
      {
         this._0gu._gP_(param1);
      }
      
      public function _pp(param1:Boolean) : void
      {
         this._0gu._pp(param1);
      }
      
      public function _R_L_(param1:int) : void
      {
         this._0gu._R_L_(param1);
      }
      
      public function sendRequest(param1:String, param2:Object) : void
      {
         this.target = param1;
         this.time = getTimer();
         this._0gu.complete.addOnce(this.__var);
         this._0gu.sendRequest(param1,param2);
      }
      
      private function __var(param1:Boolean, param2:*) : void
      {
         var _loc3_:_1P_e = new _1P_e();
         _loc3_.category = "AppEngineResponseTime";
         _loc3_._19E_ = this.target;
         _loc3_.value = this.time - getTimer();
         this._S_s.dispatch(_loc3_);
      }
      
      public function _1ru() : Boolean
      {
         return false;
      }
   }
}
