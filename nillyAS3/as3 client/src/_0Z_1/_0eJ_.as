package _0Z_1
{
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui.Button;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.game.GameSprite;
   import flash.text.TextFieldAutoSize;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   
   public class _0eJ_ extends Panel
   {
       
      
      private var _7H_:SimpleText;
      
      protected var _19t:Button;
      
      public function _0eJ_(param1:GameSprite, param2:String, param3:String)
      {
         super(param1);
         this._7H_ = new SimpleText().setSize(18).setColor(16777215).setTextWidth(WIDTH).setHTML(true).setWordWrap(true).setMultiLine(true).setAutoSize(TextFieldAutoSize.CENTER);
         this._7H_.setBold(true);
         this._7H_.setStringBuilder(new _dU_().setParams(param2).setPrefix("<p align=\"center\">").setPostfix("</p>"));
         this._7H_.filters = [new DropShadowFilter(0,0,0)];
         this._7H_.y = 6;
         addChild(this._7H_);
         this._19t = new Button(16,param3);
         this._19t.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         this._19t.textChanged.addOnce(this._17U_);
         addChild(this._19t);
      }
      
      private function _17U_() : void
      {
         this._19t.x = WIDTH / 2 - this._19t.width / 2;
         this._19t.y = HEIGHT - this._19t.height - 4;
      }
      
      protected function onButtonClick(param1:MouseEvent) : void
      {
      }
   }
}
