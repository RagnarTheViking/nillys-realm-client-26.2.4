package _17B_
{
   import _P_S_.Mediator;
   import _3b.CloseDialogsSignal;
   
   public class _fQ_ extends Mediator
   {
       
      
      [Inject]
      public var view:_17B_.XImageButton;
      
      [Inject]
      public var _1ca:CloseDialogsSignal;
      
      public function _fQ_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.clicked.addOnce(this._0dR_);
      }
      
      private function _0dR_() : void
      {
         this._1ca.dispatch();
      }
   }
}
