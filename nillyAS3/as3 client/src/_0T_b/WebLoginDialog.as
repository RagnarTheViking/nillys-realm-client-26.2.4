package _0T_b
{
   import Frames.Frame;
   import _f7.Signal;
   import Frames.TextInput;
   import com.company.assembleegameclient.ui._03S_;
   import _C_._1O_I_;
   import flash.events.MouseEvent;
   import flash.events.KeyboardEvent;
   import flash.events.Event;
   import com.company.util.Keys;
   import _0O_c._H_0;
   import _1S_0.NativeMappedSignal;
   
   public class WebLoginDialog extends Frame
   {
       
      
      public var cancel:Signal;
      
      public var signIn:Signal;
      
      public var forgot:Signal;
      
      public var register:Signal;
      
      private var email:TextInput;
      
      private var password:TextInput;
      
      private var _S_m:_03S_;
      
      private var _0L_Y_:_03S_;
      
      public function WebLoginDialog()
      {
         super(_1O_I_._12D_,_1O_I_._A_C_,_1O_I_._1vF_,"/signIn");
         this._1R_y();
         this.forgot = new NativeMappedSignal(this._S_m,MouseEvent.CLICK);
         this.register = new NativeMappedSignal(this._0L_Y_,MouseEvent.CLICK);
         this.cancel = new NativeMappedSignal(cancelButton,MouseEvent.CLICK);
         this.signIn = new Signal(_H_0);
      }
      
      private function _1R_y() : void
      {
         this.email = new TextInput(_1O_I_._159,false);
         _O_n(this.email);
         this.password = new TextInput(_1O_I_._1uR_,true);
         _O_n(this.password);
         this._S_m = new _03S_(12,false,_1O_I_._06B_);
         _oP_(this._S_m);
         this._0L_Y_ = new _03S_(12,false,_1O_I_._1V_K_);
         _oP_(this._0L_Y_);
         actionButton.addEventListener(MouseEvent.CLICK,this._1ut);
         addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keys.ENTER)
         {
            this._om();
         }
      }
      
      private function onCancel(param1:MouseEvent) : void
      {
         this.cancel.dispatch();
      }
      
      private function _1ut(param1:MouseEvent) : void
      {
         this._om();
      }
      
      private function _om() : void
      {
         var _loc1_:_H_0 = null;
         if(this._7A_() && this._0G_k())
         {
            _loc1_ = new _H_0();
            _loc1_.username = this.email.text();
            _loc1_.password = this.password.text();
            this.signIn.dispatch(_loc1_);
         }
      }
      
      private function _0G_k() : Boolean
      {
         var _loc1_:* = this.password.text() != "";
         if(!_loc1_)
         {
            this.password.setErrorText(_1O_I_._12d);
         }
         return _loc1_;
      }
      
      private function _7A_() : Boolean
      {
         var _loc1_:* = this.email.text() != "";
         if(!_loc1_)
         {
            this.email.setErrorText(_1O_I_._G_J_);
         }
         return _loc1_;
      }
      
      public function _0gM_(param1:String) : void
      {
         this.password.setErrorText(param1);
      }
   }
}
