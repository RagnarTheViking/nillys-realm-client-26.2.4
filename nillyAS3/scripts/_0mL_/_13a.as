package _0mL_
{
   import _P_S_.Mediator;
   import _05g._02n;
   import com.company.assembleegameclient.util._A_o;
   import flash.events.MouseEvent;
   
   public class _13a extends Mediator
   {
       
      
      [Inject]
      public var _1R_F_:_02n;
      
      [Inject]
      public var _1gH_:_A_o;
      
      public function _13a()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._1R_F_.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this._1gH_.setFocus(null);
      }
      
      override public function destroy() : void
      {
         this._1R_F_.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
      }
   }
}
