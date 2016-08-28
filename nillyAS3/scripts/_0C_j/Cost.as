package _0C_j
{
   import flash.display.Sprite;
   import flash.display.DisplayObject;
   import _1gF_.SimpleText;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import flash.display.Bitmap;
   import com.company.util.TextureLibrary;
   import _1xa.SText;
   
   public class Cost extends Sprite
   {
       
      
      private const lofiObj3:String = "lofiObj3";
      
      var _0jB_:DisplayObject;
      
      var text:SimpleText;
      
      public function Cost()
      {
         this.text = new SimpleText().setSize(18).setColor(16777215);
         super();
      }
      
      public function init(param1:int) : void
      {
         var _loc2_:BitmapData = this.getCurrencyIcon(param1);
         _loc2_ = TextureRedrawer.redraw(_loc2_,40,true,0);
         this._0jB_ = new Bitmap(_loc2_);
         addChild(this._0jB_);
         addChild(this.text);
         this._0jB_.x = -this._0jB_.width - 8;
         this._0jB_.y = -this._0jB_.height / 2 - 6;
         this.text.textChanged.add(this.onTextChanged);
      }
      
      private function getCurrencyIcon(param1:int) : BitmapData
      {
         switch(param1)
         {
            case 1:
               return TextureLibrary.getBitmap(this.lofiObj3,224);
            case 2:
               return TextureLibrary.getBitmap(this.lofiObj3,226);
            case 3:
               return TextureLibrary.getBitmap(this.lofiObj3,1172);
            default:
               return TextureLibrary.getBitmap(this.lofiObj3,225);
         }
      }
      
      private function onTextChanged() : void
      {
         this.text.x = this._0jB_.x - this.text.width + 4;
         this.text.y = -this.text.height / 2 - 6;
      }
      
      public function _5u(param1:int) : void
      {
         this.text.setStringBuilder(new SText(String(param1)));
      }
   }
}
