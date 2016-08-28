package ToolTips
{
   import _1gF_.SimpleText;
   import com.company.rotmg.graphics.StarGraphic;
   import com.company.assembleegameclient.ui._0fL_;
   import flash.geom.ColorTransform;
   import flash.geom.Rectangle;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.assembleegameclient.util.Star;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   import _05g._1S_m;
   
   public class RankToolTip extends ToolTip
   {
      
      private static const _1yu:int = 6;
       
      
      private var _1K_z:SimpleText;
      
      private var star_:StarGraphic;
      
      private var _1W_t:SimpleText;
      
      private var _1__B_:_0fL_;
      
      public function RankToolTip(param1:int)
      {
         this._1__B_ = new _0fL_(100,1842204);
         super(3552822,1,16777215,1);
         this._1K_z = new SimpleText().setSize(13).setColor(11776947).setBold(true);
         this._1K_z.setVerticalAlign(SimpleText.BOTTOM);
         this._1K_z.setStringBuilder(new _dU_().setParams(_1O_I_._xX_,{"numStars":param1}));
         this._1K_z.filters = [new DropShadowFilter(0,0,0)];
         this._1K_z.x = _1yu;
         addChild(this._1K_z);
         this._1W_t = new SimpleText().setSize(13).setColor(11776947);
         this._1W_t.setTextWidth(174);
         this._1W_t.setMultiLine(true).setWordWrap(true);
         this._1W_t.setStringBuilder(new _dU_().setParams(_1O_I_._0sk));
         this._1W_t.filters = [new DropShadowFilter(0,0,0)];
         this._1W_t.x = _1yu;
         this._1W_t.y = 30;
         addChild(this._1W_t);
         var _loc2_:_1S_m = new _1S_m().push(this._1K_z.textChanged).push(this._1W_t.textChanged);
         _loc2_.complete.addOnce(this._1m9);
      }
      
      private function _1m9() : void
      {
         var _loc1_:LegendLine = null;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         this._1K_z.y = this._1K_z.height + 2;
         this.star_ = new StarGraphic();
         this.star_.transform.colorTransform = new ColorTransform(179 / 255,179 / 255,179 / 255);
         var _loc3_:Rectangle = this._1K_z.getBounds(this);
         this.star_.x = _loc3_.right + 7;
         this.star_.y = this._1K_z.y - this.star_.height;
         addChild(this.star_);
         this._1__B_.x = _1yu;
         this._1__B_.y = height + 10;
         addChild(this._1__B_);
         _loc2_ = this._1__B_.y + 4;
         while(_loc4_ < Star.Colors.length)
         {
            _loc1_ = new LegendLine(_loc4_ * ObjectLibrary._1bS_.length,(_loc4_ + 1) * ObjectLibrary._1bS_.length - 1,Star.Colors[_loc4_]);
            _loc1_.x = _1yu;
            _loc1_.y = _loc2_;
            addChild(_loc1_);
            _loc2_ = _loc2_ + _loc1_.height;
            _loc4_++;
         }
         _loc1_ = new LegendLine(Star._0xr(),Star._0xr(),new ColorTransform());
         _loc1_.x = _1yu;
         _loc1_.y = _loc2_;
         addChild(_loc1_);
         this.draw();
      }
      
      override public function draw() : void
      {
         this._1__B_._0Z_i(width - 10,1842204);
         super.draw();
      }
   }
}

import flash.display.Sprite;
import com.company.rotmg.graphics.StarGraphic;
import _1gF_.SimpleText;
import flash.geom.ColorTransform;
import _1xa.SText;
import flash.filters.DropShadowFilter;

class LegendLine extends Sprite
{
    
   
   private var coloredStar_:StarGraphic;
   
   private var rangeText_:SimpleText;
   
   private var star_:StarGraphic;
   
   function LegendLine(param1:int, param2:int, param3:ColorTransform)
   {
      super();
      this.addColoredStar(param3);
      this.addRangeText(param1,param2);
      this.addGreyStar();
   }
   
   public function addGreyStar() : void
   {
      this.star_ = new StarGraphic();
      this.star_.transform.colorTransform = new ColorTransform(179 / 255,179 / 255,179 / 255);
      addChild(this.star_);
   }
   
   public function addRangeText(param1:int, param2:int) : void
   {
      this.rangeText_ = new SimpleText().setSize(13).setColor(11776947);
      this.rangeText_.setVerticalAlign(SimpleText.BOTTOM);
      this.rangeText_.setStringBuilder(new SText(": " + (param1 == param2?param1.toString():param1 + " - " + param2)));
      this.rangeText_.setBold(true);
      filters = [new DropShadowFilter(0,0,0)];
      this.rangeText_.x = this.coloredStar_.width;
      this.rangeText_.y = this.coloredStar_.getBounds(this).bottom;
      this.rangeText_.textChanged.addOnce(this.positionGreyStar);
      addChild(this.rangeText_);
   }
   
   public function addColoredStar(param1:ColorTransform) : void
   {
      this.coloredStar_ = new StarGraphic();
      this.coloredStar_.transform.colorTransform = param1;
      this.coloredStar_.y = 4;
      addChild(this.coloredStar_);
   }
   
   private function positionGreyStar() : void
   {
      this.star_.x = this.rangeText_.getBounds(this).right + 2;
      this.star_.y = 4;
   }
}
