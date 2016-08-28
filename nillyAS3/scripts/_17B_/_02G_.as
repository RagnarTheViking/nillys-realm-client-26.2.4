package _17B_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import _f7._15B_;
   import _1F_z._gC_;
   import flash.events.MouseEvent;
   import _0xn._1uk;
   import _0xn._bf;
   import _1xa._dU_;
   import _C_._1O_I_;
   import _05g._1S_m;
   import ToolTips.ToolTip;
   import _1S_0._1mh;
   
   public class _02G_ extends Sprite
   {
       
      
      public const _1am:Signal = new Signal(ToolTip);
      
      public var _0E_X_:SimpleText;
      
      private var _U___:_15B_;
      
      private var _R_d:SimpleText;
      
      private var _W_d:_gC_;
      
      private var _1fZ_:int;
      
      private var textColor:int;
      
      private var tooltip:_17B_._0im;
      
      public function _02G_(param1:_gC_, param2:int)
      {
         super();
         this._W_d = param1;
         this._1fZ_ = param2;
         this._U___ = new _1mh(this,MouseEvent.MOUSE_OVER).add(this._86);
         this.textColor = !!param1._19q()?11776947:6710886;
         this._1__b();
         this._D_Z_();
         param1._aL_.add(this._E_a);
      }
      
      public function destroy() : void
      {
         this._W_d._aL_.remove(this._E_a);
      }
      
      private function _E_a(param1:_gC_) : void
      {
         this._1Q_m();
      }
      
      private function _86(param1:MouseEvent) : void
      {
         this.tooltip = new _17B_._0im(this._W_d);
         this.tooltip._0Z_3(this);
         this._1am.dispatch(this.tooltip);
      }
      
      private function _D_Z_() : void
      {
         graphics.beginFill(this.textColor);
         graphics.drawCircle(0,-5,1.5);
      }
      
      private function _1__b() : void
      {
         this._nL_();
         if(this._W_d._19q())
         {
            this._1Z_2();
         }
      }
      
      private function _1Z_2() : void
      {
         this._0E_X_ = _1uk._0M_n(this.textColor,13,true);
         addChild(this._0E_X_);
         this._0J_k();
         this._1Q_m();
         this._W_d.level >= _bf._tK_ && this._0E_X_.setColor(_bf._1q5);
      }
      
      private function _1Q_m() : void
      {
         if(this._0E_X_)
         {
            this._0E_X_.setStringBuilder(new _dU_().setParams(this._0Z_S_(this._W_d),{"level":this._W_d.level}));
         }
      }
      
      private function _nL_() : void
      {
         this._R_d = _1uk._0M_n(this.textColor,13,true);
         this._R_d.setStringBuilder(new _dU_().setParams(this._W_d.name));
         this._R_d.x = 3;
         addChild(this._R_d);
      }
      
      private function _0Z_S_(param1:_gC_) : String
      {
         return param1.level < _bf._tK_?_1O_I_._1F_i:_1O_I_._0q4;
      }
      
      private function _0J_k() : void
      {
         var _loc1_:_1S_m = new _1S_m();
         _loc1_.push(this._0E_X_.textChanged);
         _loc1_.complete.addOnce(this._D_q);
      }
      
      private function _D_q() : void
      {
         this._0E_X_.x = this._1fZ_ - this._0E_X_.width;
      }
   }
}
