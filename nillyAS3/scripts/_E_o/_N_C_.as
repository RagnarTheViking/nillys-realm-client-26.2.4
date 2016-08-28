package _E_o
{
   import _P_S_.Mediator;
   import _1O_n._1S_u;
   import _K_r._1V_v;
   import com.company.assembleegameclient.objects.Player;
   
   public class _N_C_ extends Mediator
   {
       
      
      [Inject]
      public var view:_1S_u;
      
      [Inject]
      public var _E_:_1V_v;
      
      public function _N_C_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._E_.add(this._E_5);
      }
      
      override public function destroy() : void
      {
         this._E_.remove(this._E_5);
      }
      
      private function _E_5(param1:Player) : void
      {
         this.view.draw();
      }
   }
}
