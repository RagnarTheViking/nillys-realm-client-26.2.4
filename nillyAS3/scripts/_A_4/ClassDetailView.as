package _A_4
{
   import flash.display.Sprite;
   import _05g._1S_m;
   import _1gF_.SimpleText;
   import flash.display.Bitmap;
   import _T_n._0p1;
   import kabam.rotmg.assets.model.Animation;
   import _1xa._dU_;
   import _1xa.SText;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   import kabam.rotmg.assets.services._157;
   
   public class ClassDetailView extends Sprite
   {
      
      private static const _17S_:int = 205;
      
      private static const WIDTH:int = 344;
      
      private static const _1hU_:int = 188;
       
      
      private const _01T_:_1S_m = new _1S_m();
      
      private var classNameText:SimpleText;
      
      private var _W_X_:SimpleText;
      
      private var _018:SimpleText;
      
      private var _G_r:SimpleText;
      
      private var _1ui:SimpleText;
      
      private var _6m:SimpleText;
      
      private var _0G_4:SimpleText;
      
      private var _cd:Bitmap;
      
      private var _0yb:SimpleText;
      
      private var _0U_r:SimpleText;
      
      private var _0xJ_:_0p1;
      
      private var _1S_1:Boolean;
      
      private var _tz:Sprite;
      
      private var _12i:Animation;
      
      public function ClassDetailView()
      {
         var _loc1_:DropShadowFilter = null;
         super();
         this._01T_.complete.add(this.layout);
         _loc1_ = new DropShadowFilter(0,0,0,1,8,8);
         this._tz = new Sprite();
         this._tz.x = (WIDTH - 104) * 0.5;
         addChild(this._tz);
         this.classNameText = new SimpleText().setSize(20).setColor(16777215).setBold(true).setAutoSize(TextFieldAutoSize.CENTER).setTextWidth(_1hU_);
         this.classNameText.filters = [_loc1_];
         this._01T_.push(this.classNameText.textChanged);
         addChild(this.classNameText);
         this._W_X_ = new SimpleText().setSize(14).setColor(16777215).setTextWidth(_1hU_).setWordWrap(true);
         this._W_X_.filters = [_loc1_];
         this._01T_.push(this._W_X_.textChanged);
         addChild(this._W_X_);
         this._018 = new SimpleText().setSize(14).setColor(16777215).setBold(true);
         this._018.filters = [_loc1_];
         this._018.setStringBuilder(new _dU_().setParams(_1O_I_._1yH_));
         this._01T_.push(this._018.textChanged);
         addChild(this._018);
         this._G_r = new SimpleText().setSize(14).setColor(16777215).setBold(true);
         this._G_r.filters = [_loc1_];
         this._G_r.setStringBuilder(new _dU_().setParams(_1O_I_._0gl));
         this._01T_.push(this._G_r.textChanged);
         addChild(this._G_r);
         this._1ui = new SimpleText().setSize(16).setColor(16777215).setBold(true);
         this._1ui.filters = [_loc1_];
         this._01T_.push(this._1ui.textChanged);
         addChild(this._1ui);
         this._6m = new SimpleText().setSize(14).setColor(16777215).setBold(true);
         this._6m.filters = [_loc1_];
         this._6m.setStringBuilder(new _dU_().setParams(_1O_I_._1x6));
         this._01T_.push(this._6m.textChanged);
         addChild(this._6m);
         this._0G_4 = new SimpleText().setSize(16).setColor(15387756).setBold(true);
         this._0G_4.filters = [_loc1_];
         this._01T_.push(this._0G_4.textChanged);
         addChild(this._0G_4);
         this._cd = new Bitmap(_157._0rl());
         this._cd.filters = [_loc1_];
         addChild(this._cd);
         this._0yb = new SimpleText().setSize(14).setColor(16777215).setBold(true);
         this._0yb.filters = [_loc1_];
         this._0yb.setStringBuilder(new _dU_().setParams(_1O_I_._0Y_f));
         this._0yb.visible = false;
         addChild(this._0yb);
         this._0U_r = new SimpleText().setSize(14).setColor(16777215);
         this._0U_r.filters = [_loc1_];
         this._0U_r.visible = false;
         addChild(this._0U_r);
         this._0xJ_ = new _0p1();
         addChild(this._0xJ_);
      }
      
      public function _do(param1:String, param2:String, param3:int, param4:int, param5:int) : void
      {
         this.classNameText.setStringBuilder(new _dU_().setParams(param1));
         this._W_X_.setStringBuilder(new _dU_().setParams(param2));
         this._1ui.setStringBuilder(new SText(String(param4)));
         this._0G_4.setStringBuilder(new SText(String(param5)));
      }
      
      public function _a0(param1:String, param2:int) : void
      {
         this._1S_1 = param2 != -1;
         if(this._1S_1)
         {
            this._0U_r.setStringBuilder(new _dU_().setParams(_1O_I_._h8,{
               "goal":String(param2),
               "quest":param1
            }));
            this._0U_r.y = this._0yb.y + this._0yb.height;
            this._0U_r.x = WIDTH / 2 - this._0U_r.width / 2;
            this._01T_.push(this._0U_r.textChanged);
            this._01T_.push(this._0yb.textChanged);
         }
      }
      
      public function _1k4(param1:Animation) : void
      {
         this._12i && this._0R_g(this._12i);
         this._12i = param1;
         this._12i && this._1eC_(this._12i);
         this.layout();
      }
      
      private function _0R_g(param1:Animation) : void
      {
         param1.stop();
         this._tz.removeChild(param1);
      }
      
      private function _1eC_(param1:Animation) : void
      {
         this._tz.addChild(param1);
         param1.start();
      }
      
      private function layout() : void
      {
         this.classNameText.x = WIDTH / 2 - this.classNameText.width / 2;
         this.classNameText.y = 110;
         this._W_X_.y = this.classNameText.y + this.classNameText.height + 5;
         this._W_X_.x = WIDTH / 2 - this._W_X_.width / 2;
         this._018.y = this._W_X_.y + this._W_X_.height + 20;
         this._018.x = _17S_ - this._018.width;
         this._0xJ_.y = this._018.y - 2;
         this._0xJ_.x = _17S_ + 18;
         this._G_r.y = this._018.y + this._018.height + 5;
         this._G_r.x = _17S_ - this._G_r.width;
         this._1ui.y = this._G_r.y;
         this._1ui.x = _17S_ + 18;
         this._6m.y = this._G_r.y + this._G_r.height + 5;
         this._6m.x = _17S_ - this._6m.width;
         this._0G_4.y = this._6m.y;
         this._0G_4.x = _17S_ + 18;
         this._cd.y = this._6m.y - 2;
         this._cd.x = this._0G_4.x + this._0G_4.width + 3;
         this._0yb.y = this._6m.y + this._6m.height + 17;
         this._0yb.x = WIDTH / 2 - this._0yb.width / 2;
         this._0yb.visible = this._1S_1;
         this._0U_r.y = this._0yb.y + this._0yb.height;
         this._0U_r.x = WIDTH / 2 - this._0U_r.width / 2;
         this._0U_r.visible = this._1S_1;
      }
   }
}
