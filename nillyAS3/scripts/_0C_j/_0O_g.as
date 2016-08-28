package _0C_j
{
   import _P_S_.Mediator;
   import _1y1._I_Y_;
   import _3b.CloseDialogsSignal;
   import _0pn._q0;
   
   public class _0O_g extends Mediator
   {
       
      
      [Inject]
      public var _0v9:_I_Y_;
      
      [Inject]
      public var view:_0C_j.PackageOfferDialog;
      
      [Inject]
      public var _1n0:CloseDialogsSignal;
      
      [Inject]
      public var _6M_:_q0;
      
      public function _0O_g()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.buy.add(this._5k);
         this.view.close.add(this._fH_);
      }
      
      override public function destroy() : void
      {
         this.view.close.remove(this._fH_);
         this.view.close.remove(this._5k);
         this.view.destroy();
      }
      
      private function _5k() : void
      {
         this._1n0.dispatch();
         this._6M_.dispatch(this.view._0aT_());
      }
      
      private function _fH_() : void
      {
         this._1n0.dispatch();
      }
   }
}
