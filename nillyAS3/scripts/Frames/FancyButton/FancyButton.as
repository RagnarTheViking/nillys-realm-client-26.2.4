package Frames.FancyButton
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import _f7.Signal;
   import flash.geom.Matrix;
   import flash.display.GradientType;
   import flash.filters.GlowFilter;
   import flash.events.MouseEvent;
   import _1xa.SText;
   
   public class FancyButton extends Sprite
   {
      
      private static const COLORTYPE_NORMAL:int = 0;
      
      private static const COLORTYPE_GLOW:int = 1;
       
      
      private var over:Boolean;
      
      private var text:SimpleText;
      
      private var design:Frames.FancyButton.IDesign;
      
      public var clicked:Signal;
      
      public var changed:Signal;
      
      public function FancyButton(param1:String, param2:int = 20, param3:Frames.FancyButton.IDesign = null)
      {
         super();
         this.design = param3 || new WhiteButtonDesign();
         this.text = new SimpleText().setSize(param2).setColor(this.getColor(COLORTYPE_NORMAL)).setStringBuilder(new SText(param1));
         this.text.x = 20;
         this.text.y = 7;
         this.text.textChanged.add(this.dispatchChange);
         this.text.textChanged.add(this.draw);
         addChild(this.text);
         addEventListener(MouseEvent.ROLL_OVER,this.onRollOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         addEventListener(MouseEvent.CLICK,this.onClick);
         this.clicked = new Signal();
         this.changed = new Signal(FancyButton);
      }
      
      private function dispatchChange() : void
      {
         this.changed.dispatch(this);
      }
      
      public function setEnabled(param1:Boolean) : void
      {
         if(mouseEnabled == param1)
         {
            return;
         }
         mouseEnabled = param1;
         mouseChildren = param1;
         this.text.setColor(!!param1?uint(this.getColor(COLORTYPE_NORMAL)):uint(3881787));
         this.draw();
      }
      
      private function draw() : void
      {
         var _loc1_:Matrix = null;
         graphics.clear();
         graphics.beginFill(0,0.3);
         graphics.drawRect(0,0,this.text.width + 40,this.text.height + 10);
         graphics.endFill();
         graphics.lineStyle(1,!!mouseEnabled?uint(this.getColor(COLORTYPE_NORMAL)):uint(3881787));
         graphics.drawRect(0,0,this.text.width + 40,this.text.height + 10);
         graphics.lineStyle();
         if(this.over)
         {
            _loc1_ = new Matrix();
            _loc1_.createGradientBox(this.text.width + 40,this.text.height + 10,Math.PI / 180 * 90);
            graphics.beginGradientFill(GradientType.LINEAR,[0,this.getColor(COLORTYPE_GLOW)],[0.1,0.4],[0,255],_loc1_);
            graphics.drawRect(0,0,this.text.width + 40,this.text.height + 10);
            graphics.endFill();
         }
         this.text.filters = !!this.over?[new GlowFilter(this.getColor(COLORTYPE_GLOW),1,8,8,1.3)]:[];
         this.text.setColor(this.getColor(COLORTYPE_NORMAL));
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
      
      private function getColor(param1:int) : uint
      {
         switch(param1)
         {
            case COLORTYPE_NORMAL:
               return !!this.over?uint(this.design.hoverColor):uint(this.design.idleColor);
            case COLORTYPE_GLOW:
               return !!this.over?uint(this.design.hoverGlow):uint(this.design.idleGlow);
            default:
               throw new ArgumentError("Type not supported");
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         this.clicked.dispatch();
      }
   }
}
