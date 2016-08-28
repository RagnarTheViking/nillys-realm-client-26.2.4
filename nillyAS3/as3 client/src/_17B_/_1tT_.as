package _17B_
{
   import flash.display.Sprite;
   import flash.display.Shape;
   import _1gF_.SimpleText;
   import flash.text.TextFieldAutoSize;
   import flashx.textLayout.formats.VerticalAlign;
   import _1xa._dU_;
   import _00v._1yN_;
   import _00v._1cz;
   
   public class _1tT_ extends Sprite
   {
       
      
      private const WIDTH:int = 235;
      
      private const HEIGHT:int = 252;
      
      private const BEVEL:int = 4;
      
      private const _0B_v:int = 6;
      
      private const _14K_:int = 25;
      
      private const _0ci:int = 8;
      
      private const _03o:Shape = new Shape();
      
      private const _16N_:SimpleText = makeText();
      
      public function _1tT_()
      {
         super();
         addChild(this._03o);
         addChild(this._16N_);
      }
      
      private function makeText() : SimpleText
      {
         return new SimpleText().setSize(16).setLeading(3).setAutoSize(TextFieldAutoSize.LEFT).setVerticalAlign(VerticalAlign.TOP).setMultiLine(true).setWordWrap(true).setPosition(this._0ci,this._0ci).setTextWidth(this.WIDTH - 2 * this._0ci).setTextHeight(this.HEIGHT - 2 * this._0ci);
      }
      
      public function _0D_S_(param1:String) : void
      {
         this._16N_.setStringBuilder(new _dU_().setParams(param1));
         this._16N_.textChanged.add(this._iT_);
      }
      
      private function _iT_() : void
      {
         this._W_E_();
      }
      
      private function _W_E_() : void
      {
         var _loc1_:_1yN_ = new _1yN_();
         var _loc2_:_1cz = new _1cz(this.WIDTH,this._16N_.height + 16,this.BEVEL);
         this._03o.graphics.beginFill(14737632);
         _loc1_._18h(0,0,_loc2_,this._03o.graphics);
         this._03o.graphics.endFill();
         this._03o.graphics.beginFill(14737632);
         this._03o.graphics.moveTo(this._14K_ - this._0B_v,0);
         this._03o.graphics.lineTo(this._14K_,-this._0B_v);
         this._03o.graphics.lineTo(this._14K_ + this._0B_v,0);
         this._03o.graphics.endFill();
      }
   }
}
