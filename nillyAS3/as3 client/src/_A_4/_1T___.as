package _A_4
{
   import _P_S_.Mediator;
   import _v4.Client;
   import _1T_4._0es;
   import _0jo._1xX_;
   import _W_Q_._1R_U_;
   import _ge._1R_J_;
   
   public class _1T___ extends Mediator
   {
       
      
      [Inject]
      public var view:_A_4._P_8;
      
      [Inject]
      public var model:Client;
      
      [Inject]
      public var _kU_:_0es;
      
      [Inject]
      public var play:_1xX_;
      
      public function _1T___()
      {
         super();
      }
      
      override public function initialize() : void
      {
         var _loc1_:Boolean = this.model.hasAvailableCharSlot();
         this.view._0o8(_loc1_);
         if(_loc1_)
         {
            this.view.play.addOnce(this._D_X_);
         }
         this.view.back.addOnce(this._1O_U_);
      }
      
      override public function destroy() : void
      {
         this.view.back.remove(this._1O_U_);
         this.view.play.remove(this._D_X_);
      }
      
      private function _1O_U_() : void
      {
         this._kU_.dispatch(new _1R_U_());
      }
      
      private function _D_X_() : void
      {
         var _loc1_:_1R_J_ = new _1R_J_();
         _loc1_._1F_H_ = true;
         _loc1_.charId = this.model.getNextCharId();
         _loc1_._B_o = -1;
         _loc1_._vt = true;
         this.play.dispatch(_loc1_);
      }
   }
}
