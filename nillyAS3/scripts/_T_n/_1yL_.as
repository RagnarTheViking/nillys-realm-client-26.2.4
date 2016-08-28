package _T_n
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _00v._1cz;
   import _00v._1yN_;
   import flash.events.MouseEvent;
   import flash.events.Event;
   
   final class _1yL_ extends Sprite
   {
      
      public static const WIDTH:int = _11p.WIDTH;
      
      public static const BEVEL:int = _11p.BEVEL;
      
      public static const _0ci:int = _11p._0ci;
       
      
      public const _4b:Signal = new Signal(int);
      
      public const rect:_1cz = new _1cz(WIDTH - _0ci * 2,0,BEVEL);
      
      private const _pi:_1yN_ = new _1yN_();
      
      private var _G_S_:Number;
      
      private var _0C_g:Boolean;
      
      private var _qM_:Boolean;
      
      function _1yL_()
      {
         super();
      }
      
      public function redraw() : void
      {
         var _loc1_:int = this._0C_g || this._qM_?16767876:13421772;
         graphics.clear();
         graphics.beginFill(_loc1_);
         this._pi._18h(_0ci,0,this.rect,graphics);
         graphics.endFill();
      }
      
      public function _1f1() : void
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      public function _N_b() : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.onMouseUp();
      }
      
      private function onMouseDown(param1:MouseEvent = null) : void
      {
         this._qM_ = true;
         this._G_S_ = parent.mouseY - y;
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         addEventListener(Event.ENTER_FRAME,this._0W_6);
         this.redraw();
      }
      
      private function onMouseUp(param1:MouseEvent = null) : void
      {
         this._qM_ = false;
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         removeEventListener(Event.ENTER_FRAME,this._0W_6);
         this.redraw();
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this._0C_g = true;
         this.redraw();
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this._0C_g = false;
         this.redraw();
      }
      
      private function _0W_6(param1:Event) : void
      {
         this._4b.dispatch(int(parent.mouseY - this._G_S_));
      }
   }
}
