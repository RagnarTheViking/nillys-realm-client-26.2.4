package _0rQ_
{
   import flash.events.EventDispatcher;
   import _aW_.IWebRequest;
   import _f7._0K_8;
   import flash.utils.getTimer;
   
   public class _F_a extends EventDispatcher implements IWebRequest
   {
       
      
      [Inject]
      public var stats:_0rQ_.AppEngineRequestStats;
      
      [Inject]
      public var _0gu:_0rQ_._0H_t;
      
      private var _Q_X_:int;
      
      private var target:String;
      
      public function _F_a()
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
         this._Q_X_ = getTimer();
         this.target = param1;
         this._0gu.complete.addOnce(this.onComplete);
         this._0gu.sendRequest(param1,param2);
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         this.stats._0r3(this.target,param1,getTimer() - this._Q_X_);
      }
      
      public function _1ru() : Boolean
      {
         return false;
      }
   }
}
