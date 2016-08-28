package _1oP_
{
   import _P_N_.FancyDialog;
   import _1O_R_._1uu;
   import _1O_R_._1O_f;
   import _1F_z._1Z_D_;
   import _1O_R_.Dialog;
   import flash.events.Event;
   import _f7.Signal;
   import _C_._1O_I_;
   
   public class _09m extends FancyDialog implements _1uu
   {
       
      
      private const _0M_v:_1O_f = new _1O_f();
      
      [Inject]
      public var release:_1oP_._9L_;
      
      private var petVO:_1Z_D_;
      
      public function _09m(param1:_1Z_D_)
      {
         super(_1O_I_._lO_,_1O_I_._zr,_1O_I_._6b,_1O_I_._0cV_,null);
         this.petVO = param1;
         this._17V_();
      }
      
      override protected function setDialogWidth() : int
      {
         return 400;
      }
      
      private function _17V_() : void
      {
         this._0M_v.add(this,Dialog.RIGHT_BUTTON);
         this._0M_v.add(this,Dialog.LEFT_BUTTON);
         addEventListener(Dialog.LEFT_BUTTON,this._0J_0);
      }
      
      private function _0J_0(param1:Event) : void
      {
         removeEventListener(Dialog.LEFT_BUTTON,this._0J_0);
         this.release.dispatch(this.petVO._0__5());
      }
      
      public function _1tG_() : Signal
      {
         return this._0M_v._1tG_();
      }
      
      public function getPetVO() : _1Z_D_
      {
         return this.petVO;
      }
   }
}
