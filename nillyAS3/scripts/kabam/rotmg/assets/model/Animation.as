package kabam.rotmg.assets.model
{
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   
   public class Animation extends Sprite
   {
       
      
      private const _zO_:int = 200;
      
      private const _1t6:Bitmap = this.makeBitmap();
      
      private const _M_s:Vector.<BitmapData> = new Vector.<BitmapData>(0);
      
      private const timer:Timer = this._1eq();
      
      private var _1uc:Boolean;
      
      private var index:int;
      
      private var count:uint;
      
      private var disposed:Boolean;
      
      public function Animation()
      {
         super();
      }
      
      private function makeBitmap() : Bitmap
      {
         var _loc1_:Bitmap = new Bitmap();
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1eq() : Timer
      {
         var _loc1_:Timer = new Timer(this._zO_);
         _loc1_.addEventListener(TimerEvent.TIMER,this._0W_6);
         return _loc1_;
      }
      
      public function _c6() : int
      {
         return this.timer.delay;
      }
      
      public function _026(param1:int) : void
      {
         this.timer.delay = param1;
      }
      
      public function _B_4(... rest) : void
      {
         var _loc2_:BitmapData = null;
         this._M_s.length = 0;
         this.index = 0;
         for each(_loc2_ in rest)
         {
            this.count = this._M_s.push(_loc2_);
         }
         if(this._1uc)
         {
            this.start();
         }
         else
         {
            this._0W_6();
         }
      }
      
      public function _00U_(param1:BitmapData) : void
      {
         this.count = this._M_s.push(param1);
         this._1uc && this.start();
      }
      
      public function start() : void
      {
         if(!this._1uc && this.count > 0)
         {
            this.timer.start();
            this._0W_6();
         }
         this._1uc = true;
      }
      
      public function stop() : void
      {
         this._1uc && this.timer.stop();
         this._1uc = false;
      }
      
      private function _0W_6(param1:TimerEvent = null) : void
      {
         this.index = ++this.index % this.count;
         this._1t6.bitmapData = this._M_s[this.index];
      }
      
      public function dispose() : void
      {
         var _loc1_:BitmapData = null;
         this.disposed = true;
         this.stop();
         this.index = 0;
         this.count = 0;
         this._M_s.length = 0;
         for each(_loc1_ in this._M_s)
         {
            _loc1_.dispose();
         }
      }
      
      public function _1Z_M_() : Boolean
      {
         return this._1uc;
      }
      
      public function _0fO_() : Boolean
      {
         return this.disposed;
      }
   }
}
