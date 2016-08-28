package _1U_P_
{
   import flash.display.Sprite;
   import _1gF_._I_a;
   import _1xa.SText;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   import flash.filters.DropShadowFilter;
   
   public class _02M_ extends Sprite
   {
       
      
      private const _1X_N_:_I_a = this._1wF_();
      
      private const _0A_j:SText = new SText();
      
      private const timer:Timer = new Timer(1000);
      
      private var _1fI_:Number = 0;
      
      public function _02M_()
      {
         super();
      }
      
      public function start() : void
      {
         this._03B_(null);
         this.timer.addEventListener(TimerEvent.TIMER,this._03B_);
         this.timer.start();
      }
      
      public function stop() : void
      {
         this.timer.removeEventListener(TimerEvent.TIMER,this._03B_);
         this.timer.stop();
      }
      
      private function _03B_(param1:TimerEvent) : void
      {
         var _loc2_:int = this._1fI_ / 60;
         var _loc3_:int = this._1fI_ % 60;
         var _loc4_:String = _loc2_ < 10?"0":"";
         _loc4_ = _loc4_ + (_loc2_ + ":");
         _loc4_ = _loc4_ + (_loc3_ < 10?"0":"");
         _loc4_ = _loc4_ + _loc3_;
         this._1X_N_.setStringBuilder(this._0A_j.setString(_loc4_));
         this._1fI_++;
      }
      
      private function _1wF_() : _I_a
      {
         var _loc1_:_I_a = new _I_a();
         _loc1_.setSize(24).setBold(true).setColor(16777215);
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         addChild(_loc1_);
         return _loc1_;
      }
   }
}
