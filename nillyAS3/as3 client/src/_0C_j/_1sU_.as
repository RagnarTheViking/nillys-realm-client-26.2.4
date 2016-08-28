package _0C_j
{
   import flash.display.Sprite;
   import flash.utils.Timer;
   import flash.display.BlendMode;
   import flash.events.Event;
   import flash.events.TimerEvent;
   
   public class _1sU_ extends Sprite
   {
       
      
      private const _1m3:Sprite = _7L_();
      
      private const _0I_0:Sprite = _0eF_();
      
      private const _0ry:Sprite = _1bb();
      
      private const timer:Timer = new Timer(25);
      
      private const radius:int = 22;
      
      private const color:uint = 16777215;
      
      public function _1sU_()
      {
         super();
         x = y = this.radius;
         this._0sF_();
         addEventListener(Event.ADDED_TO_STAGE,this._0r0);
         addEventListener(Event.REMOVED_FROM_STAGE,this._014);
      }
      
      private function _7L_() : Sprite
      {
         var _loc1_:Sprite = null;
         _loc1_ = new Sprite();
         _loc1_.blendMode = BlendMode.LAYER;
         _loc1_.graphics.beginFill(this.color);
         _loc1_.graphics.drawCircle(0,0,this.radius);
         _loc1_.graphics.endFill();
         return _loc1_;
      }
      
      private function _0eF_() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.blendMode = BlendMode.ERASE;
         _loc1_.graphics.beginFill(16777215 * 0.6);
         _loc1_.graphics.drawCircle(0,0,this.radius / 2);
         _loc1_.graphics.endFill();
         return _loc1_;
      }
      
      private function _1bb() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(16777215);
         _loc1_.graphics.drawRect(0,0,this.radius,this.radius);
         _loc1_.graphics.endFill();
         return _loc1_;
      }
      
      private function _0sF_() : void
      {
         this._1m3.addChild(this._0I_0);
         this._1m3.addChild(this._0ry);
         this._1m3.mask = this._0ry;
         addChild(this._1m3);
      }
      
      private function _0r0(param1:Event) : void
      {
         this.timer.addEventListener(TimerEvent.TIMER,this._1B_l);
         this.timer.start();
      }
      
      private function _014(param1:Event) : void
      {
         this.timer.stop();
         this.timer.removeEventListener(TimerEvent.TIMER,this._1B_l);
      }
      
      private function _1B_l(param1:TimerEvent) : void
      {
         this._0ry.rotation = this._0ry.rotation + 20;
      }
   }
}
