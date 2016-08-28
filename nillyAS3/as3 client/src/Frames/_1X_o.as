package Frames
{
   import flash.display.Sprite;
   import _K_t._fr;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import _T_n._0fJ_;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   import flash.events.MouseEvent;
   
   public class _1X_o extends Sprite implements _fr
   {
      
      public static const HEIGHT:int = 28;
       
      
      public const _1bE_:Signal = new Signal();
      
      private var label:String;
      
      private var text:SimpleText;
      
      private var button:_0fJ_;
      
      public function _1X_o(param1:String)
      {
         super();
         this.label = param1;
         this._0A_L_();
         this._nC_();
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         this.text.textChanged.add(this.onTextChanged);
      }
      
      private function onTextChanged() : void
      {
         this.text.y = this.button.height / 2 - this.text.height / 2;
         this._1bE_.dispatch();
      }
      
      public function getValue() : String
      {
         return this.label;
      }
      
      private function _0A_L_() : void
      {
         this.button = new _0fJ_();
         addChild(this.button);
      }
      
      private function _nC_() : void
      {
         this.text = new SimpleText().setSize(18).setColor(16777215).setBold(true);
         this.text.setStringBuilder(new _dU_().setParams(this.label));
         this.text.filters = [new DropShadowFilter(0,0,0)];
         this.text.x = HEIGHT + 8;
         addChild(this.text);
      }
      
      public function setSelected(param1:Boolean) : void
      {
         this.button.setSelected(param1);
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this.text.setColor(16768133);
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this.text.setColor(16777215);
      }
   }
}
