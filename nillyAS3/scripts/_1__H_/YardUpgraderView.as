package _1__H_
{
   import flash.display.Sprite;
   import _17B_._1dh;
   import _1gF_.SimpleText;
   import _17B_._0P_T_;
   import _17B_.XImageButton;
   import flash.display.DisplayObject;
   import _f7.Signal;
   import _1F_z._0B_P_;
   import _1xa._dU_;
   import _0xn._bf;
   import flash.text.TextFormatAlign;
   import _05g._1S_m;
   import _0xn._1uk;
   
   public class YardUpgraderView extends Sprite
   {
       
      
      private var _N_P_:Class;
      
      private const background:_1dh = _1uk._vL_(_bf._0Y_O_,392);
      
      private const _W_H_:SimpleText = _1uk._0M_n(16777215,18,true);
      
      private const _n1:SimpleText = _1uk._0M_n(11776947,13,false);
      
      private const _8:SimpleText = _1uk._0M_n(16777103,16,true);
      
      private const _fK_:_0P_T_ = _1uk._0N_s("YardUpgraderView.upgrade",357);
      
      private const _1D_r:XImageButton = _1uk._V_w(_bf._0Y_O_);
      
      private const _0zF_:DisplayObject = new this._N_P_();
      
      private const _iC_:_1__H_._dw = new _1__H_._dw();
      
      public const closed:Signal = new Signal();
      
      public var _I_G_:Signal;
      
      public var _0T_P_:Signal;
      
      private var _W_d:_0B_P_;
      
      public function YardUpgraderView()
      {
         this._N_P_ = _38;
         super();
      }
      
      public function init(param1:_0B_P_) : void
      {
         this._W_d = param1;
         this._1D_r.clicked.add(this._qN_);
         this._p();
         this._t1();
         this._0J_k();
         this._0sF_();
         this._1fU_();
      }
      
      private function _p() : void
      {
         this._I_G_ = this._fK_._03H_;
         this._0T_P_ = this._fK_._1eI_;
         this._fK_._N_e(this._W_d._pd);
         this._fK_._1qI_(this._W_d._X_e);
      }
      
      private function _t1() : void
      {
         this._W_H_.setStringBuilder(new _dU_().setParams("YardUpgraderView.title"));
         this._8.setStringBuilder(new _dU_().setParams(this._0dH_(this._W_d._14Z_)));
         this._n1.setStringBuilder(new _dU_().setParams("YardUpgraderView.info"));
         this._n1.setTextWidth(_bf._0Y_O_ - 40).setWordWrap(true).setHorizontalAlign(TextFormatAlign.CENTER);
         this._iC_._0kA_("YardUpgraderView.currentMax",this._0dH_(this._W_d._0E_L_));
      }
      
      private function _0dH_(param1:String) : String
      {
         return "{" + param1 + "}";
      }
      
      private function _qN_() : void
      {
         this.closed.dispatch();
      }
      
      public function destroy() : void
      {
         this._fK_._1ja.remove(this._F_P_);
      }
      
      public function _fE_(param1:int) : void
      {
         this._fK_._1qI_(param1);
      }
      
      public function _U_P_(param1:int) : void
      {
         this._fK_._N_e(param1);
      }
      
      private function _i4(param1:Boolean) : void
      {
         this._1D_r.disabled = param1;
         this._fK_._1X_u(param1);
      }
      
      private function _0sF_() : void
      {
         this._0zF_.y = 31;
         addChild(this.background);
         addChild(this._W_H_);
         addChild(this._8);
         addChild(this._n1);
         addChild(this._fK_);
         addChild(this._1D_r);
         addChild(this._0zF_);
         addChild(this._iC_);
      }
      
      private function _1fU_() : void
      {
         this._9s();
         this._0zF_.y = 30;
         this._iC_.x = 11;
         this._iC_.y = 300;
      }
      
      private function _9s() : void
      {
         stage;
         this.x = (800 - this.width) * 0.5;
         stage;
         this.y = (600 - this.height) * 0.5;
      }
      
      private function _0J_k() : void
      {
         var _loc1_:_1S_m = new _1S_m();
         _loc1_.push(this._W_H_.textChanged);
         _loc1_.push(this._n1.textChanged);
         _loc1_.push(this._8.textChanged);
         _loc1_.complete.addOnce(this._D_q);
         this._fK_._1ja.add(this._F_P_);
      }
      
      private function _D_q() : void
      {
         this._W_H_.x = (_bf._0Y_O_ - this._W_H_.width) * 0.5;
         this._n1.x = (_bf._0Y_O_ - this._n1.width) * 0.5;
         this._8.x = (_bf._0Y_O_ - this._8.width) * 0.5;
         this._W_H_.y = 20;
         this._n1.y = 229;
         this._8.y = 269;
      }
      
      private function _F_P_() : void
      {
         this._fK_.x = (_bf._0Y_O_ - this._fK_.width) / 2;
      }
   }
}
