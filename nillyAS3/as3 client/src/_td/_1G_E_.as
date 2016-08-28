package _td
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import flash.events.MouseEvent;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   
   public class _1G_E_ extends Sprite
   {
      
      private static const _0K_:int = 16;
       
      
      public var text_:String;
      
      protected var _R_E_:SimpleText;
      
      protected var selected_:Boolean;
      
      public function _1G_E_(param1:String)
      {
         super();
         this.text_ = param1;
         this._R_E_ = new SimpleText().setSize(_0K_).setColor(11776947);
         this._R_E_.setBold(true);
         this._R_E_.setStringBuilder(new _dU_().setParams(param1));
         this._R_E_.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         addChild(this._R_E_);
         this.selected_ = false;
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
      }
      
      public function setSelected(param1:Boolean) : void
      {
         this.selected_ = param1;
         this.redraw(false);
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this.redraw(true);
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this.redraw(false);
      }
      
      private function redraw(param1:Boolean) : void
      {
         this._R_E_.setSize(_0K_);
         this._R_E_.setColor(this.getColor(param1));
      }
      
      private function getColor(param1:Boolean) : uint
      {
         if(this.selected_)
         {
            return 16762880;
         }
         return !!param1?uint(16777215):uint(11776947);
      }
   }
}
