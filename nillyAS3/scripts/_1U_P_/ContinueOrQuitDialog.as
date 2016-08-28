package _1U_P_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _T_n._03K_;
   import _1gF_._I_a;
   import _yt._1gD_;
   import _T_n._1gJ_;
   import flash.events.MouseEvent;
   import _1xa._dU_;
   import _C_._1O_I_;
   import _1xa.SText;
   import com.company.assembleegameclient.util.Currency;
   import flash.filters.DropShadowFilter;
   
   public class ContinueOrQuitDialog extends Sprite
   {
       
      
      public const quit:Signal = new Signal();
      
      public const _0F_W_:Signal = new Signal(int,int);
      
      private const WIDTH:int = 350;
      
      private const HEIGHT:int = 150;
      
      private const background:_03K_ = this._1L_c();
      
      private const title:_I_a = this._1lN_();
      
      private const quitSubtitle:_I_a = this._uq();
      
      private const _13C_:_1gD_ = this._te();
      
      private const continueButton:_1gJ_ = this._0rd();
      
      private const _0l9:_I_a = this._uq();
      
      private const _1S_G_:_I_a = this._uq();
      
      private var cost:int;
      
      public function ContinueOrQuitDialog(param1:int, param2:Boolean)
      {
         super();
         this.cost = param1;
         this.continueButton.setPrice(param1,Currency.GOLD);
         this._0bC_(param2);
      }
      
      public function init(param1:int, param2:int) : void
      {
         this._9s();
         this._13C_.addEventListener(MouseEvent.CLICK,this._0Q_U_);
         this.continueButton.addEventListener(MouseEvent.CLICK,this._0Y_P_);
         this.quitSubtitle.setStringBuilder(new _dU_().setParams(_1O_I_._e8));
         this._0l9.setStringBuilder(new _dU_().setParams(_1O_I_._1L_1,{"waveNumber":param1.toString()}));
         this._1S_G_.setStringBuilder(new SText("Processing"));
         this._1S_G_.visible = false;
         this.align();
         this._0Z_a();
         this._m__();
      }
      
      public function _0bC_(param1:Boolean) : void
      {
         this._1S_G_.visible = param1;
         this.continueButton.visible = !param1;
      }
      
      public function destroy() : void
      {
         this._13C_.removeEventListener(MouseEvent.CLICK,this._0Q_U_);
         this.continueButton.removeEventListener(MouseEvent.CLICK,this._0Y_P_);
      }
      
      private function _0Q_U_(param1:MouseEvent) : void
      {
         this.quit.dispatch();
      }
      
      private function _0Y_P_(param1:MouseEvent) : void
      {
         this._0F_W_.dispatch(Currency.GOLD,this.cost);
      }
      
      private function align() : void
      {
         this.quitSubtitle.x = 70 - this.quitSubtitle.width / 2;
         this.quitSubtitle.y = 85;
         this._13C_.x = 70 - this._13C_.width / 2;
         this._13C_.y = 110;
         this._0l9.x = 105 - this._0l9.width / 2 + 140;
         this._0l9.y = 85;
         this.continueButton.x = 105 - this.continueButton.width / 2 + 140;
         this.continueButton.y = 110;
         this._1S_G_.x = 105 - this._1S_G_.width / 2 + 140;
         this._1S_G_.y = 110;
      }
      
      private function _9s() : void
      {
         stage;
         x = (800 - this.WIDTH) * 0.5;
         stage;
         y = (600 - this.HEIGHT) * 0.5;
      }
      
      private function _1L_c() : _03K_
      {
         var _loc1_:_03K_ = new _03K_();
         _loc1_.draw(this.WIDTH,this.HEIGHT);
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1lN_() : _I_a
      {
         var _loc1_:_I_a = null;
         _loc1_ = new _I_a();
         _loc1_.setSize(20).setBold(true).setColor(11776947);
         _loc1_.setStringBuilder(new _dU_().setParams(_1O_I_._1y__));
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         _loc1_.x = (this.WIDTH - _loc1_.width) * 0.5;
         _loc1_.y = 25;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _0Z_a() : void
      {
         this.background.graphics.lineStyle();
         this.background.graphics.beginFill(6710886,1);
         this.background.graphics.drawRect(1,70,this.background.width - 2,2);
         this.background.graphics.endFill();
      }
      
      private function _m__() : void
      {
         this.background.graphics.lineStyle();
         this.background.graphics.beginFill(6710886,1);
         this.background.graphics.drawRect(140,70,2,this.HEIGHT - 66);
         this.background.graphics.endFill();
      }
      
      private function _te() : _1gD_
      {
         var _loc1_:_1gD_ = new _1gD_(15,_1O_I_._1Z_k);
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _0rd() : _1gJ_
      {
         var _loc1_:_1gJ_ = new _1gJ_("",15,this.cost,Currency.GOLD);
         _loc1_._0T_g.addOnce(this.align);
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _uq() : _I_a
      {
         var _loc1_:_I_a = null;
         _loc1_ = new _I_a();
         _loc1_.setSize(15).setColor(16777215).setBold(true);
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         addChild(_loc1_);
         return _loc1_;
      }
   }
}
