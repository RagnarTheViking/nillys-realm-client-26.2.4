package _05g
{
   import _P_S_.Mediator;
   import _W_Q_._0ag;
   import _1T_4._1pn;
   
   public class _1jA_ extends Mediator
   {
       
      
      [Inject]
      public var view:_0ag;
      
      [Inject]
      public var _0E_Q_:_1pn;
      
      public function _1jA_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._0E_Q_.add(this._1T_y);
         this.view._1nb("Loading.text");
      }
      
      override public function destroy() : void
      {
         this._0E_Q_.remove(this._1T_y);
      }
      
      private function _1T_y(param1:String) : void
      {
         this.view._1nb(param1);
      }
   }
}
