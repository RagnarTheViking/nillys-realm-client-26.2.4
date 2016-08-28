package _1S_e
{
   import _0Z_1.Panel;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   import flash.text.TextFieldAutoSize;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   import com.company.assembleegameclient.game.GameSprite;
   
   public class TextPanel extends Panel
   {
       
      
      private var textField:SimpleText;
      
      private var _0X_v:Number;
      
      private var _0F_p:Number;
      
      public function TextPanel(param1:GameSprite)
      {
         super(param1);
         this._0T_G_();
      }
      
      public function init(param1:String) : void
      {
         this.textField.setStringBuilder(new _dU_().setParams(param1));
         this.textField.setAutoSize(TextFieldAutoSize.CENTER).setVerticalAlign(SimpleText.MIDDLE);
         this.textField.x = WIDTH / 2;
         this.textField.y = HEIGHT / 2;
      }
      
      private function _0T_G_() : void
      {
         this.textField = new SimpleText().setSize(16).setColor(16777215);
         this.textField.setBold(true);
         this.textField.setStringBuilder(new _dU_().setParams(_1O_I_._185));
         this.textField.filters = [new DropShadowFilter(0,0,0)];
         addChild(this.textField);
      }
   }
}
