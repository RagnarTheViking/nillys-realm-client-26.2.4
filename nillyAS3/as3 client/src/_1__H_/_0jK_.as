package _1__H_
{
   import flash.display.Sprite;
   import _17B_._1dh;
   import _1gF_.SimpleText;
   import _17B_._3X_;
   import _17B_.XImageButton;
   import _f7.Signal;
   import _1xa._dU_;
   import _05g._1S_m;
   import _0xn._bf;
   import _0xn._1uk;
   import _1F_z._1Z_D_;
   
   public class _0jK_ extends Sprite
   {
       
      
      private const background:_1dh = _1uk._0P_d(_bf._0Y_O_,_bf._L_v);
      
      private const _W_H_:SimpleText = _1uk._0M_n(16777215,18,true);
      
      private const _fK_:_3X_ = _1uk._pE_();
      
      private const _1D_r:XImageButton = _1uk._V_w(_bf._0Y_O_);
      
      public var _gO_:Signal;
      
      public function _0jK_()
      {
         this._gO_ = new Signal(_1Z_D_);
         super();
      }
      
      public function init() : void
      {
         this._0J_k();
         this._0sF_();
         this._W_H_.setStringBuilder(new _dU_().setParams("Available Pets"));
         this._fK_.buttonOne._0D_S_("SELECT PET");
         this._9s();
      }
      
      private function _0sF_() : void
      {
         addChild(this.background);
         addChild(this._W_H_);
         addChild(this._fK_);
         addChild(this._1D_r);
      }
      
      private function _9s() : void
      {
         this.x = (stage.width - this.width) / 2;
         this.y = (stage.height - this.height) / 2;
      }
      
      private function _0J_k() : void
      {
         var _loc1_:_1S_m = new _1S_m();
         _loc1_.push(this._W_H_.textChanged);
         _loc1_.complete.addOnce(this._D_q);
      }
      
      private function _D_q() : void
      {
         this._W_H_.x = (_bf._0Y_O_ - this._W_H_.width) / 2;
      }
   }
}
