package _P_N_
{
   import _17B_.XImageButton;
   import _1un.Size;
   import com.company.assembleegameclient.ui._0fL_;
   import _0xn._1uk;
   
   public class _0at extends FancyDialog
   {
      
      private static const padding:int = 12;
      
      private static const _0Q_z:int = 217;
       
      
      public var _pC_:_P_N_.PetPicker;
      
      public var _1D_r:XImageButton;
      
      public function _0at(param1:_P_N_.PetPicker)
      {
         super("PetPicker.title","PetPicker.text",null,null,null);
         this._pC_ = param1;
         this._171();
         this._1D_r = _1uk._V_w(_0Y_0);
         box_.addChild(this._1D_r);
      }
      
      override protected function setDialogWidth() : int
      {
         return 330;
      }
      
      private function _171() : void
      {
         this._pC_.setSize(new Size(_0Y_0 - padding * 2,_0Q_z));
         this._pC_._1gC_(8);
         this._pC_._N_r(48);
      }
      
      override protected function drawAdditionalUI() : void
      {
         super.drawAdditionalUI();
         this._I_z();
         this._xM_();
      }
      
      private function _xM_() : void
      {
         this._pC_.x = padding;
         this._pC_.y = this._Y_i();
         box_.addChild(this._pC_);
      }
      
      private function _I_z() : void
      {
         var _loc1_:_0fL_ = null;
         _loc1_ = new _0fL_(_0Y_0 - padding * 2,0);
         _loc1_.x = padding;
         _loc1_.y = this._Y_i();
         box_.addChild(_loc1_);
      }
      
      private function _Y_i() : Number
      {
         return box_.getBounds(this).bottom + padding;
      }
      
      override protected function getBoxHeight() : Number
      {
         return super.getBoxHeight() - (this._pC_.height - _0Q_z);
      }
   }
}
