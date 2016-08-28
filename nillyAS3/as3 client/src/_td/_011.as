package _td
{
   import ToolTips._0bd;
   import _1gF_.SimpleText;
   import _1xa._1eo;
   import flash.events.MouseEvent;
   import flash.events.Event;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   
   public class _011 extends _nl
   {
       
      
      public var _bb:String;
      
      private var _y3:String;
      
      protected var _1mG_:_0bd;
      
      protected var _Y___:SimpleText;
      
      public function _011(param1:String, param2:String, param3:String)
      {
         super();
         this._bb = param1;
         this._y3 = param3;
         this._Y___ = new SimpleText().setSize(18).setColor(11776947);
         this._Y___.setStringBuilder(new _dU_().setParams(param2));
         this._Y___.filters = [new DropShadowFilter(0,0,0,1,4,4,2)];
         this._Y___.x = KeyCodeBox.WIDTH + 24;
         this._Y___.mouseEnabled = true;
         this._Y___.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this._Y___.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         addChild(this._Y___);
         this._1mG_ = new _0bd(2565927,8553090,null,this._y3,150);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         textChanged = this._Y___.textChanged;
      }
      
      public function _0Y_a(param1:_1eo) : void
      {
         this._Y___.setStringBuilder(param1);
      }
      
      public function _0M_o(param1:_1eo) : void
      {
         this._1mG_._0D_S_(param1);
      }
      
      public function refresh() : void
      {
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         parent.addChild(this._1mG_);
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this.removeToolTip();
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         this.removeToolTip();
      }
      
      private function removeToolTip() : void
      {
         if(this._1mG_ != null && parent.contains(this._1mG_))
         {
            parent.removeChild(this._1mG_);
         }
      }
   }
}
