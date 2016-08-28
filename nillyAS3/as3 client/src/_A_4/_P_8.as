package _A_4
{
   import flash.display.Sprite;
   import _ju._0O_M_;
   import _W_Q_.TitleBasicAccountInfo;
   import flash.display.Shape;
   import _1S_e.CurrencyDisplay;
   import com.company.rotmg.graphics.ScreenGraphic;
   import _W_Q_.TextButton;
   import _f7.Signal;
   import _05g._1S_m;
   import _0H_6.GameContext;
   import _v4.Client;
   import _0qE_._1vk;
   import flash.text.TextFieldAutoSize;
   import _1gF_.SimpleText;
   import _1S_0.NativeMappedSignal;
   import flash.events.MouseEvent;
   
   public class _P_8 extends Sprite
   {
       
      
      private const base:_0O_M_ = _1G_Y_();
      
      private const account:TitleBasicAccountInfo = _16M_();
      
      private const _1yx:Shape = _0t2();
      
      private const _if_:CurrencyDisplay = _1nE_();
      
      private const _0jB_:ScreenGraphic = _sN_();
      
      private const _1ad:TextButton = _0W_G_();
      
      private const _0Y_b:TextButton = _1st();
      
      private const list:_A_4._zp = _1lZ_();
      
      private const _by:_A_4.ClassDetailView = _0U_P_();
      
      public const play:Signal = new NativeMappedSignal(_1ad,MouseEvent.CLICK);
      
      public const back:Signal = new NativeMappedSignal(_0Y_b,MouseEvent.CLICK);
      
      public const _01T_:_1S_m = _1E_S_();
      
      public function _P_8()
      {
         super();
      }
      
      private function _1G_Y_() : _0O_M_
      {
         var _loc1_:_0O_M_ = new _0O_M_();
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _16M_() : TitleBasicAccountInfo
      {
         var _loc1_:TitleBasicAccountInfo = new TitleBasicAccountInfo();
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1nE_() : CurrencyDisplay
      {
         var _loc1_:CurrencyDisplay = null;
         _loc1_ = new CurrencyDisplay(null,true,true);
         var _loc2_:Client = GameContext.getInjector().getInstance(Client);
         if(_loc2_ != null)
         {
            _loc1_.draw(_loc2_.getCredits(),_loc2_.getFame(),_loc2_.getTokens());
         }
         _loc1_.x = 800;
         _loc1_.y = 20;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _0t2() : Shape
      {
         var _loc1_:Shape = new Shape();
         _loc1_.graphics.clear();
         _loc1_.graphics.lineStyle(2,5526612);
         _loc1_.graphics.moveTo(0,105);
         _loc1_.graphics.lineTo(800,105);
         _loc1_.graphics.moveTo(346,105);
         _loc1_.graphics.lineTo(346,526);
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _sN_() : ScreenGraphic
      {
         var _loc1_:ScreenGraphic = new ScreenGraphic();
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _0W_G_() : TextButton
      {
         var _loc1_:TextButton = null;
         _loc1_ = new TextButton(_1vk._0eS_,36,false);
         _loc1_.setAutoSize(TextFieldAutoSize.CENTER);
         _loc1_.setVerticalAlign(SimpleText.MIDDLE);
         _loc1_.x = 400 - _loc1_.width / 2;
         _loc1_.y = 550;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1st() : TextButton
      {
         var _loc1_:TextButton = null;
         _loc1_ = new TextButton(_1vk.BACK,22,false);
         _loc1_.setVerticalAlign(SimpleText.MIDDLE);
         _loc1_.x = 30;
         _loc1_.y = 550;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1lZ_() : _A_4._zp
      {
         var _loc1_:_A_4._zp = null;
         _loc1_ = new _A_4._zp();
         _loc1_.x = 351;
         _loc1_.y = 110;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _0U_P_() : _A_4.ClassDetailView
      {
         var _loc1_:_A_4.ClassDetailView = null;
         _loc1_ = new _A_4.ClassDetailView();
         _loc1_.x = 5;
         _loc1_.y = 110;
         addChild(_loc1_);
         return _loc1_;
      }
      
      public function _0o8(param1:Boolean) : void
      {
         if(!param1)
         {
            this._1ad.deactivate();
         }
      }
      
      private function _1E_S_() : _1S_m
      {
         var _loc1_:_1S_m = new _1S_m();
         _loc1_.push(this._1ad._my);
         _loc1_.complete.add(this._0kG_);
         return _loc1_;
      }
      
      private function _0kG_() : void
      {
         stage;
         this._1ad.x = 800 / 2;
      }
   }
}
