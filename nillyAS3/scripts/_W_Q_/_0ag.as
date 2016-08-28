package _W_Q_
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import flash.events.Event;
   import _1xa._dU_;
   import _ju._0O_M_;
   import com.company.rotmg.graphics.ScreenGraphic;
   import flash.text.TextFieldAutoSize;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   
   public class _0ag extends Sprite
   {
       
      
      private var text:SimpleText;
      
      public function _0ag()
      {
         this.text = new SimpleText();
         super();
         addChild(new _0O_M_());
         addChild(new ScreenGraphic());
         this.text.setSize(30).setColor(16777215).setVerticalAlign(SimpleText.MIDDLE).setAutoSize(TextFieldAutoSize.CENTER).setBold(true);
         this.text.y = 550;
         addEventListener(Event.ADDED_TO_STAGE,this._0r0);
         this.text.setStringBuilder(new _dU_().setParams(_1O_I_._0jq));
         this.text.filters = [new DropShadowFilter(0,0,0,1,4,4)];
         addChild(this.text);
      }
      
      private function _0r0(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this._0r0);
         stage;
         this.text.x = 800 / 2;
      }
      
      public function _1nb(param1:String) : void
      {
         this.text.setStringBuilder(new _dU_().setParams(param1));
      }
   }
}
