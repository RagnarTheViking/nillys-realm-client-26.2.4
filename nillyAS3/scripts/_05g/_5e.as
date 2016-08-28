package _05g
{
   import _P_S_.Mediator;
   import _m2._0S_X_;
   
   public class _5e extends Mediator
   {
       
      
      [Inject]
      public var view:_05g.ChooseNameRegisterDialog;
      
      [Inject]
      public var _0yK_:_0S_X_;
      
      public function _5e()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.register.add(this._02T_);
         this.view.cancel.add(this.onCancel);
      }
      
      override public function destroy() : void
      {
         this.view.register.remove(this._02T_);
         this.view.cancel.remove(this.onCancel);
      }
      
      private function _02T_() : void
      {
         this.onCancel();
         this._0yK_.dispatch();
      }
      
      private function onCancel() : void
      {
         this.view.parent.removeChild(this.view);
      }
   }
}
