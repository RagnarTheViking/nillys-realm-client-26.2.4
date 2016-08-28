package _18
{
   import _P_S_.Mediator;
   import flash.events.MouseEvent;
   
   public class _1iS_ extends Mediator
   {
       
      
      [Inject]
      public var view:_18._1R_C_;
      
      public function _1iS_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._1xg.add(this.onMouseOut);
         this.view._aV_.add(this.onMouseOver);
      }
      
      override public function destroy() : void
      {
         this.view._1xg.remove(this.onMouseOut);
         this.view._aV_.remove(this.onMouseOver);
         this.view._O_t();
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this.view._1B_u();
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this.view._O_t();
      }
   }
}
