package _1ar
{
   import flash.display.Sprite;
   import com.company.ui._0H_R_;
   import flash.events.MouseEvent;
   
   public class _1V_3 extends Sprite
   {
      
      private static const WIDTH:int = 80;
      
      private static const HEIGHT:int = 25;
       
      
      public var callback_:Function;
      
      public var _0Z_n:int;
      
      private var over_:Boolean = false;
      
      private var _1eN_:Boolean = false;
      
      private var selected_:Boolean = false;
      
      private var text_:_0H_R_;
      
      public function _1V_3(param1:String, param2:Function, param3:int)
      {
         super();
         this.callback_ = param2;
         this._0Z_n = param3;
         this.text_ = new _0H_R_(16,16777215,false,0,0);
         this.text_.setBold(true);
         this.text_.text = param1;
         this.text_.updateMetrics();
         this.text_.x = 2;
         addChild(this.text_);
         this.redraw();
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         addEventListener(MouseEvent.CLICK,this._1k9);
      }
      
      public function setSelected(param1:Boolean) : void
      {
         this.selected_ = param1;
         this.redraw();
      }
      
      public function _0oj(param1:String) : void
      {
         this.text_.text = param1;
         this.text_.updateMetrics();
      }
      
      private function redraw() : void
      {
         graphics.clear();
         if(this.selected_ || this._1eN_)
         {
            graphics.lineStyle(2,16777215);
            graphics.beginFill(8355711,1);
            graphics.drawRect(0,0,WIDTH,HEIGHT);
            graphics.endFill();
            graphics.lineStyle();
         }
         else if(this.over_)
         {
            graphics.lineStyle(2,16777215);
            graphics.beginFill(0,0);
            graphics.drawRect(0,0,WIDTH,HEIGHT);
            graphics.endFill();
            graphics.lineStyle();
         }
         else
         {
            graphics.lineStyle(1,16777215);
            graphics.beginFill(0,0);
            graphics.drawRect(0,0,WIDTH,HEIGHT);
            graphics.endFill();
            graphics.lineStyle();
         }
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this.over_ = true;
         this.redraw();
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this.over_ = false;
         this._1eN_ = false;
         this.redraw();
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this._1eN_ = true;
         this.redraw();
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this._1eN_ = false;
         this.redraw();
      }
      
      private function _1k9(param1:MouseEvent) : void
      {
         this.callback_(this);
      }
   }
}
