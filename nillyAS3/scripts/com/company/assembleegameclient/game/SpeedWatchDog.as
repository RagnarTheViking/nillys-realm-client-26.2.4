package com.company.assembleegameclient.game
{
   import flash.events.EventDispatcher;
   import flash.utils.getTimer;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import flash.events.StatusEvent;
   
   public class SpeedWatchDog extends EventDispatcher
   {
       
      
      protected var _tolerance:Number;
      
      protected var _prevDate:Number;
      
      protected var _prevTimer:int;
      
      protected var _interval:uint;
      
      public function SpeedWatchDog()
      {
         super();
      }
      
      public function init(param1:int = 1000, param2:Number = 0.35) : void
      {
         this._tolerance = param2;
         this._prevTimer = getTimer();
         this._prevDate = new Date().time;
         this.interval = param1;
      }
      
      public function stop() : void
      {
         clearInterval(this._interval);
      }
      
      public function get tolerance() : Number
      {
         return this._tolerance;
      }
      
      public function set tolerance(param1:Number) : void
      {
         this._tolerance = param1;
      }
      
      public function get interval() : uint
      {
         return this._interval;
      }
      
      public function set interval(param1:uint) : void
      {
         clearInterval(this._interval);
         this._interval = setInterval(this.check,param1);
      }
      
      protected function check() : void
      {
         var _loc1_:Number = new Date().time - this._prevDate;
         var _loc2_:Number = getTimer() - this._prevTimer;
         var _loc3_:Number = _loc1_ * this._tolerance;
         if(_loc2_ > _loc1_ + _loc3_ || _loc2_ < _loc1_ - _loc3_)
         {
            dispatchEvent(new StatusEvent(StatusEvent.STATUS));
         }
         this._prevTimer = getTimer();
         this._prevDate = new Date().time;
      }
   }
}
