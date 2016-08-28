package _0oY_
{
   import flash.display.Sprite;
   import _T_J_.GTween;
   import flash.filters.GlowFilter;
   
   public class _1O_a extends Sprite
   {
       
      
      private var text:_0oY_.ProTipText;
      
      public function _1O_a()
      {
         super();
         this.text = new _0oY_.ProTipText();
         this.text.x = 300;
         this.text.y = 125;
         addChild(this.text);
         filters = [new GlowFilter(0,1,3,3,2,1)];
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      public function _pI_(param1:String) : void
      {
         this.text._pI_(param1);
         var _loc2_:GTween = new GTween(this,5,{"alpha":0});
         _loc2_.delay = 5;
         _loc2_.onComplete = this._1de;
      }
      
      private function _1de(param1:GTween) : void
      {
         parent && parent.removeChild(this);
      }
   }
}
