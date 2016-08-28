package _0T_b
{
   import Frames.Frame;
   import _f7.Signal;
   import Frames.TextInput;
   import com.company.assembleegameclient.ui._03S_;
   import flash.events.MouseEvent;
   import _1S_0.NativeMappedSignal;
   
   public class WebForgotPasswordDialog extends Frame
   {
       
      
      public var cancel:Signal;
      
      public var submit:Signal;
      
      public var register:Signal;
      
      private var _xk:TextInput;
      
      private var _0L_Y_:_03S_;
      
      public function WebForgotPasswordDialog()
      {
         super("WebForgotPasswordDialog.title","WebForgotPasswordDialog.leftButton","WebForgotPasswordDialog.rightButton","/forgotPassword");
         this._xk = new TextInput("WebForgotPasswordDialog.email",false);
         _O_n(this._xk);
         this._0L_Y_ = new _03S_(12,false,"WebForgotPasswordDialog.register");
         _oP_(this._0L_Y_);
         actionButton.addEventListener(MouseEvent.CLICK,this._0oA_);
         this.cancel = new NativeMappedSignal(cancelButton,MouseEvent.CLICK);
         this.register = new NativeMappedSignal(this._0L_Y_,MouseEvent.CLICK);
         this.submit = new Signal(String);
      }
      
      private function _0oA_(param1:MouseEvent) : void
      {
         if(this._7A_())
         {
            disable();
            this.submit.dispatch(this._xk.text());
         }
      }
      
      private function _7A_() : Boolean
      {
         var _loc1_:* = this._xk.text() != "";
         if(!_loc1_)
         {
            this._xk.setErrorText("Not a valid email address");
         }
         return _loc1_;
      }
      
      public function _0iV_(param1:String) : void
      {
         this._xk.setErrorText(param1);
      }
   }
}
