package _R_o
{
   import flash.display.Sprite;
   
   public final class _U_V_ extends Sprite
   {
       
      
      public var output:_R_o._01Y_;
      
      public var input:_R_o._0J_y;
      
      public function _U_V_()
      {
         super();
         addChild(this.output = new _R_o._01Y_());
         addChild(this.input = new _R_o._0J_y());
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(param1 && stage)
         {
            stage.focus = this.input;
         }
      }
   }
}
