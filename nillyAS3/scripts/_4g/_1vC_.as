package _4g
{
   import _P_S_.Mediator;
   import _T_G_._1J_G_;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.geom.Rectangle;
   
   public class _1vC_ extends Mediator
   {
       
      
      [Inject]
      public var view:_4g._0zQ_;
      
      [Inject]
      public var resize:_1J_G_;
      
      public function _1vC_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         var _loc1_:Stage = (this.view as DisplayObject).stage;
         var _loc2_:Rectangle = new Rectangle(0,0,800,600);
         this.resize.add(this.onResize);
         this.view.resize(_loc2_);
      }
      
      override public function destroy() : void
      {
         this.resize.remove(this.onResize);
      }
      
      private function onResize(param1:Rectangle) : void
      {
         this.view.resize(param1);
      }
   }
}
