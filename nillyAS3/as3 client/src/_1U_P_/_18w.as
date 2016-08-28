package _1U_P_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1gF_._I_a;
   import _1xa.SText;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   
   public class _18w extends Sprite
   {
       
      
      public const close:Signal = new Signal();
      
      private const _0J_x:Sprite = new Sprite();
      
      private const _0yz:_I_a = _1K_();
      
      private const _4M_:SText = new SText();
      
      private const _Y_y:_I_a = _1K_f();
      
      private const _0T_f:Timer = new Timer(1000);
      
      private const _0yZ_:Sprite = new Sprite();
      
      private const _0D_h = _1A_q();
      
      private const _1t:_I_a = _P_L_();
      
      private const _0gC_:_I_a = _0R_j();
      
      private const _M_M_:_I_a = _08S_();
      
      private const _0F_l:Timer = new Timer(1500,1);
      
      private var _0Y_W_:Class;
      
      private var count:int = 5;
      
      private var waveNumber:int = -1;
      
      public function _18w()
      {
         this._0Y_W_ = _1sL_;
         super();
      }
      
      public function init() : void
      {
         mouseChildren = false;
         mouseEnabled = false;
         this._0T_f.addEventListener(TimerEvent.TIMER,this._1T_);
         this._0T_f.start();
      }
      
      public function destroy() : void
      {
         this._0T_f.stop();
         this._0T_f.removeEventListener(TimerEvent.TIMER,this._1T_);
         this._0F_l.stop();
         this._0F_l.removeEventListener(TimerEvent.TIMER,this._1yC_);
      }
      
      public function show() : void
      {
         addChild(this._0J_x);
         this.center();
      }
      
      public function _E_j(param1:int) : void
      {
         this.waveNumber = param1;
         this._0gC_.setStringBuilder(new SText(this.waveNumber.toString()));
         this._0gC_.x = this._0D_h.width / 2 - this._0gC_.width / 2;
      }
      
      private function center() : void
      {
         x = 300 - width / 2;
         y = !!contains(this._0J_x)?Number(138):Number(87.5);
      }
      
      private function _1T_(param1:TimerEvent) : void
      {
         if(this.count > 1)
         {
            this.count--;
            this._Y_y.setStringBuilder(this._4M_.setString(this.count.toString()));
            this._Y_y.x = this._0yz.width / 2 - this._Y_y.width / 2;
         }
         else
         {
            removeChild(this._0J_x);
            addChild(this._0yZ_);
            this._0T_f.removeEventListener(TimerEvent.TIMER,this._1T_);
            this._0F_l.addEventListener(TimerEvent.TIMER,this._1yC_);
            this._0F_l.start();
            this.center();
         }
      }
      
      private function _1yC_(param1:TimerEvent) : void
      {
         this._0F_l.removeEventListener(TimerEvent.TIMER,this._1yC_);
         this.close.dispatch();
      }
      
      private function _1K_() : _I_a
      {
         var _loc1_:_I_a = new _I_a();
         _loc1_.setSize(20).setBold(true).setColor(13421772);
         _loc1_.setStringBuilder(new _dU_().setParams(_1O_I_._0R_r));
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8,2)];
         this._0J_x.addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1K_f() : _I_a
      {
         var _loc1_:_I_a = null;
         _loc1_ = new _I_a();
         _loc1_.setSize(42).setBold(true).setColor(13421772);
         _loc1_.setStringBuilder(this._4M_.setString(this.count.toString()));
         _loc1_.y = this._0yz.height;
         _loc1_.x = this._0yz.width / 2 - _loc1_.width / 2;
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8,2)];
         this._0J_x.addChild(_loc1_);
         return _loc1_;
      }
      
      private function _P_L_() : _I_a
      {
         var _loc1_:_I_a = null;
         _loc1_ = new _I_a();
         _loc1_.setSize(18).setBold(true).setColor(16567065);
         _loc1_.setStringBuilder(new _dU_().setParams(_1O_I_._0K_C_));
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8,2)];
         _loc1_.x = this._0D_h.width / 2 - _loc1_.width / 2;
         _loc1_.y = this._0D_h.height / 2 - _loc1_.height / 2 - 15;
         this._0yZ_.addChild(_loc1_);
         return _loc1_;
      }
      
      private function _0R_j() : _I_a
      {
         var _loc1_:_I_a = new _I_a();
         _loc1_.setSize(40).setBold(true).setColor(16567065);
         _loc1_.y = this._1t.y + this._1t.height - 5;
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8,2)];
         this._0yZ_.addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1A_q() : *
      {
         var _loc1_:* = new _1sL_();
         this._0yZ_.addChild(_loc1_);
         return _loc1_;
      }
      
      private function _08S_() : _I_a
      {
         var _loc1_:_I_a = null;
         _loc1_ = new _I_a();
         _loc1_.setSize(32).setBold(true).setColor(11776947);
         _loc1_.setStringBuilder(new _dU_().setParams(_1O_I_._1W_f));
         _loc1_.y = this._0D_h.y + this._0D_h.height - 5;
         _loc1_.x = this._0D_h.width / 2 - _loc1_.width / 2;
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8,2)];
         this._0yZ_.addChild(_loc1_);
         return _loc1_;
      }
   }
}
