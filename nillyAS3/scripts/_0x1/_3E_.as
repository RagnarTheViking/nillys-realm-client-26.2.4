package _0x1
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.utils.Timer;
   import com.company.util.TextureLibrary;
   import com.company.util._n5;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import flash.events.TimerEvent;
   
   public class _3E_ extends ParticleEffect
   {
      
      public static var _i1:Vector.<BitmapData>;
       
      
      public var start_:Point;
      
      public var end_:Point;
      
      public var objectId:uint;
      
      public var go:GameObject;
      
      private var _147:Number;
      
      private var _16F_:Number;
      
      private var _T_5:Number;
      
      private var _0vx:uint;
      
      private var timer:Timer;
      
      private var _0Y_T_:Boolean = false;
      
      public function _3E_(param1:GameObject)
      {
         super();
         this.go = param1;
         if(param1.texture_.height == 8)
         {
            this._147 = 0.4;
            this._16F_ = 1.3;
            this._0vx = 30;
         }
         else
         {
            this._147 = 0.7;
            this._16F_ = 2;
            this._0vx = 40;
         }
      }
      
      private function _1wB_() : void
      {
         var _loc1_:uint = 0;
         _i1 = new Vector.<BitmapData>();
         var _loc2_:_n5 = TextureLibrary._0R_8("lofiParticlesShocker");
         var _loc3_:uint = 9;
         _loc1_ = 0;
         while(_loc1_ < _loc3_)
         {
            _i1.push(TextureRedrawer.redraw(_loc2_._0D_y[_loc1_],this._0vx,true,0,true));
            _loc1_++;
         }
      }
      
      override public function update(param1:int, param2:int) : Boolean
      {
         if(this._0Y_T_)
         {
            return false;
         }
         if(!this.timer)
         {
            this.initialize();
         }
         x_ = this.go.x_;
         y_ = this.go.y_;
         return true;
      }
      
      private function initialize() : void
      {
         this.timer = new Timer(200,10);
         this.timer.addEventListener(TimerEvent.TIMER,this._1xW_);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this._1N_i);
         this.timer.start();
         this._1wB_();
      }
      
      private function _1xW_(param1:TimerEvent) : void
      {
         if(map_)
         {
            this._T_5 = int(Math.random() * 360) * (Math.PI / 180);
            this.start_ = new Point(this.go.x_ + Math.sin(this._T_5) * this._147,this.go.y_ + Math.cos(this._T_5) * this._147);
            this.end_ = new Point(this.go.x_ + Math.sin(this._T_5) * this._16F_,this.go.y_ + Math.cos(this._T_5) * this._16F_);
            map_.addObj(new _1wA_(this.objectId,25,this._0vx,this.start_,this.end_,this._T_5,this.go,_i1),this.start_.x,this.start_.y);
         }
      }
      
      private function _1N_i(param1:TimerEvent) : void
      {
         this.destroy();
      }
      
      public function destroy() : void
      {
         if(this.timer)
         {
            this.timer.removeEventListener(TimerEvent.TIMER,this._1xW_);
            this.timer.removeEventListener(TimerEvent.TIMER,this._1N_i);
            this.timer.stop();
            this.timer = null;
         }
         this.go = null;
         this._0Y_T_ = true;
      }
      
      override public function removeFromMap() : void
      {
         this.destroy();
         super.removeFromMap();
      }
   }
}
