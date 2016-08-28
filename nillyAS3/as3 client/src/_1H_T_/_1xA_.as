package _1H_T_
{
   import _P_S_.Mediator;
   import _1gF_._0ke;
   
   public class _1xA_ extends Mediator
   {
       
      
      [Inject]
      public var _K_a:_0ke;
      
      [Inject]
      public var view:_1H_T_._yF_;
      
      public function _1xA_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._0U_A_(this._K_a);
         this.view._0U_0();
      }
   }
}
