package _td
{
   import flash.display.Sprite;
   import flash.display.IGraphicsData;
   import _1xa._1eo;
   import _1gF_.SimpleText;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsPath;
   import flash.display.GraphicsStroke;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import com.company.util.GraphicHelper;
   import flash.display.IGraphicsFill;
   import flash.display.Graphics;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   
   public class _1zv extends Sprite
   {
      
      public static const WIDTH:int = 80;
      
      public static const HEIGHT:int = 32;
       
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      public var _1Y_w:Vector.<_1eo>;
      
      public var _V_J_:Array;
      
      public var _1zK_:int = -1;
      
      public var labelText_:SimpleText;
      
      private var over_:Boolean = false;
      
      private var color:Number = 16777215;
      
      private var internalFill_:GraphicsSolidFill;
      
      private var _0rG_:GraphicsSolidFill;
      
      private var _11h:GraphicsSolidFill;
      
      private var path_:GraphicsPath;
      
      private var _0pt:GraphicsStroke;
      
      public function _1zv(param1:Vector.<_1eo>, param2:Array, param3:Object, param4:Number = 16777215)
      {
         this.internalFill_ = new GraphicsSolidFill(3355443,1);
         this._0rG_ = new GraphicsSolidFill(11776947,1);
         this._11h = new GraphicsSolidFill(4473924,1);
         this.path_ = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this._0pt = new GraphicsStroke(2,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,this._11h);
         this.graphicsData_ = new <IGraphicsData>[this.internalFill_,this._0pt,this.path_,GraphicHelper._1yz,GraphicHelper.END_FILL];
         super();
         this.color = param4;
         this._1Y_w = param1;
         this._V_J_ = param2;
         this.labelText_ = new SimpleText().setSize(16).setColor(param4);
         this.labelText_.x = WIDTH / 2;
         this.labelText_.y = HEIGHT / 2;
         this.labelText_.setAutoSize(TextFieldAutoSize.CENTER).setVerticalAlign(SimpleText.MIDDLE);
         this.labelText_.setBold(true);
         this.labelText_.filters = [new DropShadowFilter(0,0,0,1,4,4,2)];
         addChild(this.labelText_);
         this.setValue(param3);
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         addEventListener(MouseEvent.CLICK,this._1k9);
      }
      
      public function setValue(param1:*, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < this._V_J_.length)
         {
            if(param1 == this._V_J_[_loc3_])
            {
               if(_loc3_ == this._1zK_)
               {
                  return;
               }
               this._1zK_ = _loc3_;
               break;
            }
            _loc3_++;
         }
         this.setSelected(this._1zK_);
         if(param2)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function value() : *
      {
         return this._V_J_[this._1zK_];
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this.over_ = true;
         this._1W_A_();
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this.over_ = false;
         this._1W_A_();
      }
      
      private function _1k9(param1:MouseEvent) : void
      {
         this.setSelected((this._1zK_ + 1) % this._V_J_.length);
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function _1W_A_() : void
      {
         GraphicHelper.clearGraphicsPath(this.path_);
         GraphicHelper.drawUi(0,0,WIDTH,HEIGHT,4,[1,1,1,1],this.path_);
         this._0pt.fill = !!this.over_?this._0rG_:this._11h;
         graphics.drawGraphicsData(this.graphicsData_);
         var _loc1_:Graphics = graphics;
         _loc1_.clear();
         _loc1_.drawGraphicsData(this.graphicsData_);
      }
      
      private function setSelected(param1:int) : void
      {
         this._1zK_ = param1;
         if(this._1zK_ < 0 || this._1zK_ >= this._1Y_w.length)
         {
            this._1zK_ = 0;
         }
         this._0D_S_(this._1Y_w[this._1zK_]);
      }
      
      private function _0D_S_(param1:_1eo) : void
      {
         this.labelText_.setStringBuilder(param1);
         this._1W_A_();
      }
   }
}
