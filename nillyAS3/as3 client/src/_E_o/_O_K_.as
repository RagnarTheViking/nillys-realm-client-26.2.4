package _E_o
{
   import _P_S_.Mediator;
   import _0Z_1._1D_S_;
   import _0E_n._jE_;
   
   public class _O_K_ extends Mediator
   {
       
      
      [Inject]
      public var view:_1D_S_;
      
      [Inject]
      public var _H_u:_jE_;
      
      public function _O_K_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._pn = this._H_u.top;
      }
   }
}
