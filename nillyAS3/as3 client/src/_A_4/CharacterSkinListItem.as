package _A_4
{
   import flash.display.Sprite;
   import flash.filters.ColorMatrixFilter;
   import flash.display.Shape;
   import _1gF_.SimpleText;
   import _T_n._0fJ_;
   import flash.display.Bitmap;
   import _f7.Signal;
   import _0E_T_._Y_F_;
   import _0E_T_._1G_k;
   import _0qH_._0sZ_;
   import flash.filters.DropShadowFilter;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   import _1xa._dU_;
   import com.company.assembleegameclient.util.Currency;
   import _1xa.SText;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import _C_._1O_I_;
   import _1xa._1eo;
   import flash.geom.ColorTransform;
   import flash.display.Graphics;
   import com.company.util.MoreColorUtil;
   import _1S_0.NativeMappedSignal;
   
   public class CharacterSkinListItem extends Sprite
   {
      
      public static const WIDTH:int = 420;
      
      public static const _0ci:int = 16;
      
      public static const HEIGHT:int = 60;
      
      private static const _S_O_:uint = 8092539;
      
      private static const _0R_F_:uint = 5921370;
      
      private static const _1J_y:uint = 2631720;
       
      
      private const _0sK_:ColorMatrixFilter = new ColorMatrixFilter(MoreColorUtil._iz);
      
      private const background:Shape = _1L_c();
      
      private const _C_z:Sprite = _1qL_();
      
      private const _J_f:SimpleText = _1Q_y();
      
      private const _D_t:_0fJ_ = _18c();
      
      private const _09T_:Bitmap = _0s__();
      
      private const _1Y_b:SimpleText = _tt();
      
      private const _0G_E_:Sprite = _gL_();
      
      private const _1L_N_:_A_4._1x5 = _bs();
      
      public const buy:Signal = new NativeMappedSignal(_0G_E_,MouseEvent.CLICK);
      
      public const _nU_:Signal = new Signal();
      
      public const out:Signal = new Signal();
      
      public const selected:Signal = _D_t._my;
      
      private var model:_Y_F_;
      
      private var state:_1G_k;
      
      private var _1rA_:Boolean = false;
      
      private var __null:Bitmap;
      
      private var buyButton:_0sZ_;
      
      private var _0C_g:Boolean;
      
      public function CharacterSkinListItem()
      {
         this.state = _1G_k.NULL;
         super();
      }
      
      private function _1L_c() : Shape
      {
         var _loc1_:Shape = new Shape();
         this._1W_A_(_loc1_.graphics,WIDTH);
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1qL_() : Sprite
      {
         var _loc1_:Sprite = null;
         _loc1_ = new Sprite();
         _loc1_.x = 8;
         _loc1_.y = 4;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1Q_y() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = new SimpleText().setSize(18).setColor(16777215).setBold(true);
         _loc1_.x = 75;
         _loc1_.y = 15;
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _18c() : _0fJ_
      {
         var _loc1_:_0fJ_ = null;
         _loc1_ = new _0fJ_();
         _loc1_.setSelected(false);
         _loc1_.x = WIDTH - _loc1_.width - 15;
         _loc1_.y = HEIGHT / 2 - _loc1_.height / 2;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _0s__() : Bitmap
      {
         var _loc1_:Bitmap = null;
         _loc1_ = new Bitmap();
         _loc1_.scaleX = 2;
         _loc1_.scaleY = 2;
         _loc1_.visible = false;
         addChild(_loc1_);
         return _loc1_;
      }
      
      public function _1__9(param1:BitmapData) : void
      {
         this._09T_.bitmapData = param1;
         this._09T_.x = this._1Y_b.x - this._09T_.width - 5;
         this._09T_.y = HEIGHT / 2 - this._09T_.height * 0.5;
      }
      
      private function _tt() : SimpleText
      {
         var _loc1_:SimpleText = new SimpleText().setSize(14).setColor(16777215);
         _loc1_.setVerticalAlign(SimpleText.MIDDLE);
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _gL_() : Sprite
      {
         var _loc1_:Sprite = null;
         _loc1_ = new Sprite();
         _loc1_.x = WIDTH - _0ci;
         _loc1_.y = HEIGHT * 0.5;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _bs() : _A_4._1x5
      {
         var _loc1_:_A_4._1x5 = null;
         _loc1_ = new _A_4._1x5();
         _loc1_._1jE_.addOnce(this._0vv);
         _loc1_.y = -1;
         _loc1_.visible = false;
         addChild(_loc1_);
         return _loc1_;
      }
      
      public function _up(param1:_0sZ_) : void
      {
         this.buyButton = param1;
         param1._0T_g.add(this._0F_w);
         this.model && this._get_();
         this._0G_E_.addChild(param1);
         param1.x = -param1.width;
         param1.y = -param1.height * 0.5;
         this._0G_E_.visible = this.state == _1G_k.PURCHASABLE;
         this._0vv();
      }
      
      private function _0F_w() : void
      {
         this.buyButton.x = -this.buyButton.width;
      }
      
      public function _S_E_(param1:Bitmap) : void
      {
         this.__null && this._C_z.removeChild(this.__null);
         this.__null = param1;
         this.__null && this._C_z.addChild(this.__null);
      }
      
      public function _wU_() : _Y_F_
      {
         return this.model;
      }
      
      public function _0P_L_(param1:_Y_F_) : void
      {
         this.model && this.model._my.remove(this._1Z_R_);
         this.model = param1;
         this.model && this.model._my.add(this._1Z_R_);
         this._1Z_R_(this.model);
         addEventListener(MouseEvent.MOUSE_OVER,this._G_H_);
         addEventListener(MouseEvent.MOUSE_OUT,this._0A_4);
      }
      
      private function _1Z_R_(param1:_Y_F_) : void
      {
         this.state = !!this.model?this.model._0J_m():_1G_k.NULL;
         this._0cY_();
         this._1vO_();
         this.buyButton && this._get_();
         this._lc();
         this._0vv();
         this._u5(this.model && this.model._0pE_());
      }
      
      public function _0J_m() : _1G_k
      {
         return this.state;
      }
      
      private function _0cY_() : void
      {
         this._J_f.setStringBuilder(new _dU_().setParams(!!this.model?this.model.name:""));
      }
      
      private function _1vO_() : void
      {
         this._1L_x();
         this._o__();
         this._Z_7();
         this._03Q_();
      }
      
      private function _0vv() : void
      {
         this._1L_N_.visible = this.model && this.model.limited && this.state != _1G_k.OWNED && this.state != _1G_k.PURCHASING;
         this._1L_N_.x = (this.state == _1G_k.LOCKED || !this.buyButton?this._09T_.x - 5:this._0G_E_.x + this.buyButton.x - 15) - this._1L_N_.width;
      }
      
      private function _1L_x() : void
      {
         var _loc1_:* = this.state == _1G_k.OWNED;
         var _loc2_:* = this.state == _1G_k.PURCHASABLE;
         var _loc3_:* = this.state == _1G_k.PURCHASING;
         var _loc4_:* = this.state == _1G_k.LOCKED;
         this._D_t.visible = _loc1_;
         this._0G_E_ && (this._0G_E_.visible = _loc2_);
         this._09T_.visible = _loc4_;
         this._1Y_b.visible = _loc4_ || _loc3_;
      }
      
      private function _Z_7() : void
      {
         if(this.state == _1G_k.OWNED)
         {
            this.addEventListeners();
         }
         else
         {
            this._E_c();
         }
      }
      
      private function _get_() : void
      {
         var _loc1_:int = !!this.model?int(this.model.cost):0;
         this.buyButton.setPrice(_loc1_,Currency.GOLD);
      }
      
      public function _0pE_() : Boolean
      {
         return this._1rA_;
      }
      
      public function _u5(param1:Boolean) : void
      {
         this._1rA_ = param1 && this.state == _1G_k.OWNED;
         this._D_t.setSelected(param1);
         this._o__();
      }
      
      private function _lc() : void
      {
         if(this.model != null && this.model._0p7 != null)
         {
            this._1Y_b.setStringBuilder(new SText(this.model._0p7));
            this._1Y_b.setTextWidth(110);
            this._1Y_b.setWordWrap(true);
            this._1Y_b.setMultiLine(true);
            this._1Y_b.setAutoSize(TextFieldAutoSize.LEFT);
            this._1Y_b.setHorizontalAlign(TextFormatAlign.LEFT);
            this._1Y_b.setVerticalAlign(TextFieldAutoSize.CENTER);
            this._1Y_b.y = HEIGHT / 7;
         }
         else
         {
            this._1Y_b.setStringBuilder(this.state == _1G_k.PURCHASING?new _dU_().setParams(_1O_I_._0O_l):this._0V_S_());
            this._1Y_b.y = HEIGHT / 2;
         }
         this._1Y_b.x = WIDTH - this._1Y_b.width - 15;
         this._09T_.x = this._1Y_b.x - this._09T_.width - 5;
      }
      
      private function _0V_S_() : _1eo
      {
         var _loc1_:_dU_ = new _dU_();
         var _loc2_:String = !!this.model?this.model.unlockLevel.toString():"";
         return _loc1_.setParams(_1O_I_._0U_U_,{"level":_loc2_});
      }
      
      private function addEventListeners() : void
      {
         addEventListener(MouseEvent.CLICK,this._1k9);
      }
      
      function _E_c() : void
      {
         removeEventListener(MouseEvent.CLICK,this._1k9);
      }
      
      private function _1k9(param1:MouseEvent) : void
      {
         this._u5(true);
      }
      
      private function _G_H_(param1:MouseEvent) : void
      {
         this._0C_g = true;
         this._o__();
         this._nU_.dispatch();
      }
      
      private function _0A_4(param1:MouseEvent) : void
      {
         this._0C_g = false;
         this._o__();
         this.out.dispatch();
      }
      
      private function _o__() : void
      {
         var _loc1_:ColorTransform = this.background.transform.colorTransform;
         _loc1_.color = this.getColor();
         this.background.transform.colorTransform = _loc1_;
      }
      
      private function getColor() : uint
      {
         if(this.state._Y_O_())
         {
            return _1J_y;
         }
         if(this._1rA_ || this._0C_g)
         {
            return _S_O_;
         }
         return _0R_F_;
      }
      
      private function _03Q_() : void
      {
         filters = this.state == _1G_k.PURCHASING?[this._0sK_]:[];
      }
      
      public function setWidth(param1:int) : void
      {
         this._0G_E_.x = param1 - _0ci;
         this._1Y_b.x = param1 - this._1Y_b.width - 15;
         this._09T_.x = this._1Y_b.x - this._09T_.width - 5;
         this._D_t.x = param1 - this._D_t.width - 15;
         this._0vv();
         this._1W_A_(this.background.graphics,param1);
      }
      
      private function _1W_A_(param1:Graphics, param2:int) : void
      {
         param1.clear();
         param1.beginFill(_0R_F_);
         param1.drawRect(0,0,param2,HEIGHT);
         param1.endFill();
      }
   }
}
