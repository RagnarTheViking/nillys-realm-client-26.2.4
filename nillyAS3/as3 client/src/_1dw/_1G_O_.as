package _1dw
{
   import _P_S_.Mediator;
   import _0J_8.RegisterWebAccountDialog;
   import _m2._D_h;
   import _3b.CloseDialogsSignal;
   import _0O_c._H_0;
   
   public class _1G_O_ extends Mediator
   {
       
      
      [Inject]
      public var view:RegisterWebAccountDialog;
      
      [Inject]
      public var register:_D_h;
      
      [Inject]
      public var _1n0:CloseDialogsSignal;
      
      public function _1G_O_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.register.add(this._02T_);
         this.view.cancel.add(this._fH_);
      }
      
      override public function destroy() : void
      {
         this.view.register.remove(this._02T_);
      }
      
      private function _02T_(param1:_H_0) : void
      {
         this.register.dispatch(param1);
      }
      
      private function _fH_() : void
      {
         this._1n0.dispatch();
      }
   }
}
