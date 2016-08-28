package _W_Q_
{
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import _f7.Signal;
   import _06._1P_b;
   import _v4.Client;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui._03S_;
   import _1S_e.CurrencyDisplay;
   import flash.display.Shape;
   import com.company.assembleegameclient.ui.ScrollBar;
   import _0C_j.PackageButton;
   import _ju._0G_n;
   import _bv._1gT_;
   import flash.events.Event;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import _1xa.SText;
   import flash.geom.Rectangle;
   import flash.display.DisplayObject;
   import _05g._0D_3;
   import _ju._0O_M_;
   
   public class CharacterSelectionAndNewsScreen extends Sprite
   {
      
      private static const _xA_:int = 475;
      
      private static const _16g:uint = 11776947;
      
      private static const _0__C_:uint = 16777215;
       
      
      private const _0qv:Number = 400;
      
      private const _fB_:int = 108;
      
      private const _0jl:int = 18;
      
      private const _yR_:DropShadowFilter = new DropShadowFilter(0,0,0,1,8,8);
      
      public var close:Signal;
      
      public var _0hs:Signal;
      
      public var newCharacter:Signal;
      
      public var chooseName:Signal;
      
      public var _1M_n:Signal;
      
      public var _T_b:_1P_b;
      
      private var model:Client;
      
      private var _fk:Boolean;
      
      private var _J_f:SimpleText;
      
      private var _1ko:_03S_;
      
      private var _1U_4:CurrencyDisplay;
      
      private var _0q5:SimpleText;
      
      private var _0M_q:SimpleText;
      
      private var _V_k:SimpleText;
      
      private var _12Q_:_W_Q_._C_W_;
      
      private var _0E_j:int = 1;
      
      private var _if:Number;
      
      private var _1yx:Shape;
      
      private var _V_M_:ScrollBar;
      
      private var _F_o:PackageButton;
      
      private var _1F_x:_W_Q_.TextButton;
      
      private var _T_q:_W_Q_.TextButton;
      
      private var _1d0:_W_Q_.TextButton;
      
      private var _4S_:_0G_n;
      
      private var _Y_R_:int = 106;
      
      public function CharacterSelectionAndNewsScreen()
      {
         this.newCharacter = new Signal();
         this.chooseName = new Signal();
         this._1M_n = new Signal();
         this._1F_x = _0D_3._1__U_();
         this._T_q = _0D_3._jm();
         this._1d0 = _0D_3._0R_N_();
         super();
         this.close = this._1d0.clicked;
         this._0hs = this._T_q.clicked;
         addChild(new _0O_M_());
         addChild(new TitleBasicAccountInfo());
      }
      
      public function initialize(param1:Client) : void
      {
         if(this._fk)
         {
            return;
         }
         this._fk = true;
         this.model = param1;
         this._1uB_(param1);
      }
      
      private function _1uB_(param1:Client) : void
      {
         this._01F_();
         this._mU_();
         this._5y();
         this._0W_5();
         this._1fQ_();
         this._6F_();
         var _loc2_:_1P_W_ = new _1P_W_(param1);
         if(_loc2_._N_E_())
         {
            this._0q5.setColor(_0__C_);
            this._0cL_();
         }
         this._A_N_();
         this._oF_();
         if(!param1._0E_I_())
         {
            this._G_W_();
         }
      }
      
      private function _oF_() : void
      {
         this._1F_x.clicked.add(this._1vT_);
         this._4S_ = new _0G_n();
         this._4S_._19d(this._1F_x,_0G_n.CENTER);
         this._4S_._19d(this._1d0,_0G_n.LEFT);
         this._4S_._19d(this._T_q,_0G_n.RIGHT);
         addChild(this._4S_);
      }
      
      private function _0W_5() : void
      {
         var _loc1_:_1gT_ = null;
         _loc1_ = new _1gT_();
         _loc1_.x = _xA_;
         _loc1_.y = 112;
         addChild(_loc1_);
      }
      
      private function _R_x() : void
      {
         this._V_M_ = new ScrollBar(16,399);
         this._V_M_.x = 443;
         this._V_M_.y = 113;
         this._V_M_._0jj(399,this._12Q_.height);
         this._V_M_.addEventListener(Event.CHANGE,this._0f0);
         addChild(this._V_M_);
      }
      
      private function _5y() : void
      {
         this._V_k = new SimpleText().setSize(18).setColor(_16g);
         this._V_k.setBold(true);
         this._V_k.setStringBuilder(new _dU_().setParams(_1O_I_._iI_));
         this._V_k.filters = [this._yR_];
         this._V_k.x = _xA_;
         this._V_k.y = 79;
         addChild(this._V_k);
      }
      
      private function _A_N_() : void
      {
         this._0E_j = _W_Q_._C_W_._0C_f;
         this._12Q_ = new _W_Q_._C_W_(this.model,_W_Q_._C_W_._0C_f);
         this._12Q_.x = this._0jl;
         this._12Q_.y = this._fB_;
         this._if = this._12Q_.height;
         if(this._if > this._0qv)
         {
            this._R_x();
         }
         addChild(this._12Q_);
      }
      
      private function _S_K_() : void
      {
         this._0E_j = _W_Q_._C_W_._1jm;
         this._12Q_ = new _W_Q_._C_W_(this.model,_W_Q_._C_W_._1jm);
         this._12Q_.x = this._0jl;
         this._12Q_.y = this._fB_;
         this._if = this._12Q_.height;
         if(this._if > this._0qv)
         {
            this._R_x();
         }
         addChild(this._12Q_);
      }
      
      private function _fN_() : void
      {
         if(this._12Q_ != null)
         {
            removeChild(this._12Q_);
            this._12Q_ = null;
         }
         if(this._V_M_ != null)
         {
            removeChild(this._V_M_);
            this._V_M_ = null;
         }
      }
      
      private function _6F_() : void
      {
         this._0q5 = new SimpleText().setSize(18).setColor(_16g);
         this._0q5.setBold(true);
         this._0q5.setStringBuilder(new _dU_().setParams(_1O_I_._0V_l));
         this._0q5.filters = [this._yR_];
         this._0q5.x = this._0jl;
         this._0q5.y = 79;
         this._0q5.addEventListener(MouseEvent.CLICK,this._0vT_);
         addChild(this._0q5);
      }
      
      private function _0vT_(param1:MouseEvent) : void
      {
         if(this._0E_j != _W_Q_._C_W_._0C_f)
         {
            this._fN_();
            this._0q5.setColor(_0__C_);
            this._0M_q.setColor(_16g);
            this._A_N_();
         }
      }
      
      private function _0cL_() : void
      {
         this._0M_q = new SimpleText().setSize(18).setColor(_16g);
         this._0M_q.setBold(true);
         this._0M_q.setStringBuilder(new _dU_().setParams(_1O_I_._0G___));
         this._0M_q.filters = [this._yR_];
         this._0M_q.x = this._0jl + 150;
         this._0M_q.y = 79;
         this._0M_q.addEventListener(MouseEvent.CLICK,this._1H_k);
         addChild(this._0M_q);
      }
      
      private function _1H_k(param1:MouseEvent) : void
      {
         if(this._0E_j != _W_Q_._C_W_._1jm)
         {
            this._fN_();
            this._0q5.setColor(_16g);
            this._0M_q.setColor(_0__C_);
            this._S_K_();
         }
      }
      
      private function _mU_() : void
      {
         this._1U_4 = new CurrencyDisplay();
         this._1U_4.draw(this.model.getCredits(),this.model.getFame());
         this._1U_4.x = this._1l().width;
         this._1U_4.y = 20;
         addChild(this._1U_4);
      }
      
      private function _G_W_() : void
      {
         this._1ko = new _03S_(16,false,_1O_I_._fl);
         this._1ko.y = 50;
         this._1ko.setAutoSize(TextFieldAutoSize.CENTER);
         this._1ko.x = this._1l().width / 2;
         this._1ko.addEventListener(MouseEvent.CLICK,this._mB_);
         addChild(this._1ko);
      }
      
      private function _01F_() : void
      {
         this._J_f = new SimpleText().setSize(22).setColor(11776947);
         this._J_f.setBold(true).setAutoSize(TextFieldAutoSize.CENTER);
         this._J_f.setStringBuilder(new SText(this.model.getName()));
         this._J_f.filters = [this._yR_];
         this._J_f.y = 24;
         this._J_f.x = (this._1l().width - this._J_f.width) / 2;
         addChild(this._J_f);
      }
      
      function _1l() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle();
         if(stage)
         {
            stage;
            stage;
            _loc1_ = new Rectangle(0,0,800,600);
         }
         return _loc1_;
      }
      
      private function _1fQ_() : void
      {
         this._1yx = new Shape();
         this._1yx.graphics.clear();
         this._1yx.graphics.lineStyle(2,5526612);
         this._1yx.graphics.moveTo(0,this._Y_R_);
         this._1yx.graphics.lineTo(this._1l().width,this._Y_R_);
         this._1yx.graphics.moveTo(466,107);
         this._1yx.graphics.lineTo(466,526);
         this._1yx.graphics.lineStyle();
         addChild(this._1yx);
      }
      
      private function _mB_(param1:MouseEvent) : void
      {
         this.chooseName.dispatch();
      }
      
      private function _0f0(param1:Event) : void
      {
         if(this._12Q_ != null)
         {
            this._12Q_._1mX_(-this._V_M_._zH_() * (this._if - 400));
         }
      }
      
      public function _053() : void
      {
         this._T_b = new _1P_b();
         this._T_b.x = 14;
         this._T_b.y = 40;
         addChild(this._T_b);
         this._7f(this._F_o);
      }
      
      public function _1U_w() : void
      {
         this._F_o = new PackageButton();
         this._F_o.init();
         this._F_o.x = 6;
         this._F_o.y = 40;
         addChild(this._F_o);
         this._7f(this._T_b);
      }
      
      private function _7f(param1:DisplayObject) : void
      {
         if(param1 && contains(param1))
         {
            removeChild(param1);
         }
      }
      
      private function _1vT_() : void
      {
         if(this.model.getNumChars() == 0)
         {
            this.newCharacter.dispatch();
         }
         else
         {
            this._1M_n.dispatch();
         }
      }
      
      public function setName(param1:String) : void
      {
         this._J_f.setStringBuilder(new SText(this.model.getName()));
         this._J_f.x = (this._1l().width - this._J_f.width) * 0.5;
         if(this._1ko)
         {
            removeChild(this._1ko);
            this._1ko = null;
         }
      }
   }
}
