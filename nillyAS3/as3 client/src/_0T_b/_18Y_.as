package _0T_b
{
   import _P_S_.Mediator;
   import _m2._0dB_;
   import _3b.DialogSignal;
   import _1T_4._34;
   import _0pN_._1nd;
   
   public class _18Y_ extends Mediator
   {
       
      
      [Inject]
      public var view:_0T_b.WebForgotPasswordDialog;
      
      [Inject]
      public var _1k__:_0dB_;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _1Z_a:_34;
      
      public function _18Y_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.submit.add(this._0oA_);
         this.view.register.add(this._02T_);
         this.view.cancel.add(this.onCancel);
         this._1Z_a.add(this._1pX_);
      }
      
      override public function destroy() : void
      {
         this.view.submit.remove(this._0oA_);
         this.view.register.remove(this._02T_);
         this.view.cancel.remove(this.onCancel);
         this._1Z_a.add(this._1pX_);
      }
      
      private function _5__() : void
      {
         this.view._0F_M_();
      }
      
      private function _fH_() : void
      {
         this.view.parent.removeChild(this.view);
      }
      
      private function _0oA_(param1:String) : void
      {
         this._1k__.dispatch(param1);
      }
      
      private function _02T_() : void
      {
         this._06Z_.dispatch(new _mb());
      }
      
      private function onCancel() : void
      {
         this._06Z_.dispatch(new WebLoginDialog());
      }
      
      private function _1pX_(param1:_1nd) : void
      {
         this.view._0iV_(param1.error);
         this.view._0F_M_();
      }
   }
}
