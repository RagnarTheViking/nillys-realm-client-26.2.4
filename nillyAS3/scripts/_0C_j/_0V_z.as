package _0C_j
{
   import _P_S_.Mediator;
   import _3b.CloseDialogsSignal;
   
   public class _0V_z extends Mediator
   {
       
      
      [Inject]
      public var view:_0C_j._ze;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      public function _0V_z()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.closed.add(this._qN_);
      }
      
      override public function destroy() : void
      {
         this.view.closed.remove(this._qN_);
      }
      
      private function _qN_() : void
      {
         this.closeDialogs.dispatch();
      }
   }
}
