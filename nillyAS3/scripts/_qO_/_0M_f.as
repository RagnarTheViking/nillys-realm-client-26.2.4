package _qO_
{
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.events.TextEvent;
   import flash.geom.Point;
   import _2F_.Console;
   import _2F_._0__X_;
   import _2F_._wR_;
   import flash.geom.Rectangle;
   import flash.events.Event;
   import flash.display.DisplayObject;
   import flash.text.TextFieldAutoSize;
   
   public class _0M_f extends Sprite
   {
      
      public static const _0wA_:String = "draggingStarted";
      
      public static const _Z_5:String = "draggingEnded";
      
      public static const _1qi:String = "scalingStarted";
      
      public static const _ww:String = "scalingEnded";
      
      public static const _wj:String = "visibilityChanged";
      
      private static const TEXT_ROLL:String = "TEXT_ROLL";
       
      
      private var _pm:Array;
      
      private var _A_R_:Point;
      
      private var _1hD_:TextField;
      
      protected var console:Console;
      
      protected var bg:Sprite;
      
      protected var scaler:Sprite;
      
      protected var _0E_y:TextField;
      
      protected var _14b:int = 18;
      
      protected var _E_r:int = 18;
      
      private var _1sb:Point;
      
      public var _0L_N_:Boolean = true;
      
      public function _0M_f(param1:Console)
      {
         super();
         this.console = param1;
         this.bg = new Sprite();
         this.bg.name = "background";
         addChild(this.bg);
      }
      
      private static function _A_D_(param1:MouseEvent) : void
      {
         TextField(param1.currentTarget).dispatchEvent(new TextEvent(TEXT_ROLL));
      }
      
      private static function _zW_(param1:MouseEvent) : void
      {
         var index:int = 0;
         var scrollH:Number = NaN;
         var w:Number = NaN;
         var X:XML = null;
         var txtformat:XML = null;
         var url:String = null;
         var e:MouseEvent = param1;
         var field:TextField = e.currentTarget as TextField;
         if(field.scrollH > 0)
         {
            scrollH = field.scrollH;
            w = field.width;
            field.width = w + scrollH;
            index = field.getCharIndexAtPoint(field.mouseX + scrollH,field.mouseY);
            field.width = w;
            field.scrollH = scrollH;
         }
         else
         {
            index = field.getCharIndexAtPoint(field.mouseX,field.mouseY);
         }
         if(index > 0)
         {
            try
            {
               X = new XML(field.getXMLText(index,index + 1));
               if(X.hasOwnProperty("textformat"))
               {
                  txtformat = X["textformat"][0] as XML;
                  if(txtformat)
                  {
                     url = txtformat.@url;
                  }
               }
            }
            catch(err:Error)
            {
               url = null;
            }
         }
         field.dispatchEvent(new TextEvent(TEXT_ROLL,false,false,url));
      }
      
      protected function get config() : _0__X_
      {
         return this.console.config;
      }
      
      protected function get style() : _wR_
      {
         return this.console.config.style;
      }
      
      protected function init(param1:Number, param2:Number, param3:Boolean = false, param4:Number = -1, param5:Number = -1, param6:int = -1) : void
      {
         this.bg.graphics.clear();
         this.bg.graphics.beginFill(param4 >= 0?uint(param4):uint(this.style.backgroundColor),param5 >= 0?Number(param5):Number(this.style._0vc));
         if(param6 < 0)
         {
            param6 = this.style._A_5;
         }
         if(param6 <= 0)
         {
            this.bg.graphics.drawRect(0,0,100,100);
         }
         else
         {
            this.bg.graphics.drawRoundRect(0,0,param6 + 10,param6 + 10,param6,param6);
            this.bg.scale9Grid = new Rectangle(param6 * 0.5,param6 * 0.5,10,10);
         }
         this._1nK_ = param3;
         this.width = param1;
         this.height = param2;
      }
      
      public function close() : void
      {
         this._1hi();
         this.console.panels.tooltip();
         if(parent)
         {
            parent.removeChild(this);
         }
         dispatchEvent(new Event(Event.CLOSE));
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         dispatchEvent(new Event(_wj));
      }
      
      override public function set width(param1:Number) : void
      {
         if(param1 < this._14b)
         {
            param1 = this._14b;
         }
         if(this.scaler)
         {
            this.scaler.x = param1;
         }
         this.bg.width = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         if(param1 < this._E_r)
         {
            param1 = this._E_r;
         }
         if(this.scaler)
         {
            this.scaler.y = param1;
         }
         this.bg.height = param1;
      }
      
      override public function get width() : Number
      {
         return this.bg.width;
      }
      
      override public function get height() : Number
      {
         return this.bg.height;
      }
      
      public function _1I_U_(param1:Array, param2:Array) : void
      {
         this._pm = [param1,param2];
      }
      
      protected function _07a(param1:DisplayObject, param2:Boolean = false) : void
      {
         if(param2)
         {
            param1.removeEventListener(MouseEvent.MOUSE_DOWN,this._0T_a);
         }
         else
         {
            param1.addEventListener(MouseEvent.MOUSE_DOWN,this._0T_a,false,0,true);
         }
      }
      
      private function _0T_a(param1:MouseEvent) : void
      {
         if(!stage || !this._0L_N_)
         {
            return;
         }
         this._1hD_ = this._1ae("positioningField",true);
         this._1hD_.mouseEnabled = false;
         this._1hD_.autoSize = TextFieldAutoSize.LEFT;
         addChild(this._1hD_);
         this._1Y_P_();
         this._1sb = new Point(x,y);
         this._A_R_ = new Point(mouseX,mouseY);
         this._pm = [[],[]];
         dispatchEvent(new Event(_0wA_));
         stage.addEventListener(MouseEvent.MOUSE_UP,this._W_J_,false,0,true);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this._uy,false,0,true);
      }
      
      private function _uy(param1:MouseEvent = null) : void
      {
         if(this.style._16G_ == 0)
         {
            return;
         }
         var _loc2_:Point = this._C_b(parent.mouseX - this._A_R_.x,parent.mouseY - this._A_R_.y);
         x = _loc2_.x;
         y = _loc2_.y;
         this._1Y_P_();
      }
      
      private function _1Y_P_() : void
      {
         this._1hD_.text = "<low>" + x + "," + y + "</low>";
      }
      
      private function _W_J_(param1:MouseEvent) : void
      {
         this._1hi();
      }
      
      private function _1hi() : void
      {
         this._pm = null;
         if(stage)
         {
            stage.removeEventListener(MouseEvent.MOUSE_UP,this._W_J_);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._uy);
         }
         if(this._1hD_ && this._1hD_.parent)
         {
            this._1hD_.parent.removeChild(this._1hD_);
         }
         this._1hD_ = null;
         dispatchEvent(new Event(_Z_5));
      }
      
      public function moveBackSafePosition() : void
      {
         if(this._1sb != null)
         {
            if(x + this.width < 10 || stage && 800 < x + 10 || y + this.height < 10 || stage && 600 < y + 20)
            {
               x = this._1sb.x;
               y = this._1sb.y;
            }
            this._1sb = null;
         }
      }
      
      public function get _1nK_() : Boolean
      {
         return !!this.scaler?true:false;
      }
      
      public function set _1nK_(param1:Boolean) : void
      {
         var _loc2_:uint = 0;
         if(param1 && !this.scaler)
         {
            _loc2_ = 8 + this.style.controlSize * 0.5;
            this.scaler = new Sprite();
            this.scaler.name = "scaler";
            this.scaler.graphics.beginFill(0,0);
            this.scaler.graphics.drawRect(-_loc2_ * 1.5,-_loc2_ * 1.5,_loc2_ * 1.5,_loc2_ * 1.5);
            this.scaler.graphics.endFill();
            this.scaler.graphics.beginFill(this.style.controlColor,this.style._0vc);
            this.scaler.graphics.moveTo(0,0);
            this.scaler.graphics.lineTo(-_loc2_,0);
            this.scaler.graphics.lineTo(0,-_loc2_);
            this.scaler.graphics.endFill();
            this.scaler.buttonMode = true;
            this.scaler.doubleClickEnabled = true;
            this.scaler.addEventListener(MouseEvent.MOUSE_DOWN,this._1Z_P_,false,0,true);
            addChildAt(this.scaler,getChildIndex(this.bg) + 1);
         }
         else if(!param1 && this.scaler)
         {
            if(contains(this.scaler))
            {
               removeChild(this.scaler);
            }
            this.scaler = null;
         }
      }
      
      private function _1Z_P_(param1:Event) : void
      {
         this._1hD_ = this._1ae("resizingField",true);
         this._1hD_.mouseEnabled = false;
         this._1hD_.autoSize = TextFieldAutoSize.RIGHT;
         this._1hD_.x = -4;
         this._1hD_.y = -17;
         this.scaler.addChild(this._1hD_);
         this._1C_G_();
         this._A_R_ = new Point(this.scaler.mouseX,this.scaler.mouseY);
         this._pm = [[],[]];
         this.scaler.stage.addEventListener(MouseEvent.MOUSE_UP,this._0dw,false,0,true);
         this.scaler.stage.addEventListener(MouseEvent.MOUSE_MOVE,this._1H_l,false,0,true);
         dispatchEvent(new Event(_1qi));
      }
      
      private function _1H_l(param1:Event = null) : void
      {
         var _loc2_:Point = this._C_b(x + mouseX - this._A_R_.x,y + mouseY - this._A_R_.x);
         _loc2_.x = _loc2_.x - x;
         _loc2_.y = _loc2_.y - y;
         this.width = _loc2_.x < this._14b?Number(this._14b):Number(_loc2_.x);
         this.height = _loc2_.y < this._E_r?Number(this._E_r):Number(_loc2_.y);
         this._1C_G_();
      }
      
      private function _1C_G_() : void
      {
         this._1hD_.text = "<low>" + this.width + "," + this.height + "</low>";
      }
      
      public function _1ei() : void
      {
         this._0dw(null);
      }
      
      private function _0dw(param1:Event) : void
      {
         this.scaler.stage.removeEventListener(MouseEvent.MOUSE_UP,this._0dw);
         this.scaler.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._1H_l);
         this._1H_l();
         this._pm = null;
         if(this._1hD_ && this._1hD_.parent)
         {
            this._1hD_.parent.removeChild(this._1hD_);
         }
         this._1hD_ = null;
         dispatchEvent(new Event(_ww));
      }
      
      public function _1ae(param1:String, param2:Boolean = false) : TextField
      {
         var _loc3_:TextField = new TextField();
         _loc3_.name = param1;
         _loc3_.styleSheet = this.style.styleSheet;
         if(param2)
         {
            _loc3_.background = true;
            _loc3_.backgroundColor = this.style.backgroundColor;
         }
         return _loc3_;
      }
      
      private function _C_b(param1:Number, param2:Number) : Point
      {
         return new Point(this._1K_Q_(param1,true),this._1K_Q_(param2,false));
      }
      
      private function _1K_Q_(param1:Number, param2:Boolean) : Number
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = param1 + this.width;
         var _loc5_:Array = this._pm[!!param2?0:1];
         var _loc6_:int = this.style._16G_;
         for each(_loc3_ in _loc5_)
         {
            if(Math.abs(_loc3_ - param1) < _loc6_)
            {
               return _loc3_;
            }
            if(Math.abs(_loc3_ - _loc4_) < _loc6_)
            {
               return _loc3_ - this.width;
            }
         }
         return param1;
      }
      
      protected function _J_7(param1:TextField, param2:Function, param3:Function = null) : void
      {
         param1.addEventListener(MouseEvent.MOUSE_MOVE,_zW_,false,0,true);
         param1.addEventListener(MouseEvent.ROLL_OUT,_A_D_,false,0,true);
         param1.addEventListener(TEXT_ROLL,param2,false,0,true);
         if(param3 != null)
         {
            param1.addEventListener(TextEvent.LINK,param3,false,0,true);
         }
      }
   }
}
