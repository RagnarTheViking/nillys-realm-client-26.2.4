package _1S_e
{
   import flash.display.Sprite;
   import _1R_o._Y_5;
   import _1R_o._0xf;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import _1gF_.SimpleText;
   import ToolTips._0bd;
   import _1T_4._q6;
   import _1T_4._1K_2;
   import flash.geom.Rectangle;
   import _C_._1O_I_;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util.TextureLibrary;
   import _T_E_._0Z_v;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   
   public class GiftDisplay extends Sprite implements _Y_5
   {
      
      public static const _U_1:String = "lofiObj2";
      
      public static const _1qM_:int = 127;
      
      public static const _8v:Number = 110;
      
      public static const _0dM_:Number = 25;
      
      public static const _1jZ_:Number = 0.4;
      
      public static const _1____:Number = 0;
       
      
      public var _18D_:_0xf;
      
      private var _1t6:Bitmap;
      
      private var background:Sprite;
      
      private var _2__6:BitmapData;
      
      private var text:SimpleText;
      
      private var tooltip:_0bd;
      
      public function GiftDisplay()
      {
         var _loc1_:Rectangle = null;
         this._18D_ = new _0xf();
         this.tooltip = new _0bd(3552822,10197915,null,_1O_I_._1C_B_,120);
         super();
         mouseChildren = false;
         this._2__6 = TextureRedrawer.redraw(TextureLibrary.getBitmap(_U_1,_1qM_),40,true,0);
         this.background = _0Z_v._1P_T_();
         this._1t6 = new Bitmap(this._2__6);
         this._1t6.x = -5;
         this._1t6.y = -8;
         this.text = new SimpleText().setSize(16).setColor(16777215);
         this.text.setStringBuilder(new _dU_().setParams(_1O_I_._0m6));
         this.text.filters = [new DropShadowFilter(0,0,0,1,4,4,2)];
         this.text.setVerticalAlign(SimpleText.BOTTOM);
         this._18D_._bD_(this);
         this._18D_.tooltip = this.tooltip;
         this._16X_();
         _loc1_ = this._1t6.getBounds(this);
         var _loc2_:int = 10;
         this.text.x = _loc1_.right - _loc2_;
         this.text.y = _loc1_.bottom - _loc2_;
      }
      
      public function _0A_A_(param1:_q6) : void
      {
         this._18D_._0A_A_(param1);
      }
      
      public function _23() : _q6
      {
         return this._18D_._23();
      }
      
      public function _0hm(param1:_1K_2) : void
      {
         this._18D_._0hm(param1);
      }
      
      public function _fn() : _1K_2
      {
         return this._18D_._fn();
      }
      
      public function _16X_() : void
      {
         addChild(this.background);
         addChild(this.text);
         addChild(this._1t6);
      }
      
      public function _U_g() : void
      {
         if(this.background && this.background.parent == this)
         {
            removeChild(this.background);
         }
         if(this.text && this.text.parent == this)
         {
            removeChild(this.text);
         }
         if(this._1t6 && this._1t6.parent == this)
         {
            removeChild(this._1t6);
         }
      }
   }
}
