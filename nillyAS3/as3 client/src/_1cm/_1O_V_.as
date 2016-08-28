package _1cm
{
   import flash.display.Sprite;
   import flash.display.Shape;
   import _00v._1yN_;
   import _00v._1cz;
   import _1gF_.SimpleText;
   import flash.text.TextFieldAutoSize;
   import flashx.textLayout.formats.VerticalAlign;
   import _1xa._dU_;
   
   public class _1O_V_ extends Sprite
   {
       
      
      private const WIDTH:int = 174;
      
      private const HEIGHT:int = 225;
      
      private const BEVEL:int = 4;
      
      private const _0B_v:int = 6;
      
      private const _0ci:int = 8;
      
      public function _1O_V_(param1:String)
      {
         super();
         addChild(this._W_E_());
         addChild(this.makeText(param1));
      }
      
      private function _W_E_() : Shape
      {
         var _loc1_:Shape = new Shape();
         this._lr(_loc1_);
         return _loc1_;
      }
      
      private function _lr(param1:Shape) : void
      {
         var _loc2_:_1yN_ = new _1yN_();
         var _loc3_:_1cz = new _1cz(this.WIDTH,this.HEIGHT,this.BEVEL);
         var _loc4_:int = 21;
         param1.graphics.beginFill(14737632);
         _loc2_._18h(0,0,_loc3_,param1.graphics);
         param1.graphics.endFill();
         param1.graphics.beginFill(14737632);
         param1.graphics.moveTo(0,_loc4_ - this._0B_v);
         param1.graphics.lineTo(-this._0B_v,_loc4_);
         param1.graphics.lineTo(0,_loc4_ + this._0B_v);
         param1.graphics.endFill();
      }
      
      private function makeText(param1:String) : SimpleText
      {
         var _loc2_:SimpleText = new SimpleText().setSize(16).setLeading(3).setAutoSize(TextFieldAutoSize.LEFT).setVerticalAlign(VerticalAlign.TOP).setMultiLine(true).setWordWrap(true).setPosition(this._0ci,this._0ci).setTextWidth(this.WIDTH - 2 * this._0ci).setTextHeight(this.HEIGHT - 2 * this._0ci);
         _loc2_.setStringBuilder(new _dU_().setParams(param1));
         return _loc2_;
      }
   }
}
