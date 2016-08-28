package _05g
{
   import _P_S_.Mediator;
   import _1O_R_.ErrorDialog;
   import _1T_4._kc;
   import _1T_4._1U_z;
   import _3b.CloseDialogsSignal;
   import flash.events.Event;
   import _W_Q_.CharacterSelectionAndNewsScreen;
   
   public class _152 extends Mediator
   {
       
      
      [Inject]
      public var view:ErrorDialog;
      
      [Inject]
      public var _0w9:_kc;
      
      [Inject]
      public var _0rh:_1U_z;
      
      [Inject]
      public var close:CloseDialogsSignal;
      
      public function _152()
      {
         super();
      }
      
      override public function initialize() : void
      {
         _1hQ_(Event.COMPLETE,this.onComplete);
         this.view.ok.addOnce(this._fH_);
      }
      
      override public function destroy() : void
      {
         _1y7(Event.COMPLETE,this.onComplete);
      }
      
      public function _fH_() : void
      {
         this.close.dispatch();
      }
      
      private function onComplete(param1:Event) : void
      {
         this._0w9.dispatch();
         this._0rh.dispatch(new CharacterSelectionAndNewsScreen());
      }
   }
}
