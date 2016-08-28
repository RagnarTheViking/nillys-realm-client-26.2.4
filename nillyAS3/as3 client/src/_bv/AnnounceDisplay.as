package _bv
{
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   import _0H_6.GameContext;
   import _C_._0C_J_;
   
   public class AnnounceDisplay extends Sprite
   {
      
      private static var _ql:String = "";
       
      
      private const WIDTH:int = 280;
      
      private const HEIGHT:int = 25;
      
      private const _Z_l:int = 2;
      
      private const _gY_:String = "                                                                               ";
      
      private const _5t:String = "                                                                                ";
      
      public var _sX_:TextField;
      
      private var timer:Timer;
      
      private var _07r:uint = 0;
      
      private var _lb:int = 0;
      
      public function AnnounceDisplay()
      {
         super();
         this._sX_ = this._R_z();
         this.timer = new Timer(0.17,0);
         this._1W_A_();
         this.align();
         this.visible = false;
         if(_ql != "")
         {
            this._1zm(_ql);
            _ql = "";
         }
      }
      
      public static function _1oW_(param1:String) : void
      {
         _ql = param1;
      }
      
      public function _1zm(param1:String) : void
      {
         if(this.visible == false)
         {
            this.visible = true;
            this._sX_.text = this._gY_ + param1 + this._5t;
            this.timer.addEventListener(TimerEvent.TIMER,this._1eE_);
            this._07r = 1;
            this.timer.start();
            return;
         }
      }
      
      private function _1eE_(param1:TimerEvent) : void
      {
         this.timer.stop();
         if(this._sX_.scrollH < this._sX_.maxScrollH)
         {
            this._lb++;
            this._sX_.scrollH = this._lb;
            this.timer.start();
         }
         else if(this._07r >= 1 && this._07r < this._Z_l)
         {
            this._07r++;
            this._lb = 0;
            this._sX_.scrollH = 0;
            this.timer.start();
         }
         else
         {
            this._07r = 0;
            this._lb = 0;
            this._sX_.scrollH = 0;
            this.timer.removeEventListener(TimerEvent.TIMER,this._1eE_);
            this.visible = false;
         }
      }
      
      private function align() : void
      {
         this._sX_.x = 5;
         this._sX_.y = 2;
      }
      
      private function _1W_A_() : void
      {
         graphics.beginFill(0,0.4);
         graphics.drawRoundRect(0,0,this.WIDTH,this.HEIGHT,12,12);
         graphics.endFill();
      }
      
      private function _R_z() : TextField
      {
         var _loc1_:TextField = null;
         _loc1_ = new TextField();
         var _loc2_:_0C_J_ = GameContext.getInjector().getInstance(_0C_J_);
         _loc2_.apply(_loc1_,16,16777215,false);
         _loc1_.selectable = false;
         _loc1_.doubleClickEnabled = false;
         _loc1_.mouseEnabled = false;
         _loc1_.mouseWheelEnabled = false;
         _loc1_.text = "";
         _loc1_.wordWrap = false;
         _loc1_.multiline = false;
         _loc1_.selectable = false;
         _loc1_.width = this.WIDTH - 10;
         _loc1_.height = 25;
         addChild(_loc1_);
         return _loc1_;
      }
   }
}
