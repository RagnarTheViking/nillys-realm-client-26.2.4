package _1__H_
{
   import _1O_R_._1uu;
   import _f7.Signal;
   import _17B_._0P_T_;
   import _17B_._1dh;
   import _1gF_.SimpleText;
   import _17B_.PetFuser;
   import _17B_.XImageButton;
   import _17B_.FusionStrength;
   import _1F_z._07p;
   import _1xa._dU_;
   import _C_._1O_I_;
   import _0xn._14N_;
   import _1F_z._1r__;
   import _0xn._bf;
   import _05g._1S_m;
   import _0xn._1uk;
   
   public class _0vs extends _M_t implements _1uu
   {
      
      private static const _1ca:Signal = new Signal();
       
      
      public const _fK_:_0P_T_ = _1uk._0N_s(_1O_I_._1P_w,_bf._108 - 39);
      
      private const background:_1dh = _1uk._1H_();
      
      private const _W_H_:SimpleText = _1uk._01t(11776947,18,true);
      
      private const _2__8:SimpleText = _1uk._1P_t();
      
      private const _1I_r:PetFuser = _1uk._00w();
      
      private const _1D_r:XImageButton = _1uk._V_w(_bf._0Y_O_);
      
      private const _0fN_:FusionStrength = _1uk._1zG_();
      
      public const closed:Signal = new Signal();
      
      public var _0__W_:Signal;
      
      public var _0T_P_:Signal;
      
      public var _I_G_:Signal;
      
      public function _0vs()
      {
         super();
         this._fK_.clicked.addOnce(this._1ul);
      }
      
      public function init(param1:_07p) : void
      {
         this._W_H_.setStringBuilder(new _dU_().setParams(_1O_I_._1tS_));
         this._0__W_ = this._1I_r._0__W_;
         this._0T_P_ = this._fK_._1eI_;
         this._I_G_ = this._fK_._03H_;
         this._fK_._1X_u(!param1._wo());
         this._fK_.setPrefix(!!param1._wo()?_1O_I_._1P_w:_1O_I_._1N_T_);
         if(param1._wo())
         {
            this._fK_._1qI_(_14N_._F_v(_1r__._0Q_J_(param1._05k._1b8())));
            this._fK_._N_e(_14N_._0Q_c(_1r__._0Q_J_(param1._05k._1b8())));
         }
         this._1D_r.clicked.add(this._fH_);
         this._0J_k();
         this._0sF_();
         this._1fU_();
      }
      
      private function _1ul() : void
      {
         _1ca.dispatch();
      }
      
      public function destroy() : void
      {
         this._fK_._1ja.remove(this._F_P_);
      }
      
      private function _0sF_() : void
      {
         addChild(this.background);
         addChild(this._W_H_);
         addChild(this._2__8);
         addChild(this._fK_);
         addChild(this._1I_r);
         addChild(this._0fN_);
         addChild(this._1D_r);
      }
      
      private function _1fU_() : void
      {
         _9s();
         this._0sq();
      }
      
      private function _0sq() : void
      {
         this._1I_r.x = Math.round((_bf._0Y_O_ - this._1I_r.width) * 0.5);
      }
      
      private function _0J_k() : void
      {
         var _loc1_:_1S_m = new _1S_m();
         _loc1_.push(this._W_H_.textChanged);
         _loc1_.push(this._2__8.textChanged);
         _loc1_.complete.addOnce(this._D_q);
         this._fK_._1ja.add(this._F_P_);
      }
      
      private function _D_q() : void
      {
         this._W_H_.y = 5;
         this._W_H_.x = (_bf._0Y_O_ - this._W_H_.width) * 0.5;
         this._2__8.x = (_bf._0Y_O_ - this._2__8.width) * 0.5;
      }
      
      private function _F_P_() : void
      {
         this._fK_.x = (_bf._0Y_O_ - this._fK_.width) / 2;
      }
      
      private function _fH_() : void
      {
         this.closed.dispatch();
      }
      
      public function _1tG_() : Signal
      {
         return _1ca;
      }
   }
}
