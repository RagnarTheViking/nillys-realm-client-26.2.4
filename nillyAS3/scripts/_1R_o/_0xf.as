package _1R_o
{
   import flash.display.Sprite;
   import _1T_4._1K_2;
   import _1T_4._q6;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.events.Event;
   
   public class _0xf implements _Y_5
   {
       
      
      public var tooltip:Sprite;
      
      private var _0ee:_1K_2;
      
      private var showToolTip:_q6;
      
      private var displayObject:DisplayObject;
      
      public function _0xf()
      {
         super();
      }
      
      public function _bD_(param1:DisplayObject) : void
      {
         this.displayObject = param1;
         this.displayObject.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.displayObject.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.displayObject.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      public function _uZ_() : void
      {
         if(this.displayObject != null)
         {
            this.displayObject.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
            this.displayObject.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
            this.displayObject.removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
            this.displayObject = null;
         }
      }
      
      public function _9E_() : DisplayObject
      {
         return this.displayObject;
      }
      
      public function _0A_A_(param1:_q6) : void
      {
         this.showToolTip = param1;
      }
      
      public function _23() : _q6
      {
         return this.showToolTip;
      }
      
      public function _0hm(param1:_1K_2) : void
      {
         this._0ee = param1;
      }
      
      public function _fn() : _1K_2
      {
         return this._0ee;
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         if(this.tooltip != null && this.tooltip.parent != null)
         {
            this._0ee.dispatch();
         }
         this.displayObject.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.displayObject.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         this.displayObject.removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this._0ee.dispatch();
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this.showToolTip.dispatch(this.tooltip);
      }
   }
}
