package _K_t
{
   import _P_S_.Mediator;
   import Frames.CreateGuildFrame;
   import _3b.CloseDialogsSignal;
   
   public class _1R_e extends Mediator
   {
       
      
      [Inject]
      public var view:CreateGuildFrame;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      public function _1R_e()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.close.add(this._fH_);
      }
      
      override public function destroy() : void
      {
         this.view.close.remove(this._fH_);
      }
      
      private function _fH_() : void
      {
         this._0dR_.dispatch();
      }
   }
}
