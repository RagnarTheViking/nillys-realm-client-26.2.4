package _06
{
   import _P_S_.Mediator;
   import _Z_U_._117;
   import _3b.CloseDialogsSignal;
   import _0b6._r0;
   import _0jo._hO_;
   
   public class _1g6 extends Mediator
   {
       
      
      [Inject]
      public var view:_06.BeginnersPackageOfferDialog;
      
      [Inject]
      public var model:_117;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      [Inject]
      public var _1gN_:_r0;
      
      [Inject]
      public var _1R_c:_hO_;
      
      public function _1g6()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.buy.add(this._5k);
         this.view.close.add(this._fH_);
         this.view._062(this.model._0__z());
         this.view._17D_();
         this._1R_c.dispatch(false);
      }
      
      override public function destroy() : void
      {
         this.view.buy.remove(this._5k);
         this.view.close.remove(this._fH_);
         this._1R_c.dispatch(true);
      }
      
      private function _5k() : void
      {
         this._0dR_.dispatch();
         this._1gN_.dispatch();
      }
      
      private function _fH_() : void
      {
         this._0dR_.dispatch();
      }
   }
}
