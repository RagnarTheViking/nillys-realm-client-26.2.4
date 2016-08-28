package _0T_b
{
   import Frames.Frame;
   import _f7.Signal;
   import Frames._zu;
   import _Y_9.DateField;
   import _1gF_.SimpleText;
   import _C_._1O_I_;
   import _1xa._dU_;
   import flash.events.TextEvent;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.filters.DropShadowFilter;
   import _1S_0.NativeMappedSignal;
   import flash.events.MouseEvent;
   import _0O_c._H_0;
   import com.company.util._0vj;
   
   public class _mb extends Frame
   {
       
      
      private const errors:Array = [];
      
      public var register:Signal;
      
      public var signIn:Signal;
      
      public var cancel:Signal;
      
      private var _xk:_0T_b._09H_;
      
      private var _F_Q_:_0T_b._09H_;
      
      private var _0u:_0T_b._09H_;
      
      private var checkbox:_zu;
      
      private var _02E_:DateField;
      
      private var _0jQ_:SimpleText;
      
      private var _0P_6:SimpleText;
      
      private var _1U_S_:String = "</a></font>";
      
      public function _mb()
      {
         super(_1O_I_._1gB_,"RegisterWebAccountDialog.leftButton","RegisterWebAccountDialog.rightButton","/registerAccount",326);
         this._1F_Q_();
         this._1tc();
      }
      
      private function _1F_Q_() : void
      {
         this._xk = new _0T_b._09H_(_1O_I_._en,false,275);
         this._F_Q_ = new _0T_b._09H_(_1O_I_._10z,true,275);
         this._0u = new _0T_b._09H_(_1O_I_._0jU_,true,275);
         this._02E_ = new DateField();
         this._02E_.setTitle(_1O_I_._1kQ_);
         _1D_0(this._xk);
         _1D_0(this._F_Q_);
         _1D_0(this._0u);
         _F_X_(17);
         this._0kg();
      }
      
      public function _0kg() : void
      {
         this._0jQ_ = new SimpleText();
         var _loc1_:* = "<font color=\"#7777EE\"><a href=\"event:flash.events.TextEvent\">";
         this._0jQ_.setStringBuilder(new _dU_().setParams(_1O_I_._v8,{
            "signIn":_loc1_,
            "_signIn":this._1U_S_
         }));
         this._0jQ_.addEventListener(TextEvent.LINK,this._0J_n);
         this._Q_v(this._0jQ_);
      }
      
      public function _1wh() : void
      {
         this._0P_6 = new SimpleText();
         var _loc1_:* = "<font color=\"#7777EE\"><a href=\"" + Parameters._G_i + "\" target=\"_blank\">";
         var _loc2_:* = "<font color=\"#7777EE\"><a href=\"" + Parameters._0bK_ + "\" target=\"_blank\">";
         this._0P_6.setStringBuilder(new _dU_().setParams(_1O_I_._iq,{
            "tou":_loc1_,
            "_tou":this._1U_S_,
            "policy":_loc2_,
            "_policy":this._1U_S_
         }));
         this._Q_v(this._0P_6);
      }
      
      public function _Q_v(param1:SimpleText) : void
      {
         param1.setSize(12).setColor(11776947).setBold(true);
         param1.setTextWidth(275);
         param1.setMultiLine(true).setWordWrap(true).setHTML(true);
         param1.filters = [new DropShadowFilter(0,0,0)];
         addChild(param1);
         positionText(param1);
      }
      
      private function _0J_n(param1:TextEvent) : void
      {
         this.signIn.dispatch();
      }
      
      private function _1tc() : void
      {
         this.cancel = new NativeMappedSignal(cancelButton,MouseEvent.CLICK);
         actionButton.addEventListener(MouseEvent.CLICK,this._02T_);
         this.register = new Signal(_H_0);
         this.signIn = new Signal();
      }
      
      private function _02T_(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = this._0T_E_();
         this._1Y_G_();
         if(_loc2_)
         {
            this._0J_R_();
         }
      }
      
      private function _0T_E_() : Boolean
      {
         this.errors.length = 0;
         var _loc1_:Boolean = true;
         _loc1_ = this._7A_() && _loc1_;
         _loc1_ = this._0G_k() && _loc1_;
         return this._0B_i() && _loc1_;
      }
      
      private function isAgeVerified() : Boolean
      {
         var _loc1_:uint = _0C_W_._1__6(this._02E_);
         var _loc2_:* = _loc1_ >= 13;
         this._02E_._ur(!_loc2_);
         if(!_loc2_)
         {
            this.errors.push(_1O_I_._1T_7);
         }
         return _loc2_;
      }
      
      private function _02O_() : Boolean
      {
         var _loc1_:Boolean = this._02E_._1L_A_();
         this._02E_._ur(!_loc1_);
         if(!_loc1_)
         {
            this.errors.push(_1O_I_._1M_M_);
         }
         return _loc1_;
      }
      
      private function _7A_() : Boolean
      {
         var _loc1_:Boolean = _0vj._1mE_(this._xk.text());
         this._xk._ur(!_loc1_);
         if(!_loc1_)
         {
            this.errors.push(_1O_I_._pR_);
         }
         return _loc1_;
      }
      
      private function _0G_k() : Boolean
      {
         var _loc1_:* = this._F_Q_.text().length >= 5;
         this._F_Q_._ur(!_loc1_);
         if(!_loc1_)
         {
            this.errors.push(_1O_I_._9F_);
         }
         return _loc1_;
      }
      
      private function _0B_i() : Boolean
      {
         var _loc1_:* = this._F_Q_.text() == this._0u.text();
         this._0u._ur(!_loc1_);
         if(!_loc1_)
         {
            this.errors.push(_1O_I_._W_m);
         }
         return _loc1_;
      }
      
      public function _1Y_G_() : void
      {
         if(this.errors.length == 0)
         {
            this._2t();
         }
         else
         {
            this._1bi(this.errors.length == 1?this.errors[0]:_1O_I_._0R_n);
         }
      }
      
      public function _1p(param1:String) : void
      {
         this._1bi(param1);
      }
      
      private function _2t() : void
      {
         _7H_.setStringBuilder(new _dU_().setParams(_1O_I_._1gB_));
         _7H_.setColor(11776947);
      }
      
      private function _1bi(param1:String) : void
      {
         _7H_.setStringBuilder(new _dU_().setParams(param1));
         _7H_.setColor(16549442);
      }
      
      private function _0J_R_() : void
      {
         var _loc1_:_H_0 = new _H_0();
         _loc1_.username = this._xk.text();
         _loc1_.password = this._F_Q_.text();
         this.register.dispatch(_loc1_);
      }
   }
}
