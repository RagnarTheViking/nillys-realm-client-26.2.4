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
   import _1gF_.SimpleText;
   import _1xa.SText;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.filters.DropShadowFilter;
   import _1S_0.NativeMappedSignal;
   
   public class _0E___ extends Frame
   {
       
      
      public var _1fC_:Signal;
      
      public var forgot:Signal;
      
      public var register:Signal;
      
      public var email:TextInput;
      
      private var password:TextInput;
      
      private var _S_m:_03S_;
      
      private var _0L_Y_:_03S_;
      
      public function _0E___(param1:Boolean = false)
      {
         super(_1O_I_._12D_,"",_1O_I_._1vF_,"/signIn");
         this._1R_y();
         if(param1)
         {
            addChild(this._1g8("Attention!",-165,-85).setColor(16711680));
            addChild(this._1g8("A new password was sent to your Sign In Email Address.",-165,-65));
            addChild(this._1g8("Please use the new password to Sign In.",-165,-45));
         }
         this.forgot = new NativeMappedSignal(this._S_m,MouseEvent.CLICK);
         this.register = new NativeMappedSignal(this._0L_Y_,MouseEvent.CLICK);
         this._1fC_ = new Signal(_H_0);
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
            this._1fC_.dispatch(_loc1_);
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
      
      public function _1g8(param1:String, param2:int, param3:int) : SimpleText
      {
         var _loc4_:SimpleText = null;
         _loc4_ = new SimpleText().setSize(16).setColor(16777215).setTextWidth(600);
         _loc4_.setBold(true);
         _loc4_.setStringBuilder(new SText(param1));
         _loc4_.setSize(16).setColor(16777215);
         _loc4_.setWordWrap(true);
         _loc4_.setMultiLine(true);
         _loc4_.setAutoSize(TextFieldAutoSize.CENTER);
         _loc4_.setHorizontalAlign(TextFormatAlign.CENTER);
         _loc4_.filters = [new DropShadowFilter(0,0,0)];
         _loc4_.x = param2;
         _loc4_.y = param3;
         return _loc4_;
      }
   }
}
