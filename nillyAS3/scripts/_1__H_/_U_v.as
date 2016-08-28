package _1__H_
{
   import _P_S_.Mediator;
   import _P_N_.CaretakerQueryDialog;
   import _1F_z._0P_4;
   import _3b.CloseDialogsSignal;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   
   public class _U_v extends Mediator
   {
       
      
      [Inject]
      public var view:CaretakerQueryDialog;
      
      [Inject]
      public var model:_0P_4;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      public function _U_v()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.closed.addOnce(this._qN_);
         this.view._0K_L_(this._05V_());
      }
      
      private function _05V_() : BitmapData
      {
         var _loc1_:int = this.model._0tS_();
         return ObjectLibrary.getRedrawnTextureFromType(_loc1_,80,true);
      }
      
      override public function destroy() : void
      {
         this.view.closed.removeAll();
      }
      
      private function _qN_() : void
      {
         this.closeDialogs.dispatch();
      }
   }
}
