package _17B_
{
   import _P_S_.Mediator;
   import _1T_4._q6;
   import ToolTips.ToolTip;
   
   public class _K_F_ extends Mediator
   {
       
      
      [Inject]
      public var view:_17B_._02G_;
      
      [Inject]
      public var showToolTip:_q6;
      
      public function _K_F_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._1am.add(this._1V_0);
      }
      
      override public function destroy() : void
      {
         this.view.destroy();
      }
      
      private function _1V_0(param1:ToolTip) : void
      {
         this.showToolTip.dispatch(param1);
      }
   }
}
