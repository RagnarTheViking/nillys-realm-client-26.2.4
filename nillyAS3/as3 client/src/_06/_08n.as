package _06
{
   import _P_S_.Mediator;
   import _Z_U_._117;
   import _3b.CloseDialogsSignal;
   import _0b6._1u9;
   import _4u._0dl;
   
   public class _08n extends Mediator
   {
       
      
      [Inject]
      public var view:_06._8n;
      
      [Inject]
      public var model:_117;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var _1P_m:_1u9;
      
      public function _08n()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.close.add(this._fH_);
         this.view.select.add(this.onSelect);
         this.view._17D_();
      }
      
      override public function destroy() : void
      {
         this.view.close.remove(this._fH_);
         this.view.select.remove(this.onSelect);
      }
      
      private function _fH_() : void
      {
         this.closeDialogs.dispatch();
      }
      
      private function onSelect(param1:String) : void
      {
         var _loc2_:_0dl = new _0dl();
         _loc2_.offer = this.model._D_o();
         _loc2_.paymentMethod = param1;
         this._1P_m.dispatch(_loc2_);
         this.closeDialogs.dispatch();
      }
   }
}
