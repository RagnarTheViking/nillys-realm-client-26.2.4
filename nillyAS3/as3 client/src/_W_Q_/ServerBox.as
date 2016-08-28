package _W_Q_
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import _0hJ_.Server;
   import flash.text.TextFieldAutoSize;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   import flash.events.MouseEvent;
   import _C_._1O_I_;
   import _1xa.SText;
   
   public class ServerBox extends Sprite
   {
      
      public static const WIDTH:int = 384;
      
      public static const HEIGHT:int = 52;
       
      
      public var value_:String;
      
      private var nameText_:SimpleText;
      
      private var _ns:SimpleText;
      
      private var selected_:Boolean = false;
      
      private var over_:Boolean = false;
      
      public function ServerBox(param1:Server)
      {
         super();
         this.value_ = param1 == null?null:param1.name;
         this.nameText_ = new SimpleText().setSize(18).setColor(16777215).setBold(true);
         if(param1 == null)
         {
            this.nameText_.setStringBuilder(new _dU_().setParams(_1O_I_._0R_a));
         }
         else
         {
            this.nameText_.setStringBuilder(new SText(param1.name));
         }
         this.nameText_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this.nameText_.x = 18;
         this.nameText_.setVerticalAlign(SimpleText.MIDDLE);
         this.nameText_.y = HEIGHT / 2;
         addChild(this.nameText_);
         this._K_X_(param1);
         this.draw();
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
      }
      
      private function _K_X_(param1:Server) : void
      {
         var onTextChanged:Function = null;
         var color:uint = 0;
         var text:String = null;
         var server:Server = param1;
         onTextChanged = function():void
         {
            makeStatusText(color,text);
         };
         if(server != null)
         {
            color = 65280;
            text = "ServerBox.normal";
            if(server._M_w())
            {
               color = 16711680;
               text = "ServerBox.full";
            }
            else if(server._0lJ_())
            {
               color = 16549442;
               text = "ServerBox.crowded";
            }
            this.nameText_.textChanged.addOnce(onTextChanged);
         }
      }
      
      private function makeStatusText(param1:uint, param2:String) : void
      {
         this._ns = new SimpleText().setSize(18).setColor(param1).setBold(true).setAutoSize(TextFieldAutoSize.CENTER);
         this._ns.setStringBuilder(new _dU_().setParams(param2));
         this._ns.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         this._ns.x = WIDTH / 2 + WIDTH / 4;
         this._ns.y = HEIGHT / 2 - this.nameText_.height / 2;
         addChild(this._ns);
      }
      
      public function setSelected(param1:Boolean) : void
      {
         this.selected_ = param1;
         this.draw();
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this.over_ = true;
         this.draw();
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this.over_ = false;
         this.draw();
      }
      
      private function draw() : void
      {
         graphics.clear();
         if(this.selected_)
         {
            graphics.lineStyle(2,16777103);
         }
         graphics.beginFill(!!this.over_?uint(7039851):uint(6052956),1);
         graphics.drawRect(0,0,WIDTH,HEIGHT);
         if(this.selected_)
         {
            graphics.lineStyle();
         }
      }
   }
}
