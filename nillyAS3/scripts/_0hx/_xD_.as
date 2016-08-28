package _0hx
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _04m._0dn;
   import _1gF_.SimpleText;
   import flash.display.Bitmap;
   import _1O_n._0E_l;
   import _1xa.SText;
   import flash.filters.DropShadowFilter;
   import _1H_T_._S_A_;
   import com.company.util._0ov;
   import com.company.assembleegameclient.ui.Slot;
   import com.company.util.TextureLibrary;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import flash.events.MouseEvent;
   
   public class _xD_ extends Sprite
   {
      
      private static const _Z_B_:int = 22;
      
      public static const WIDTH:int = 756;
      
      public static const HEIGHT:int = 56;
       
      
      public const selected:Signal = new Signal(_0dn);
      
      private var _17p:_0dn;
      
      private var _v6:SimpleText;
      
      private var _mV_:Bitmap;
      
      private var _J_f:SimpleText;
      
      private var _10i:_0E_l;
      
      private var _pV_:SimpleText;
      
      private var _cd:Bitmap;
      
      private var _0C_g:Boolean;
      
      public function _xD_(param1:_0dn)
      {
         super();
         this._17p = param1;
         this._1wY_();
         this._1s1();
         this._1Q_y();
         this._H_4();
         this._P_5();
         this._0O_V_();
         this._1f1();
         this.draw();
      }
      
      private function _1wY_() : void
      {
         this._v6 = new SimpleText().setSize(_Z_B_).setColor(this._0dK_());
         var _loc1_:String = this._17p._0yn == -1?"---":this._17p._0yn.toString() + ".";
         this._v6.setBold(this._17p._0yn != -1);
         this._v6.setStringBuilder(new SText(_loc1_));
         this._v6.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this._v6.x = 82 - this._v6.width;
         this._v6.y = (HEIGHT - _Z_B_) * 0.5;
         addChild(this._v6);
      }
      
      private function _1s1() : void
      {
         this._mV_ = new Bitmap(this._17p.character);
         this._mV_.x = 104;
         this._mV_.y = HEIGHT / 2 - this._mV_.height / 2 - 2;
         addChild(this._mV_);
      }
      
      private function _1Q_y() : void
      {
         this._J_f = new SimpleText().setSize(_Z_B_).setColor(this._0dK_());
         this._J_f.setBold(true);
         this._J_f.setStringBuilder(new SText(this._17p.name));
         this._J_f.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this._J_f.x = 170;
         this._J_f.y = (HEIGHT - _Z_B_) * 0.5;
         addChild(this._J_f);
      }
      
      private function _H_4() : void
      {
         var _loc1_:_S_A_ = null;
         this._10i = new _0E_l(null,this._17p._0fZ_,null);
         var _loc2_:_0ov = this._10i._1nN_();
         while(_loc2_._N_o())
         {
            _loc1_ = _S_A_(_loc2_.next());
            _loc1_._P_e(false);
         }
         this._10i.setItems(this._17p._W_V_);
         this._10i.x = 400;
         this._10i.y = HEIGHT / 2 - Slot.HEIGHT / 2;
         addChild(this._10i);
      }
      
      private function _P_5() : void
      {
         this._pV_ = new SimpleText().setSize(_Z_B_).setColor(this._0dK_());
         this._pV_.setBold(true);
         this._pV_.setStringBuilder(new SText(this._17p._1__h.toString()));
         this._pV_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this._pV_.x = 660 - this._pV_.width;
         this._pV_.y = (HEIGHT - _Z_B_) * 0.5;
         addChild(this._pV_);
      }
      
      private function _0O_V_() : void
      {
         var _loc1_:BitmapData = TextureLibrary.getBitmap("lofiObj3",224);
         this._cd = new Bitmap(TextureRedrawer.redraw(_loc1_,40,true,0));
         this._cd.x = 630;
         this._cd.y = HEIGHT / 2 - this._cd.height / 2;
         addChild(this._cd);
      }
      
      private function _0dK_() : uint
      {
         var _loc1_:uint = 0;
         if(this._17p._U_2)
         {
            _loc1_ = 16564761;
         }
         else if(this._17p._0yn == 1)
         {
            _loc1_ = 16646031;
         }
         else
         {
            _loc1_ = 16777215;
         }
         return _loc1_;
      }
      
      private function _1f1() : void
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         addEventListener(MouseEvent.CLICK,this._1k9);
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this._0C_g = true;
         this.draw();
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this._0C_g = false;
         this.draw();
      }
      
      private function _1k9(param1:MouseEvent) : void
      {
         this.selected.dispatch(this._17p);
      }
      
      private function draw() : void
      {
         graphics.clear();
         graphics.beginFill(0,!!this._0C_g?Number(0.4):Number(0.001));
         graphics.drawRect(0,0,WIDTH,HEIGHT);
         graphics.endFill();
      }
   }
}
