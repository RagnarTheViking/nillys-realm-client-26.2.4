package _0oY_
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import flash.text.TextFormatAlign;
   import flash.filters.DropShadowFilter;
   import _1xa._dU_;
   import _C_._1O_I_;
   
   public class ProTipText extends Sprite
   {
       
      
      private var text:SimpleText;
      
      public function ProTipText()
      {
         super();
      }
      
      public function _pI_(param1:String) : void
      {
         this.text = new SimpleText().setSize(18).setColor(16777215).setWordWrap(true).setMultiLine(true).setTextWidth(580).setTextHeight(100).setHorizontalAlign(TextFormatAlign.CENTER);
         this.text.filters = [new DropShadowFilter(0,0,0,1,4,4,2)];
         this.text.setStringBuilder(new _dU_().setParams(_1O_I_._0zn,{"tip":param1}));
         this.text.x = -290;
         mouseEnabled = false;
         mouseChildren = false;
         addChild(this.text);
      }
   }
}
