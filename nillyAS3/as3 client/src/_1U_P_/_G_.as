package _1U_P_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1gF_._I_a;
   import _04h._11o;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import _1xa._dU_;
   
   public class _G_ extends Sprite
   {
      
      private static const _1ob:int = 16567065;
      
      private static const _181:int = 16777215;
      
      private static const _0__I_:int = 11711154;
       
      
      public const _0zZ_:Signal = label.textChanged;
      
      public const selected:Signal = new Signal(_G_);
      
      public var label:_I_a;
      
      private var filter:_11o;
      
      private var _0C_g:Boolean;
      
      private var _qM_:Boolean;
      
      private var _1rA_:Boolean = false;
      
      public function _G_(param1:_11o)
      {
         this.label = this._Q_8();
         super();
         this.filter = param1;
         this.label.setStringBuilder(new _dU_().setParams(param1.getName()));
         addChild(this.label);
         this._1f1();
      }
      
      public function destroy() : void
      {
         this._N_b();
      }
      
      public function _1A_v() : _11o
      {
         return this.filter;
      }
      
      public function setSelected(param1:Boolean) : void
      {
         this._1rA_ = param1;
         this.redraw();
      }
      
      private function _1f1() : void
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         addEventListener(MouseEvent.CLICK,this._1k9);
      }
      
      private function _N_b() : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         removeEventListener(MouseEvent.CLICK,this._1k9);
      }
      
      private function _1k9(param1:MouseEvent) : void
      {
         if(!this._1rA_)
         {
            this.selected.dispatch(this);
         }
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
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this._qM_ = false;
         this.redraw();
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this._qM_ = true;
         this.redraw();
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this._0C_g = false;
         this._qM_ = false;
         this.redraw();
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this._0C_g = true;
         this.redraw();
      }
      
      private function _Q_8() : _I_a
      {
         var _loc1_:_I_a = null;
         _loc1_ = new _I_a();
         _loc1_.setBold(true).setColor(11776947).setSize(20);
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         return _loc1_;
      }
   }
}
