package _0T_b
{
   import Frames.Frame;
   import _f7.Signal;
   import Frames.TextInput;
   import flash.events.MouseEvent;
   import _0O_c._0G_R_;
   import _C_._1O_I_;
   import _1S_0.NativeMappedSignal;
   
   public class WebChangePasswordDialog extends Frame
   {
       
      
      public var cancel:Signal;
      
      public var change:Signal;
      
      public var password_:TextInput;
      
      public var _0J_I_:TextInput;
      
      public var _T_r:TextInput;
      
      public function WebChangePasswordDialog()
      {
         super(_1O_I_._i7,_1O_I_._1N_0,_1O_I_._1X_p,"/changePassword");
         this.password_ = new TextInput(_1O_I_._I_H_,true);
         _O_n(this.password_);
         this._0J_I_ = new TextInput(_1O_I_._1T_H_,true);
         _O_n(this._0J_I_);
         this._T_r = new TextInput(_1O_I_._1V_g,true);
         _O_n(this._T_r);
         this.cancel = new NativeMappedSignal(cancelButton,MouseEvent.CLICK);
         this.change = new NativeMappedSignal(actionButton,MouseEvent.CLICK);
      }
      
      private function _1C___(param1:MouseEvent) : void
      {
         var _loc2_:_0G_R_ = null;
         if(this._hf() && this._1kr() && this._0G_0())
         {
            disable();
            _loc2_ = new _0G_R_();
            _loc2_._1rh = this.password_.text();
            _loc2_.newPassword = this._0J_I_.text();
            this.change.dispatch(_loc2_);
         }
      }
      
      private function _hf() : Boolean
      {
         var _loc1_:* = this.password_.text().length >= 5;
         if(!_loc1_)
         {
            this.password_.setErrorText(_1O_I_._1qn);
         }
         return _loc1_;
      }
      
      private function _1kr() : Boolean
      {
         var _loc1_:* = this._0J_I_.text().length >= 5;
         if(!_loc1_)
         {
            this._0J_I_.setErrorText(_1O_I_._1I_7);
         }
         return _loc1_;
      }
      
      private function _0G_0() : Boolean
      {
         var _loc1_:* = this._0J_I_.text() == this._T_r.text();
         if(!_loc1_)
         {
            this._T_r.setErrorText(_1O_I_._0C_V_);
         }
         return _loc1_;
      }
      
      public function _0gM_(param1:String) : void
      {
         this.password_.setErrorText(param1);
      }
      
      public function _0uq() : void
      {
         this.password_.clearErrorText();
         this._T_r.clearErrorText();
         this._0J_I_.clearErrorText();
      }
   }
}
