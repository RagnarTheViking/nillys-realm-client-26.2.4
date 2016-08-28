package _0J_8
{
   import Frames.Frame;
   import _f7.Signal;
   import Frames.TextInput;
   import Frames._zu;
   import flash.events.MouseEvent;
   import _C_._1O_I_;
   import com.company.assembleegameclient.parameters.Parameters;
   import _1xa._dU_;
   import _0O_c._H_0;
   import com.company.util._0vj;
   
   public class RegisterWebAccountDialog extends Frame
   {
       
      
      public var register:Signal;
      
      public var cancel:Signal;
      
      private var _xk:TextInput;
      
      private var _F_Q_:TextInput;
      
      private var _0u:TextInput;
      
      private var checkbox:_zu;
      
      public function RegisterWebAccountDialog()
      {
         this.register = new Signal(_H_0);
         this.cancel = new Signal();
         super(_1O_I_._L_C_,_1O_I_._19b,_1O_I_._jV_,"/kongregateRegisterAccount");
         this._0oE_();
         this._0la();
         this.addEventListeners();
      }
      
      private function addEventListeners() : void
      {
         cancelButton.addEventListener(MouseEvent.CLICK,this.onCancel);
         actionButton.addEventListener(MouseEvent.CLICK,this._02T_);
      }
      
      private function _0oE_() : void
      {
         this._xk = new TextInput(_1O_I_._en,false);
         _O_n(this._xk);
         this._F_Q_ = new TextInput(_1O_I_._10z,true);
         _O_n(this._F_Q_);
         this._0u = new TextInput(_1O_I_._0jU_,true);
         _O_n(this._0u);
         this.checkbox = new _zu("",false);
         var _loc1_:* = "<font color=\"#7777EE\"><a href=\"" + Parameters._G_i + "\" target=\"_blank\">";
         var _loc2_:* = "</a></font>.";
         this.checkbox._0F_I_(new _dU_().setParams(_1O_I_._pB_,{
            "link":_loc1_,
            "_link":_loc2_
         }));
         _1al(this.checkbox);
      }
      
      private function _0la() : void
      {
         this._xk.inputText_.tabIndex = 1;
         this._F_Q_.inputText_.tabIndex = 2;
         this._0u.inputText_.tabIndex = 3;
         this.checkbox._16u.tabIndex = 4;
         cancelButton.tabIndex = 6;
         actionButton.tabIndex = 5;
         this._xk.inputText_.tabEnabled = true;
         this._F_Q_.inputText_.tabEnabled = true;
         this._0u.inputText_.tabEnabled = true;
         this.checkbox._16u.tabEnabled = true;
         cancelButton.tabEnabled = true;
         actionButton.tabEnabled = true;
      }
      
      private function onCancel(param1:MouseEvent) : void
      {
         this.cancel.dispatch();
      }
      
      private function _02T_(param1:MouseEvent) : void
      {
         var _loc2_:_H_0 = null;
         if(this._7A_() && this._0G_k() && this._0B_i() && this._1dM_())
         {
            _loc2_ = new _H_0();
            _loc2_.username = this._xk.text();
            _loc2_.password = this._F_Q_.text();
            this.register.dispatch(_loc2_);
         }
      }
      
      private function _1dM_() : Boolean
      {
         var _loc1_:Boolean = this.checkbox._4y();
         if(!_loc1_)
         {
            this.checkbox._0gM_(_1O_I_._11y);
         }
         return _loc1_;
      }
      
      private function _7A_() : Boolean
      {
         var _loc1_:Boolean = _0vj._1mE_(this._xk.text());
         if(!_loc1_)
         {
            this._xk.setErrorText(_1O_I_._pR_);
         }
         return _loc1_;
      }
      
      private function _0G_k() : Boolean
      {
         var _loc1_:* = this._F_Q_.text().length >= 5;
         if(!_loc1_)
         {
            this._F_Q_.setErrorText(_1O_I_._M_n);
         }
         return _loc1_;
      }
      
      private function _0B_i() : Boolean
      {
         var _loc1_:* = this._F_Q_.text() == this._0u.text();
         if(!_loc1_)
         {
            this._0u.setErrorText(_1O_I_._M_g);
         }
         return _loc1_;
      }
      
      public function _0iV_(param1:String) : void
      {
         this._xk.setErrorText(param1);
      }
   }
}
