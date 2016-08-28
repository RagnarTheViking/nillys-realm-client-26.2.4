package _T_n
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _00v._1cz;
   import _00v._1yN_;
   import flash.events.MouseEvent;
   
   final class _0to extends Sprite
   {
      
      public static const WIDTH:int = _11p.WIDTH;
      
      public static const BEVEL:int = _11p.BEVEL + _11p._0ci * 0.5;
       
      
      public const clicked:Signal = new Signal(int);
      
      public const rect:_1cz = new _1cz(WIDTH,0,BEVEL);
      
      private const _pi:_1yN_ = new _1yN_();
      
      function _0to()
      {
         super();
      }
      
      public function redraw() : void
      {
         graphics.clear();
         graphics.beginFill(5526612);
         this._pi._18h(0,0,this.rect,graphics);
         graphics.endFill();
      }
      
      public function _1f1() : void
      {
         addEventListener(MouseEvent.CLICK,this._1k9);
      }
      
      public function _N_b() : void
      {
         removeEventListener(MouseEvent.CLICK,this._1k9);
      }
      
      private function _1k9(param1:MouseEvent) : void
      {
         this.clicked.dispatch(int(mouseY));
      }
   }
}
