package _M_6
{
   import _0pN_._049;
   import _4u.Account;
   import _aW_.IWebRequest;
   import _ge._v1;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   import com.company.util._l5;
   
   public class _0qT_ extends _049
   {
      
      private static const _tY_:String = "account/getCredits";
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var _R_U_:_v1;
      
      private var _vF_:Array;
      
      private var timer:Timer;
      
      private var _ux:int = 0;
      
      public function _0qT_()
      {
         this._vF_ = [2,5,15];
         this.timer = new Timer(1000);
         super();
      }
      
      override protected function startTask() : void
      {
         this.timer.addEventListener(TimerEvent.TIMER,this._11z);
         this.timer.start();
      }
      
      private function _11z(param1:TimerEvent) : void
      {
         var _loc2_:* = this._vF_;
         var _loc3_:* = this._ux;
         var _loc4_:* = _loc2_[_loc3_] - 1;
         _loc2_[_loc3_] = _loc4_;
         if(this._vF_[this._ux] <= 0)
         {
            this.timer.removeEventListener(TimerEvent.TIMER,this._11z);
            this._1B_n();
            this._ux++;
            this.timer.stop();
         }
      }
      
      private function _1B_n() : void
      {
         this.client.complete.addOnce(this.onComplete);
         this.client.sendRequest(_tY_,this._1D_2());
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         var _loc3_:Boolean = false;
         param1 && (_loc3_ = this._0E_t(int(XML(param2).toString())));
         !_loc3_ && _0et(param1,param2);
      }
      
      private function _0E_t(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         if(param1 != this._R_U_.player.credits_)
         {
            this._R_U_.player.credits_ = param1;
         }
         else if(this._ux < this._vF_.length)
         {
            this.timer.addEventListener(TimerEvent.TIMER,this._11z);
            this.timer.start();
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      private function _1D_2() : Object
      {
         var _loc1_:Object = {};
         _l5._0an(_loc1_,this.account.credentials());
         return _loc1_;
      }
   }
}
