package _17B_
{
   import _P_S_.Mediator;
   
   public class _L_P_ extends Mediator
   {
       
      
      [Inject]
      public var view:_17B_._18A_;
      
      public function _L_P_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.init();
      }
   }
}
