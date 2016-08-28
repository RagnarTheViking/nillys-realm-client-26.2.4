package _0S_u
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import _09j._0ob;
   import _1xa.SText;
   
   public class _0Y_t extends Sprite
   {
       
      
      private var _textField:SimpleText;
      
      private var _7t:_0ob;
      
      public function _0Y_t(param1:SimpleText)
      {
         this._7t = new _0ob();
         super();
         this._1d__(param1);
      }
      
      private function _1d__(param1:SimpleText) : void
      {
         addChild(this._textField = param1);
      }
      
      public function update(param1:Number) : void
      {
         this._textField.setStringBuilder(new SText(this._7t._9l(param1)));
      }
   }
}
