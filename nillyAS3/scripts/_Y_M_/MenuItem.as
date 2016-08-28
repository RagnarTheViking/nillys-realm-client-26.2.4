package _Y_M_
{
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.display.BitmapData;
   import flash.display.Bitmap;
   import _1gF_.SimpleText;
   import com.company.util.MoreColorUtil;
   import com.company.util._1eD_;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import _1xa._dU_;
   
   public class MenuItem extends Sprite
   {
      
      protected static const _nz:ColorTransform = new ColorTransform(1,220 / 255,133 / 255);
       
      
      protected var _058:BitmapData;
      
      protected var _0vw:BitmapData;
      
      protected var _1kE_:Bitmap;
      
      protected var _Y_6:ColorTransform = null;
      
      public var text_:SimpleText;
      
      public function MenuItem(param1:BitmapData, param2:uint, param3:String)
      {
         super();
         this._058 = param1;
         this._0vw = TextureRedrawer.redraw(param1,this._aP_(),true,0);
         this._1kE_ = new Bitmap(this._0vw);
         this._1kE_.filters = [new DropShadowFilter(0,0,0)];
         this._1kE_.x = -12;
         this._1kE_.y = -15;
         addChild(this._1kE_);
         this.text_ = new SimpleText().setSize(18).setColor(param2);
         this.text_.setBold(true);
         this.text_.setStringBuilder(new _dU_().setParams(param3));
         this.text_.filters = [new DropShadowFilter(0,0,0)];
         this.text_.x = 20;
         this.text_.y = -6;
         addChild(this.text_);
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      public function _Q_T_(param1:ColorTransform) : void
      {
         var _loc2_:BitmapData = null;
         if(param1 == this._Y_6)
         {
            return;
         }
         this._Y_6 = param1;
         if(this._Y_6 == null)
         {
            this._1kE_.bitmapData = this._0vw;
            this.text_.transform.colorTransform = MoreColorUtil.identity;
         }
         else
         {
            _loc2_ = _1eD_._6U_(this._058,this._Y_6);
            _loc2_ = TextureRedrawer.redraw(_loc2_,this._aP_(),true,0);
            this._1kE_.bitmapData = _loc2_;
            this.text_.transform.colorTransform = this._Y_6;
         }
      }
      
      protected function onMouseOver(param1:MouseEvent) : void
      {
         this._Q_T_(_nz);
      }
      
      protected function onMouseOut(param1:MouseEvent) : void
      {
         this._Q_T_(null);
      }
      
      protected function _aP_() : int
      {
         return 40 / (this._058.width / 8);
      }
   }
}
