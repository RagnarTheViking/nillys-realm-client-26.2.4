package Frames
{
   import flash.display.Sprite;
   import _f7.Signal;
   import flash.events.MouseEvent;
   import _1S_0.NativeMappedSignal;
   
   public class XButton extends Sprite
   {
       
      
      private var wh:int;
      
      private var over:Boolean;
      
      public var clicked:Signal;
      
      public function XButton(param1:int)
      {
         super();
         this.wh = param1;
         addEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         this.draw();
         this.clicked = new NativeMappedSignal(this,MouseEvent.CLICK);
      }
      
      private function draw() : void
      {
         graphics.clear();
         graphics.beginFill(!!this.over?uint(16711680):uint(16777215),1);
         graphics.drawRect(0,0,this.wh,this.wh);
         graphics.endFill();
         graphics.lineStyle(1,!!this.over?uint(16777215):uint(0));
         graphics.moveTo(10,10);
         graphics.lineTo(this.wh - 10,this.wh - 10);
         graphics.moveTo(this.wh - 10,10);
         graphics.lineTo(10,this.wh - 10);
         graphics.lineStyle();
      }
      
      private function onRollOver(param1:MouseEvent) : void
      {
         this.over = true;
         this.draw();
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this.over = false;
         this.draw();
      }
   }
}
