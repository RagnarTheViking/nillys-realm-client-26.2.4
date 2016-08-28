package _1cm
{
   import flash.display.Sprite;
   import flash.utils.Timer;
   import _1gF_._I_a;
   import _1xa._dU_;
   import flash.events.TimerEvent;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   
   public class _0e5 extends Sprite
   {
       
      
      private const _0__4:Number = 1;
      
      private const _0L_8:Number = 7;
      
      private var _0hc:Number;
      
      private var _03B_:Timer;
      
      private var _oR_:_I_a;
      
      private var _1N_y:_dU_;
      
      public function _0e5()
      {
         this._0hc = this._0oo();
         this._oR_ = this._e3();
         this._1N_y = new _dU_();
         super();
         addChild(this._oR_);
         this._oR_.setStringBuilder(this._1N_y.setParams(_1O_I_._007,{"time":this._1oN_()}));
         this._03B_ = new Timer(1000);
         this._03B_.addEventListener(TimerEvent.TIMER,this._1Z_6);
         this._03B_.start();
      }
      
      private function _1Z_6(param1:TimerEvent) : void
      {
         this._0hc = this._0hc - 1000;
         this._oR_.setStringBuilder(this._1N_y.setParams(_1O_I_._007,{"time":this._1oN_()}));
      }
      
      private function _1oN_() : String
      {
         var _loc1_:int = this._0hc;
         var _loc2_:int = Math.floor(_loc1_ / 86400000);
         _loc1_ = _loc1_ % 86400000;
         var _loc3_:int = Math.floor(_loc1_ / 3600000);
         _loc1_ = _loc1_ % 3600000;
         var _loc4_:int = Math.floor(_loc1_ / 60000);
         _loc1_ = _loc1_ % 60000;
         var _loc5_:int = Math.floor(_loc1_ / 1000);
         var _loc6_:* = "";
         if(_loc2_ > 0)
         {
            _loc6_ = _loc2_ + " days, " + _loc3_ + " hours, " + _loc4_ + " minutes";
         }
         else
         {
            _loc6_ = _loc3_ + " hours, " + _loc4_ + " minutes, " + _loc5_ + " seconds";
         }
         return _loc6_;
      }
      
      private function _0oo() : Number
      {
         var _loc1_:Date = new Date();
         var _loc2_:Date = this._ej();
         return _loc2_.getTime() - _loc1_.getTime();
      }
      
      private function _ej() : Date
      {
         var _loc1_:Date = new Date();
         if(_loc1_.dayUTC == this._0__4 && _loc1_.hoursUTC < this._0L_8)
         {
            _loc1_.setUTCHours(this._0L_8 - _loc1_.hoursUTC);
            return _loc1_;
         }
         _loc1_.setUTCHours(7);
         _loc1_.setUTCMinutes(0);
         _loc1_.setUTCSeconds(0);
         _loc1_.setUTCMilliseconds(0);
         _loc1_.setUTCDate(_loc1_.dateUTC + 1);
         while(_loc1_.dayUTC != this._0__4)
         {
            _loc1_.setUTCDate(_loc1_.dateUTC + 1);
         }
         return _loc1_;
      }
      
      private function _e3() : _I_a
      {
         var _loc1_:_I_a = null;
         _loc1_ = new _I_a();
         _loc1_.setSize(14).setColor(16567065).setBold(true);
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         return _loc1_;
      }
   }
}
