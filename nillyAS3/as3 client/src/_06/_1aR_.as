package _06
{
   import _P_S_.Mediator;
   import _Z_U_._117;
   import _0b6._I_A_;
   
   public class _1aR_ extends Mediator
   {
       
      
      [Inject]
      public var view:_06._1P_b;
      
      [Inject]
      public var model:_117;
      
      [Inject]
      public var _yM_:_I_A_;
      
      public function _1aR_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.model._W_v.addOnce(this._04X_);
         this.view.clicked.add(this.onButtonClick);
         this.view._0Y_B_(this.model._0__z());
      }
      
      override public function destroy() : void
      {
         this.model._W_v.remove(this._04X_);
         this.view.clicked.remove(this.onButtonClick);
      }
      
      private function onButtonClick() : void
      {
         this._yM_.dispatch();
      }
      
      private function _04X_() : void
      {
         this.view.destroy();
      }
   }
}
