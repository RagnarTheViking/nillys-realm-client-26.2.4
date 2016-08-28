package _05g
{
   import _P_S_.Mediator;
   import _m2._0o9;
   import _3b.CloseDialogsSignal;
   
   public class _0C_5 extends Mediator
   {
       
      
      [Inject]
      public var view:_05g.AgeVerificationDialog;
      
      [Inject]
      public var _T_l:_0o9;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      public function _0C_5()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._0ss.add(this._0eP_);
      }
      
      override public function destroy() : void
      {
         this.view._0ss.remove(this._0eP_);
      }
      
      private function _0eP_(param1:Boolean) : void
      {
         if(param1)
         {
            this._09r();
         }
         else
         {
            this._1xC_();
         }
      }
      
      private function _09r() : void
      {
         this._T_l.dispatch();
         this.closeDialogs.dispatch();
      }
      
      private function _1xC_() : void
      {
         this.closeDialogs.dispatch();
      }
   }
}
