package _0hx
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _04m.Timespan;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   import flash.events.MouseEvent;
   
   public class _1y4 extends Sprite
   {
      
      private static const _1ob:int = 16567065;
      
      private static const _181:int = 16777215;
      
      private static const _0__I_:int = 11711154;
       
      
      public const selected:Signal = new Signal(_1y4);
      
      private var timespan:Timespan;
      
      private var label:SimpleText;
      
      private var _0C_g:Boolean;
      
      private var _qM_:Boolean;
      
      private var _1rA_:Boolean;
      
      public function _1y4(param1:Timespan)
      {
         super();
         this.timespan = param1;
         this._Q_8(param1);
         this._1f1();
         this.redraw();
      }
      
      public function _1pG_() : Timespan
      {
         return this.timespan;
      }
      
      private function _Q_8(param1:Timespan) : void
      {
         this.label = new SimpleText().setSize(20).setColor(16777215);
         this.label.setBold(true);
         this.label.setStringBuilder(new _dU_().setParams(param1.getName()));
         this.label.x = 2;
         addChild(this.label);
      }
      
      private function _1f1() : void
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         addEventListener(MouseEvent.CLICK,this._1k9);
      }
      
      private function _1k9(param1:MouseEvent) : void
      {
         this.selected.dispatch(this);
      }
      
      private function redraw() : void
      {
         if(this._0C_g)
         {
            this.label.setColor(_1ob);
         }
         else if(this._1rA_ || this._qM_)
         {
            this.label.setColor(_181);
         }
         else
         {
            this.label.setColor(_0__I_);
         }
      }
      
      public function _u5(param1:Boolean) : void
      {
         this._1rA_ = param1;
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
         this._qM_ = false;
         this.redraw();
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this._qM_ = true;
         this.redraw();
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this._qM_ = false;
         this.redraw();
      }
   }
}
