package _1f
{
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.StyleSheet;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   import flash.system.System;
   
   public class Stats extends Sprite
   {
       
      
      protected const WIDTH:uint = 70;
      
      protected const HEIGHT:uint = 100;
      
      protected var xml:XML;
      
      protected var text:TextField;
      
      protected var style:StyleSheet;
      
      protected var timer:uint;
      
      protected var fps:uint;
      
      protected var ms:uint;
      
      protected var _08N_:uint;
      
      protected var mem:Number;
      
      protected var _0zO_:Number;
      
      protected var graph:BitmapData;
      
      protected var _0Q_1:Rectangle;
      
      protected var _55:uint;
      
      protected var _0if:uint;
      
      protected var _0fk:uint;
      
      protected var _J_2:Colors;
      
      public function Stats()
      {
         this._J_2 = new Colors();
         super();
         mouseEnabled = false;
         doubleClickEnabled = false;
         mouseChildren = false;
         this._0zO_ = 0;
         this.xml = <xml><fps>FPS:</fps><ms>MS:</ms><mem>MEM:</mem><memMax>MAX:</memMax></xml>;
         this.style = new StyleSheet();
         this.style.setStyle("xml",{
            "fontSize":"9px",
            "fontFamily":"_sans",
            "leading":"-2px"
         });
         this.style.setStyle("fps",{"color":this._0Z_I_(this._J_2.fps)});
         this.style.setStyle("ms",{"color":this._0Z_I_(this._J_2.ms)});
         this.style.setStyle("mem",{"color":this._0Z_I_(this._J_2.mem)});
         this.style.setStyle("memMax",{"color":this._0Z_I_(this._J_2.memmax)});
         this.text = new TextField();
         this.text.width = this.WIDTH;
         this.text.height = 50;
         this.text.styleSheet = this.style;
         this.text.condenseWhite = true;
         this.text.selectable = false;
         this.text.mouseEnabled = false;
         this._0Q_1 = new Rectangle(this.WIDTH - 1,0,1,this.HEIGHT - 50);
         addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.destroy,false,0,true);
      }
      
      private function init(param1:Event) : void
      {
         graphics.beginFill(this._J_2.bg);
         graphics.drawRect(0,0,this.WIDTH,this.HEIGHT);
         graphics.endFill();
         addChild(this.text);
         this.graph = new BitmapData(this.WIDTH,this.HEIGHT - 50,false,this._J_2.bg);
         graphics.beginBitmapFill(this.graph,new Matrix(1,0,0,1,0,50));
         graphics.drawRect(0,50,this.WIDTH,this.HEIGHT - 50);
         addEventListener(Event.ENTER_FRAME,this.update);
      }
      
      private function destroy(param1:Event) : void
      {
         graphics.clear();
         while(numChildren > 0)
         {
            removeChildAt(0);
         }
         this.graph.dispose();
         removeEventListener(MouseEvent.CLICK,this._1k9);
         removeEventListener(Event.ENTER_FRAME,this.update);
      }
      
      private function update(param1:Event) : void
      {
         this.timer = getTimer();
         if(this.timer - 1000 > this._08N_)
         {
            this._08N_ = this.timer;
            this.mem = Number((System.totalMemory * 9.54e-7).toFixed(3));
            this._0zO_ = this._0zO_ > this.mem?Number(this._0zO_):Number(this.mem);
            this._55 = Math.min(this.graph.height,this.fps / stage.frameRate * this.graph.height);
            this._0if = Math.min(this.graph.height,Math.sqrt(Math.sqrt(this.mem * 5000))) - 2;
            this._0fk = Math.min(this.graph.height,Math.sqrt(Math.sqrt(this._0zO_ * 5000))) - 2;
            this.graph.scroll(-1,0);
            this.graph.fillRect(this._0Q_1,this._J_2.bg);
            this.graph.setPixel(this.graph.width - 1,this.graph.height - this._55,this._J_2.fps);
            this.graph.setPixel(this.graph.width - 1,this.graph.height - (this.timer - this.ms >> 1),this._J_2.ms);
            this.graph.setPixel(this.graph.width - 1,this.graph.height - this._0if,this._J_2.mem);
            this.graph.setPixel(this.graph.width - 1,this.graph.height - this._0fk,this._J_2.memmax);
            this.xml.fps = "FPS: " + this.fps + " / " + stage.frameRate;
            this.xml.mem = "MEM: " + this.mem;
            this.xml.memMax = "MAX: " + this._0zO_;
            this.fps = 0;
         }
         this.fps++;
         this.xml.ms = "MS: " + (this.timer - this.ms);
         this.ms = this.timer;
         this.text.htmlText = this.xml;
      }
      
      private function _1k9(param1:MouseEvent) : void
      {
         if(mouseY / height > 0.5)
         {
            stage.frameRate--;
         }
         else
         {
            stage.frameRate++;
         }
         this.xml.fps = "FPS: " + this.fps + " / " + stage.frameRate;
         this.text.htmlText = this.xml;
      }
      
      private function _0Z_I_(param1:int) : String
      {
         return "#" + param1.toString(16);
      }
   }
}

class Colors
{
    
   
   public var bg:uint = 51;
   
   public var fps:uint = 16776960;
   
   public var ms:uint = 65280;
   
   public var mem:uint = 65535;
   
   public var memmax:uint = 16711792;
   
   function Colors()
   {
      super();
   }
}
