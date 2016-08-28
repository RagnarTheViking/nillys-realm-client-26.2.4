package _T_n
{
   import flash.display.Sprite;
   import flash.utils.Timer;
   import _1gF_.SimpleText;
   import _f7.Signal;
   import _1xa.SText;
   import _T_J_.GTween;
   import flash.events.TimerEvent;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   
   public class _8k extends Sprite
   {
      
      public static const _1n4:int = 8;
       
      
      public var _0ga:int = 0;
      
      public var _0kK_:Timer;
      
      public var text:SimpleText;
      
      public var background:_T_n._067;
      
      public var _11F_:Signal;
      
      public var _1R_n:Number = -1;
      
      public function _8k()
      {
         this._11F_ = new Signal();
         super();
         this.text = new SimpleText().setSize(40).setColor(16777215).setBold(true);
         this.text.filters = [new DropShadowFilter(0,0,0),new GlowFilter(16776960,1,1.5,1.5,4.5,1)];
         this.text.setStringBuilder(new SText("" + this._0ga));
         addChild(this.text);
         this.text.visible = false;
      }
      
      public function start(param1:int = 5) : void
      {
         if(this.text != null && this.text.parent != null)
         {
            removeChild(this.text);
         }
         this.text.setStringBuilder(new SText("" + param1));
         this.text.alpha = 0.5;
         this.text.scaleX = 1;
         this.text.scaleY = 1;
         this.text.visible = true;
         new GTween(this.text,0.25,{
            "scaleX":1.25,
            "scaleY":1.25,
            "alpha":1
         });
         addChild(this.text);
         this._0ga = param1;
         this._0kK_ = new Timer(1000,param1);
         this._0kK_.addEventListener(TimerEvent.TIMER,this._A_7);
         this._0kK_.start();
      }
      
      public function end() : void
      {
         if(this.background != null && this.background.parent != null)
         {
            removeChild(this.background);
         }
         if(this.text != null && this.text.parent != null)
         {
            removeChild(this.text);
         }
         this._0ga = 0;
         this._11F_.dispatch();
         if(this._0kK_ != null)
         {
            this._0kK_.removeEventListener(TimerEvent.TIMER,this._A_7);
            this._0kK_.reset();
         }
      }
      
      public function remove() : void
      {
         if(this.background != null && this.background.parent != null)
         {
            removeChild(this.background);
         }
         if(this.text != null && this.text.parent != null)
         {
            removeChild(this.text);
         }
         this._0ga = 0;
         this._0kK_.removeEventListener(TimerEvent.TIMER,this._A_7);
         this._0kK_.reset();
      }
      
      public function _1zO_() : Boolean
      {
         return this._0ga != 0;
      }
      
      public function _A_7(param1:TimerEvent) : void
      {
         this._0ga--;
         if(this._0ga == 0)
         {
            this.end();
         }
         else
         {
            this.text.setStringBuilder(new SText("" + this._0ga));
            this.text.alpha = 0.5;
            this.text.scaleX = 1;
            this.text.scaleY = 1;
            if(this._0ga == 9 || this._0ga == 99)
            {
               this._14D_();
            }
            new GTween(this.text,0.25,{
               "scaleX":1.25,
               "scaleY":1.25,
               "alpha":1
            });
         }
      }
      
      public function setXPos(param1:Number) : void
      {
         this._1R_n = param1;
         this.x = this._1R_n - this.width * 1.25 / 2;
      }
      
      public function _14D_() : void
      {
         this.x = this._1R_n - this.width * 1.25 / 2;
      }
      
      public function setYPos(param1:Number) : void
      {
         this.y = param1 - this.height * 1.25 / 2;
      }
      
      public function getCenterX() : Number
      {
         return this.x + this.width / 2;
      }
      
      public function getCenterY() : Number
      {
         return this.y + this.height / 2;
      }
   }
}
