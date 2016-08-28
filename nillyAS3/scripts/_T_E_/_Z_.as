package _T_E_
{
   import _P_S_.Mediator;
   import _Y_M_._02U_;
   import _0jo._0oc;
   import _05L_.ChatMessage;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class _Z_ extends Mediator
   {
       
      
      [Inject]
      public var view:_02U_;
      
      [Inject]
      private var _V_8:_0oc;
      
      public function _Z_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._1l8.add(this._i3);
      }
      
      override public function destroy() : void
      {
         this.view._1l8.remove(this._i3);
      }
      
      private function _i3() : void
      {
         this._V_8.dispatch(ChatMessage.make(Parameters.ErrorText,"No players are eligible for teleporting"));
      }
   }
}
