package _0hx
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import _W_Q_.TextButton;
   import com.company.assembleegameclient.ui.ScrollBar;
   import _04m._0dn;
   import _ju._0O_M_;
   import flash.text.TextFieldAutoSize;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   import flash.display.Shape;
   import flash.display.Graphics;
   import com.company.rotmg.graphics.ScreenGraphic;
   import _04m.Timespan;
   import flash.events.MouseEvent;
   import flash.events.Event;
   
   public class _Q_p extends Sprite
   {
       
      
      public const _Z_X_:Signal = new Signal(Timespan);
      
      public const _070:Signal = new Signal(_0dn);
      
      public const close:Signal = new Signal();
      
      private const _1kJ_:Vector.<_0hx._xD_> = new Vector.<_0hx._xD_>(0);
      
      private const _0L_B_:Object = {};
      
      private var title:SimpleText;
      
      private var _0f3:SimpleText;
      
      private var _iA_:SimpleText;
      
      private var _0fb:Sprite;
      
      private var _1D_r:TextButton;
      
      private var _V_M_:ScrollBar;
      
      private var _1G_n:Sprite;
      
      private var _1U_K_:_0hx._1y4;
      
      private var legends:Vector.<_0dn>;
      
      private var count:int;
      
      public function _Q_p()
      {
         super();
         this._1G_Y_();
         this._aS_();
         this._1bz();
         this._1qw();
         this._1V_4();
         this._sN_();
         this._0t2();
         this._0K_o();
         this._0gR_();
         this._C_r();
      }
      
      private function _1G_Y_() : void
      {
         addChild(new _0O_M_());
      }
      
      private function _aS_() : void
      {
         this.title = new SimpleText().setSize(32).setColor(11776947);
         this.title.setAutoSize(TextFieldAutoSize.CENTER);
         this.title.setBold(true);
         this.title.setStringBuilder(new _dU_().setParams(_1O_I_._X_X_));
         this.title.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this.title.x = 400 - this.title.width / 2;
         this.title.y = 24;
         addChild(this.title);
      }
      
      private function _1bz() : void
      {
         this._0f3 = new SimpleText().setSize(22).setColor(11776947);
         this._0f3.setBold(true);
         this._0f3.setAutoSize(TextFieldAutoSize.CENTER).setVerticalAlign(SimpleText.MIDDLE);
         this._0f3.setStringBuilder(new _dU_().setParams(_1O_I_._0jq));
         this._0f3.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this._0f3.x = 800 / 2;
         this._0f3.y = 600 / 2;
         this._0f3.visible = false;
         addChild(this._0f3);
      }
      
      private function _1qw() : void
      {
         this._iA_ = new SimpleText().setSize(22).setColor(11776947);
         this._iA_.setBold(true);
         this._iA_.setAutoSize(TextFieldAutoSize.CENTER).setVerticalAlign(SimpleText.MIDDLE);
         this._iA_.setStringBuilder(new _dU_().setParams(_1O_I_._1C_4));
         this._iA_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this._iA_.x = 800 / 2;
         this._iA_.y = 600 / 2;
         this._iA_.visible = false;
         addChild(this._iA_);
      }
      
      private function _1V_4() : void
      {
         var _loc1_:Shape = null;
         _loc1_ = new Shape();
         var _loc2_:Graphics = _loc1_.graphics;
         _loc2_.beginFill(0);
         _loc2_.drawRect(0,0,_0hx._xD_.WIDTH,430);
         _loc2_.endFill();
         this._0fb = new Sprite();
         this._0fb.x = 10;
         this._0fb.y = 110;
         this._0fb.addChild(_loc1_);
         this._0fb.mask = _loc1_;
         addChild(this._0fb);
      }
      
      private function _sN_() : void
      {
         addChild(new ScreenGraphic());
      }
      
      private function _0t2() : void
      {
         var _loc1_:Shape = new Shape();
         addChild(_loc1_);
         var _loc2_:Graphics = _loc1_.graphics;
         _loc2_.lineStyle(2,5526612);
         _loc2_.moveTo(0,100);
         _loc2_.lineTo(800,100);
      }
      
      private function _0K_o() : void
      {
         this._V_M_ = new ScrollBar(16,400);
         this._V_M_.x = 800 - this._V_M_.width - 4;
         this._V_M_.y = 104;
         addChild(this._V_M_);
      }
      
      private function _0gR_() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Vector.<Timespan> = Timespan._1fW_;
         var _loc2_:int = _loc1_.length;
         while(_loc3_ < _loc2_)
         {
            this._0ll(_loc1_[_loc3_],_loc3_);
            _loc3_++;
         }
      }
      
      private function _0ll(param1:Timespan, param2:int) : _0hx._1y4
      {
         var _loc3_:_0hx._1y4 = null;
         _loc3_ = new _0hx._1y4(param1);
         this._0L_B_[param1._031()] = _loc3_;
         _loc3_.x = 20 + param2 * 90;
         _loc3_.y = 70;
         _loc3_.selected.add(this._04t);
         addChild(_loc3_);
         return _loc3_;
      }
      
      private function _04t(param1:_0hx._1y4) : void
      {
         if(this._1U_K_ != param1)
         {
            this._00S_(param1);
         }
      }
      
      private function _00S_(param1:_0hx._1y4) : void
      {
         this._1tw(param1);
         this._Z_X_.dispatch(this._1U_K_._1pG_());
      }
      
      private function _1tw(param1:_0hx._1y4) : void
      {
         this._1U_K_ && this._1U_K_._u5(false);
         this._1U_K_ = param1;
         this._1U_K_._u5(true);
      }
      
      private function _C_r() : void
      {
         this._1D_r = new TextButton(_1O_I_._1W_T_,36,false);
         this._1D_r.setAutoSize(TextFieldAutoSize.CENTER);
         this._1D_r.setVerticalAlign(SimpleText.MIDDLE);
         this._1D_r.x = 400;
         this._1D_r.y = 553;
         addChild(this._1D_r);
         this._1D_r.addEventListener(MouseEvent.CLICK,this.onCloseClick);
      }
      
      private function onCloseClick(param1:MouseEvent) : void
      {
         this.close.dispatch();
      }
      
      public function clear() : void
      {
         this._1G_n && this._1M_g();
         this._1G_n = null;
         this._V_M_.visible = false;
      }
      
      private function _1M_g() : void
      {
         var _loc1_:_0hx._xD_ = null;
         for each(_loc1_ in this._1kJ_)
         {
            _loc1_.selected.remove(this._pS_);
         }
         this._1kJ_.length = 0;
         this._0fb.removeChild(this._1G_n);
         this._1G_n = null;
      }
      
      public function _1tH_(param1:Timespan, param2:Vector.<_0dn>) : void
      {
         this.clear();
         this._1tw(this._0L_B_[param1._031()]);
         this._1G_n = new Sprite();
         this.legends = param2;
         this.count = param2.length;
         this._1kJ_.length = this.count;
         this._iA_.visible = this.count == 0;
         this._08E_();
         this._0fb.addChild(this._1G_n);
         this._1b1();
      }
      
      private function _08E_() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.count)
         {
            this._1kJ_[_loc1_] = this._0W_H_(_loc1_);
            _loc1_++;
         }
      }
      
      private function _0W_H_(param1:int) : _0hx._xD_
      {
         var _loc2_:_0dn = this.legends[param1];
         _loc2_._0yn = param1 + 1;
         var _loc3_:_0hx._xD_ = new _0hx._xD_(_loc2_);
         _loc3_.y = param1 * _0hx._xD_.HEIGHT;
         _loc3_.selected.add(this._pS_);
         this._1G_n.addChild(_loc3_);
         return _loc3_;
      }
      
      private function _1b1() : void
      {
         if(this._1G_n.height > 400)
         {
            this._V_M_.visible = true;
            this._V_M_._0jj(400,this._1G_n.height);
            this._V_M_.addEventListener(Event.CHANGE,this._0f0);
            this._0fx();
         }
         else
         {
            this._V_M_.removeEventListener(Event.CHANGE,this._0f0);
            this._V_M_.visible = false;
         }
      }
      
      private function _0fx() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_0dn = this._0aa();
         if(_loc3_)
         {
            _loc1_ = this.legends.indexOf(_loc3_);
            _loc2_ = (_loc1_ + 0.5) * _0hx._xD_.HEIGHT;
            this._V_M_._1mX_((_loc2_ - 200) / (this._1G_n.height - 400));
         }
      }
      
      private function _0aa() : _0dn
      {
         var _loc1_:_0dn = null;
         var _loc2_:_0dn = null;
         for each(_loc2_ in this.legends)
         {
            if(_loc2_._16Z_)
            {
               _loc1_ = _loc2_;
               break;
            }
         }
         return _loc1_;
      }
      
      private function _pS_(param1:_0dn) : void
      {
         this._070.dispatch(param1);
      }
      
      private function _0f0(param1:Event) : void
      {
         this._1G_n.y = -this._V_M_._zH_() * (this._1G_n.height - 400);
      }
      
      public function _mj() : void
      {
         this._0f3.visible = true;
      }
      
      public function _gN_() : void
      {
         this._0f3.visible = false;
      }
   }
}
