package _0x1
{
   import flash.geom.Point;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   
   public class _1S_ extends ParticleEffect
   {
       
      
      public var start_:Point;
      
      public var go:GameObject;
      
      private var _1A_R_:Boolean;
      
      public function _1S_(param1:GameObject)
      {
         super();
         this.go = param1;
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         var _loc3_:Timer = new Timer(50,12);
         _loc3_.addEventListener(TimerEvent.TIMER,this._1xW_);
         _loc3_.start();
         return false;
      }
      
      private function _1xW_(param1:TimerEvent) : void
      {
         this._1A_R_ = !this._1A_R_;
         this.go._lG_(this._1A_R_);
      }
   }
}
