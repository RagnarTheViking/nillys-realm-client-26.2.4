package _0T_b
{
   import _P_S_.Mediator;
   import _4w._1B_z;
   import _3b.DialogSignal;
   import _1T_4._34;
   import _0O_c._0G_R_;
   import _C_._1O_I_;
   import _0pN_._1nd;
   
   public class _0A_x extends Mediator
   {
       
      
      [Inject]
      public var view:_0T_b.WebChangePasswordDialog;
      
      [Inject]
      public var change:_1B_z;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0F_n:_34;
      
      public function _0A_x()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.change.add(this._1C___);
         this.view.cancel.add(this.onCancel);
         this._0F_n.add(this._B_H_);
      }
      
      override public function destroy() : void
      {
         this.view.change.remove(this._1C___);
         this.view.cancel.remove(this.onCancel);
         this._0F_n.remove(this._B_H_);
      }
      
      private function onCancel() : void
      {
         this._06Z_.dispatch(new WebAccountDetailDialog());
      }
      
      private function _1C___() : void
      {
         var _loc1_:_0G_R_ = null;
         if(this._hf() && this._1kr() && this._0G_0())
         {
            this.view.disable();
            this.view._0uq();
            _loc1_ = new _0G_R_();
            _loc1_._1rh = this.view.password_.text();
            _loc1_.newPassword = this.view._0J_I_.text();
            this.change.dispatch(_loc1_);
         }
      }
      
      private function _hf() : Boolean
      {
         var _loc1_:* = this.view.password_.text().length >= 5;
         if(!_loc1_)
         {
            this.view.password_.setErrorText(_1O_I_._1qn);
         }
         return _loc1_;
      }
      
      private function _1kr() : Boolean
      {
         var _loc1_:* = this.view._0J_I_.text().length >= 10;
         if(!_loc1_)
         {
            this.view._0J_I_.setErrorText(_1O_I_._M_n);
         }
         return _loc1_;
      }
      
      private function _0G_0() : Boolean
      {
         var _loc1_:* = this.view._0J_I_.text() == this.view._T_r.text();
         if(!_loc1_)
         {
            this.view._T_r.setErrorText(_1O_I_._M_g);
         }
         return _loc1_;
      }
      
      private function _B_H_(param1:_1nd) : void
      {
         this.view._0gM_(param1.error);
         this.view._0F_M_();
      }
   }
}
