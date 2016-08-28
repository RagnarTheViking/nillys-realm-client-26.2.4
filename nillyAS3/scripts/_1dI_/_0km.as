package _1dI_
{
   import _P_S_.Mediator;
   import _0db._1A_c;
   import _1__0._1zx;
   import _3b.CloseDialogsSignal;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   
   public class _0km extends Mediator
   {
       
      
      [Inject]
      public var view:_1dI_.ConfirmDeleteCharacterDialog;
      
      [Inject]
      public var model:_1A_c;
      
      [Inject]
      public var deleteCharacter:_1zx;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      private var character:SavedCharacter;
      
      public function _0km()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.deleteCharacter.add(this._fj);
         this.view.cancel.add(this._0dR_);
         this.character = this.model._1H_j();
         this.view._0D_S_(this.character.name(),this.character._0rS_());
      }
      
      override public function destroy() : void
      {
         this.view.deleteCharacter.remove(this._fj);
         this.view.cancel.remove(this._0dR_);
      }
      
      private function _fj() : void
      {
         this.deleteCharacter.dispatch(this.character);
      }
      
      private function _0dR_() : void
      {
         this.closeDialogs.dispatch();
      }
   }
}
