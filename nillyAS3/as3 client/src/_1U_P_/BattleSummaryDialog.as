package _1U_P_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _T_n._03K_;
   import _1cm.BattleSummaryText;
   import _1gF_._I_a;
   import _yt._1gD_;
   import _C_._1O_I_;
   import flash.events.MouseEvent;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   
   public class BattleSummaryDialog extends Sprite
   {
       
      
      public const close:Signal = new Signal();
      
      private const WIDTH:int = 264;
      
      private const HEIGHT:int = 302;
      
      private const background:_03K_ = _1L_c();
      
      private const _29 = _1eH_();
      
      private var _1pB_:Class;
      
      private var _02:BattleSummaryText;
      
      private var _zj:BattleSummaryText;
      
      private var _1N_S_:_I_a;
      
      private var _1D_r:_1gD_;
      
      public function BattleSummaryDialog()
      {
         this._1pB_ = _5P_;
         this._1N_S_ = this._1lN_();
         this._1D_r = this._1lo();
         super();
         this._12G_(25);
         this._12G_(132);
         this._12G_(252);
         this._8i();
      }
      
      private function _1L_c() : _03K_
      {
         var _loc1_:_03K_ = new _03K_();
         _loc1_.draw(this.WIDTH,this.HEIGHT);
         addChild(_loc1_);
         return _loc1_;
      }
      
      public function _9s() : void
      {
         stage;
         x = (800 - this.WIDTH) * 0.5;
         stage;
         y = (600 - this.HEIGHT) * 0.5;
      }
      
      public function _gt(param1:int, param2:int) : void
      {
         if(this._02)
         {
            removeChild(this._02);
         }
         this._02 = new BattleSummaryText(_1O_I_._1E_l,param1,param2);
         this._02.y = 60 - this._02.height / 2 + 132;
         this._02.x = this.WIDTH / 4 - this._02.width / 2;
         addChild(this._02);
      }
      
      public function _1sV_(param1:int, param2:int) : void
      {
         if(this._zj)
         {
            removeChild(this._zj);
         }
         this._zj = new BattleSummaryText(_1O_I_._Z_D_,param1,param2);
         this._zj.y = 60 - this._zj.height / 2 + 132;
         this._zj.x = this.WIDTH / 4 - this._zj.width / 2 + this.WIDTH / 2;
         addChild(this._zj);
      }
      
      private function _W_p(param1:MouseEvent) : void
      {
         this._1D_r.removeEventListener(MouseEvent.CLICK,this._W_p);
         this.close.dispatch();
      }
      
      private function _8i() : void
      {
         this.background.graphics.lineStyle();
         this.background.graphics.beginFill(6710886,1);
         this.background.graphics.drawRect(this.WIDTH / 2,132,2,120);
         this.background.graphics.endFill();
      }
      
      private function _12G_(param1:int) : void
      {
         this.background.graphics.lineStyle();
         this.background.graphics.beginFill(6710886,1);
         this.background.graphics.drawRect(1,param1,this.background.width - 2,2);
         this.background.graphics.endFill();
      }
      
      private function _1eH_() : *
      {
         var _loc1_:* = new this._1pB_();
         _loc1_.y = 27;
         _loc1_.x = 2;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1lN_() : _I_a
      {
         var _loc1_:_I_a = null;
         _loc1_ = new _I_a();
         _loc1_.setSize(18).setBold(true).setColor(11776947);
         _loc1_.setStringBuilder(new _dU_().setParams(_1O_I_._p9));
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         _loc1_.x = (this.WIDTH - _loc1_.width) * 0.5;
         _loc1_.y = 3;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1lo() : _1gD_
      {
         var _loc1_:_1gD_ = null;
         _loc1_ = new _1gD_(16,_1O_I_._1N_d,100);
         _loc1_.addEventListener(MouseEvent.CLICK,this._W_p);
         _loc1_.y = this.HEIGHT - _loc1_.height - 10;
         _loc1_.x = this.WIDTH / 2 - _loc1_.width / 2;
         addChild(_loc1_);
         return _loc1_;
      }
   }
}
