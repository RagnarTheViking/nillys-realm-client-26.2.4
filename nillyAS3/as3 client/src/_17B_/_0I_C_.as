package _17B_
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   import flash.text.TextFieldAutoSize;
   
   public class _0I_C_
   {
      
      private static const _Z_B_:int = 14;
       
      
      public function _0I_C_()
      {
         super();
      }
      
      public static function _Z_h() : DisplayObjectContainer
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(5460819);
         _loc1_.graphics.drawRoundRect(0,0,222,40,10,10);
         _loc1_.graphics.endFill();
         return _loc1_;
      }
      
      public static function makeText() : SimpleText
      {
         var _loc1_:SimpleText = new SimpleText();
         _loc1_.setStringBuilder(new _dU_().setParams("FusionStrength.text")).setAutoSize(TextFieldAutoSize.LEFT).setColor(FusionStrength._15__);
         _0W_o(_loc1_);
         return _loc1_;
      }
      
      public static function _wE_() : SimpleText
      {
         var _loc1_:SimpleText = new SimpleText().setAutoSize(TextFieldAutoSize.RIGHT);
         _0W_o(_loc1_);
         return _loc1_;
      }
      
      private static function _0W_o(param1:SimpleText) : void
      {
         param1.setVerticalAlign(SimpleText.MIDDLE).setSize(_Z_B_).setBold(true);
      }
   }
}
