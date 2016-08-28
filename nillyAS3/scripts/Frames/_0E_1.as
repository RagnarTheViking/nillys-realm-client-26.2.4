package Frames
{
   import flash.display.Sprite;
   import _K_t._fr;
   import _05g._1S_m;
   import com.company.assembleegameclient.util.offer.Offer;
   import _1V_8._jw;
   import _K_t._1K_n;
   import _T_n._0fJ_;
   import flash.display.BitmapData;
   import _1gF_.SimpleText;
   import com.company.util.TextureLibrary;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util.BitmapUtil;
   import flash.display.Bitmap;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   import flash.events.MouseEvent;
   
   public class _0E_1 extends Sprite implements _fr
   {
      
      private static const _N_h:int = 7829367;
      
      private static const _1ob:int = 5987163;
      
      private static const _15__:int = 4539717;
       
      
      private const _01T_:_1S_m = new _1S_m();
      
      public var offer:Offer;
      
      private var config:_jw;
      
      private var background:_1K_n;
      
      private var container:Sprite;
      
      private var _1B_v:_0fJ_;
      
      private var _1A_m:BitmapData;
      
      private var _eu:SimpleText;
      
      private var _4D_:SimpleText;
      
      private var _0C_1:SimpleText;
      
      private var taglineText:SimpleText;
      
      private var _1rA_:Boolean;
      
      private var _0C_g:Boolean;
      
      public function _0E_1(param1:Offer, param2:_jw)
      {
         super();
         this.offer = param1;
         this.config = param2;
         this._1J_s();
         this.makeContainer();
         this._0xg();
         this._1wC_();
         this._iP_();
         this._L_q();
         this._1zt();
         this._0yQ_();
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         this._01T_.complete.add(this.alignUI);
      }
      
      public function getValue() : String
      {
         return this.offer.realmGold_.toString();
      }
      
      public function _X_d(param1:Boolean) : void
      {
         this._0C_g = param1;
         this._0iq();
      }
      
      public function setSelected(param1:Boolean) : void
      {
         this._1rA_ = param1;
         this._1B_v.setSelected(param1);
         this._0iq();
      }
      
      public function showBonus(param1:Boolean) : void
      {
         if(this._0C_1)
         {
            this._0C_1.visible = param1;
         }
      }
      
      private function _1J_s() : void
      {
         this.background = new _1K_n();
         this.background.setSize(520,36);
         this._0iq();
         addChild(this.background);
      }
      
      private function makeContainer() : void
      {
         this.container = new Sprite();
         this.container.x = this.container.y = 3;
         addChild(this.container);
      }
      
      private function _0xg() : void
      {
         this._1B_v = new _0fJ_();
         this._1B_v.x = 3;
         this.container.addChild(this._1B_v);
      }
      
      private function _1wC_() : void
      {
         this._1A_m = TextureLibrary.getBitmap("lofiObj3",225);
         this._1A_m = TextureRedrawer.redraw(this._1A_m,50,true,0,false);
         this._1A_m = BitmapUtil._0P_V_(this._1A_m,8,8,this._1A_m.width - 16,this._1A_m.height - 16);
         var _loc1_:Bitmap = new Bitmap(this._1A_m);
         _loc1_.x = this._1B_v.x + 35;
         this.container.addChild(_loc1_);
      }
      
      private function _iP_() : void
      {
         this._eu = new SimpleText().setSize(18).setColor(16777215).setBold(true);
         this._eu.setStringBuilder(new _dU_().setParams(_1O_I_._0cm,{"amount":this.offer.realmGold_}));
         this._eu.filters = [new DropShadowFilter(0,0,0)];
         this._01T_.push(this._eu.textChanged);
         this.container.addChild(this._eu);
      }
      
      private function _L_q() : void
      {
         this._4D_ = new SimpleText().setSize(18).setColor(16777215).setBold(true);
         this._4D_.setStringBuilder(this.config._0kD_(this.offer));
         this._4D_.filters = [new DropShadowFilter(0,0,0)];
         this._01T_.push(this._4D_.textChanged);
         this.container.addChild(this._4D_);
      }
      
      private function _1zt() : void
      {
         if(!this._08H_())
         {
            return;
         }
         this._0C_1 = new SimpleText().setSize(18).setColor(16777215).setBold(true);
         this._0C_1.setStringBuilder(new _dU_().setParams(_1O_I_._0V_1,{"percent":this.offer.bonus}));
         this._0C_1.filters = [new DropShadowFilter(0,0,0)];
         this._01T_.push(this._0C_1.textChanged);
         this.container.addChild(this._0C_1);
      }
      
      private function _0yQ_() : void
      {
         if(this._ai())
         {
            this.makeTaglineText();
         }
      }
      
      private function makeTaglineText() : void
      {
         this.taglineText = new SimpleText().setSize(18).setColor(8891485);
         this.taglineText.setStringBuilder(new _dU_().setParams(this.offer.tagline));
         this.taglineText.filters = [new DropShadowFilter(0,0,0)];
         this._01T_.push(this.taglineText.textChanged);
         this.container.addChild(this.taglineText);
      }
      
      private function _ai() : Boolean
      {
         return this.offer.tagline != null;
      }
      
      private function _08H_() : Boolean
      {
         return this.offer != null && this.offer.bonus != 0;
      }
      
      private function alignUI() : void
      {
         this._eu.x = this._1B_v.x + 70;
         this._eu.y = this._1A_m.height / 2 - this._eu.height / 2;
         this._4D_.x = 200;
         this._4D_.y = this._1A_m.height / 2 - this._4D_.height / 2;
         if(this._08H_() && this._0C_1 != null)
         {
            this._0C_1.x = 280;
            this._0C_1.y = this._1A_m.height / 2 - this._0C_1.height / 2;
         }
         if(this._ai() && this.taglineText != null)
         {
            this.taglineText.x = 400;
            this.taglineText.y = this._1A_m.height / 2 - this.taglineText.height / 2;
         }
      }
      
      private function _0iq() : void
      {
         var _loc1_:int = !!this._1rA_?int(_N_h):!!this._0C_g?int(_1ob):int(_15__);
         this.background.setColor(_loc1_);
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this._X_d(true);
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this._X_d(false);
      }
   }
}
