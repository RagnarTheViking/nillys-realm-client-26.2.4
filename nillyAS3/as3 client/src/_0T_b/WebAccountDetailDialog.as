package _0T_b
{
   import Frames.Frame;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui._03S_;
   import _1xa.SText;
   import flash.events.MouseEvent;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   import _1S_0.NativeMappedSignal;
   
   public class WebAccountDetailDialog extends Frame
   {
       
      
      public var cancel:Signal;
      
      public var change:Signal;
      
      public var logout:Signal;
      
      public var verify:Signal;
      
      private var loginText:SimpleText;
      
      private var _0S_q:SimpleText;
      
      private var _11N_:_03S_;
      
      private var _09d:_03S_;
      
      private var _wO_:_03S_;
      
      public function WebAccountDetailDialog()
      {
         super("WebAccountDetailDialog.title","","WebAccountDetailDialog.rightButton","/currentLogin");
         this._1mV_();
         this._1s7();
         h_ = h_ + 88;
         this.cancel = new NativeMappedSignal(actionButton,MouseEvent.CLICK);
         this.change = new Signal();
         this.logout = new Signal();
         this.verify = new Signal();
      }
      
      public function _1vi(param1:String, param2:Boolean) : void
      {
         this._0S_q.setStringBuilder(new SText(param1));
         this._0oG_();
         this._0U_w();
      }
      
      private function _0F_c() : void
      {
         if(this._11N_ != null)
         {
            removeChild(this._11N_);
         }
         this._11N_ = new _03S_(12,false,"WebAccountDetailDialog.verify");
         _oP_(this._11N_);
         this._11N_.addEventListener(MouseEvent.CLICK,this._0Y_S_);
      }
      
      private function _0oG_() : void
      {
         if(this._09d != null)
         {
            removeChild(this._09d);
         }
         this._09d = new _03S_(12,false,"WebAccountDetailDialog.changePassword");
         this._09d.addEventListener(MouseEvent.CLICK,this._1C___);
         _oP_(this._09d);
      }
      
      private function _1C___(param1:MouseEvent) : void
      {
         this.change.dispatch();
      }
      
      private function _0U_w() : void
      {
         if(this._wO_ != null)
         {
            removeChild(this._wO_);
         }
         this._wO_ = new _03S_(12,false,"WebAccountDetailDialog.logout");
         this._wO_.addEventListener(MouseEvent.CLICK,this._Q_y);
         _oP_(this._wO_);
      }
      
      private function _Q_y(param1:MouseEvent) : void
      {
         this.logout.dispatch();
      }
      
      private function _1mV_() : void
      {
         this.loginText = new SimpleText().setSize(18).setColor(11776947);
         this.loginText.setBold(true);
         this.loginText.setStringBuilder(new _dU_().setParams("WebAccountDetailDialog.loginText"));
         this.loginText.filters = [new DropShadowFilter(0,0,0)];
         this.loginText.y = h_ - 60;
         this.loginText.x = 17;
         addChild(this.loginText);
      }
      
      private function _1s7() : void
      {
         this._0S_q = new SimpleText().setSize(16).setColor(11776947);
         this._0S_q.y = h_ - 30;
         this._0S_q.x = 17;
         addChild(this._0S_q);
      }
      
      private function _0Y_S_(param1:MouseEvent) : void
      {
         this.verify.dispatch();
         this._11N_._1zL_("WebAccountDetailDialog.sent");
      }
   }
}
