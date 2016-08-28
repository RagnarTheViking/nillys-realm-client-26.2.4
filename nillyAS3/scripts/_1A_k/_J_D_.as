package _1A_k
{
   import flash.display.Sprite;
   import flash.display.DisplayObject;
   
   public class _J_D_ extends Sprite
   {
       
      
      private var toolTip:DisplayObject;
      
      public function _J_D_()
      {
         super();
      }
      
      public function show(param1:DisplayObject) : void
      {
         this.hide();
         this.toolTip = param1;
         if(param1)
         {
            addChild(param1);
         }
      }
      
      public function hide() : void
      {
         if(this.toolTip && this.toolTip.parent)
         {
            this.toolTip.parent.removeChild(this.toolTip);
         }
         this.toolTip = null;
      }
   }
}
