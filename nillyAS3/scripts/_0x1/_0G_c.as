package _0x1
{
   import flash.geom.Point;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   
   public class _0G_c extends ParticleEffect
   {
       
      
      public var start_:Point;
      
      public var go:GameObject;
      
      private var _03C_:Number;
      
      private var _oT_:Number;
      
      private var _B_I_:_0x1.ParticleField;
      
      private var time:uint;
      
      private var timer:Timer;
      
      private var _1T_U_:Boolean;
      
      public function _0G_c(param1:GameObject, param2:uint)
      {
         super();
         this.go = param1;
         this._03C_ = Math.floor(param1.x_ * 10) / 10;
         this._oT_ = Math.floor(param1.y_ * 10) / 10;
         this.time = param2;
         this._1__g();
         this._S_q();
      }
      
      private function _1__g() : void
      {
         var _loc1_:uint = this.go.texture_.height == 8?uint(50):uint(30);
         this.timer = new Timer(_loc1_,Math.round(this.time / _loc1_));
         this.timer.addEventListener(TimerEvent.TIMER,this._1xW_);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this._1cC_);
         this.timer.start();
      }
      
      private function _1xW_(param1:TimerEvent) : void
      {
         var _loc2_:Number = Math.floor(this.go.x_ * 10) / 10;
         var _loc3_:Number = Math.floor(this.go.y_ * 10) / 10;
         if(this._03C_ != _loc2_ || this._oT_ != _loc3_)
         {
            this.timer.stop();
            this._B_I_.destroy();
         }
      }
      
      private function _1cC_(param1:TimerEvent) : void
      {
         this._B_I_.destroy();
         var _loc2_:Timer = new Timer(33,12);
         _loc2_.addEventListener(TimerEvent.TIMER,this._iK_);
         _loc2_.start();
      }
      
      private function _iK_(param1:TimerEvent) : void
      {
         this._1T_U_ = !this._1T_U_;
         this.go._1Z_9(this._1T_U_);
      }
      
      private function _S_q() : void
      {
         this._B_I_ = new _0x1.ParticleField(this.go.texture_.width,this.go.texture_.height);
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         map_.addObj(this._B_I_,this.go.x_,this.go.y_);
         return false;
      }
   }
}
