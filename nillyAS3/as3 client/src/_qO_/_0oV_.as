package _qO_
{
   import flash.text.TextField;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.geom.ColorTransform;
   import _1wl._1D_7;
   import _2F_.Console;
   import _0ib._1R_M_;
   import flash.geom.Rectangle;
   import _0ib._0B_2;
   import flash.events.TextEvent;
   import flash.net.FileReference;
   import flash.system.System;
   import flash.system.Security;
   import flash.system.SecurityPanel;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFieldType;
   import flash.events.FocusEvent;
   
   public class _0oV_ extends _0M_f
   {
      
      public static const NAME:String = "mainPanel";
      
      private static const _A_g:String = "clhistory";
      
      private static const _so:String = "viewingChannels";
      
      private static const _M_y:String = "ignoredChannels";
      
      private static const _0T_A_:String = "priority";
       
      
      private var _mn:TextField;
      
      private var _0zL_:TextField;
      
      private var _wA_:TextField;
      
      private var _08s:TextField;
      
      private var _1n6:Shape;
      
      private var _0F_0:Shape;
      
      private var _A_6:Boolean;
      
      private var _0W_w:Boolean;
      
      private var _1nu:Boolean;
      
      private var _1Z_u:Boolean;
      
      private var _2v:Sprite;
      
      private var _1C_K_:Sprite;
      
      private var _N_x:uint;
      
      private var _0D_f:int;
      
      private var _0Q_w:Boolean;
      
      private var _0eQ_:Number;
      
      private var _0F_3:int;
      
      private var _1E_y:int;
      
      private var _1vH_:Array;
      
      private var _0W_W_:Array;
      
      private var _0tU_:Object;
      
      private var _3p:int = -1;
      
      private var _0fc:uint;
      
      private var _gE_:String;
      
      private var _1lV_:RegExp;
      
      private var _1L_m:String = "";
      
      private var _0xz:Boolean;
      
      private var _13r:Boolean;
      
      private var _1D_m:Boolean;
      
      private var _vm:Boolean = true;
      
      private var _B_v:Boolean;
      
      private var _0g2:String;
      
      private var _18I_:Array;
      
      public function _0oV_(param1:Console)
      {
         var _loc2_:int = 0;
         var _loc3_:TextFormat = null;
         this._0tU_ = new Object();
         super(param1);
         _loc2_ = style.menuFontSize;
         console.cl.addCLCmd("filter",this._0K_w,"Filter console logs to matching string. When done, click on the * (global channel) at top.",true);
         console.cl.addCLCmd("filterexp",this._lR_,"Filter console logs to matching regular expression",true);
         console.cl.addCLCmd("clearhistory",this._ii,"Clear history of commands you have entered.",true);
         name = NAME;
         _14b = 50;
         _E_r = 18;
         this._mn = _1ae("traceField");
         this._mn.wordWrap = true;
         this._mn.multiline = true;
         this._mn.y = _loc2_;
         this._mn.addEventListener(Event.SCROLL,this._0r4);
         addChild(this._mn);
         _0E_y = _1ae("menuField");
         _0E_y.wordWrap = true;
         _0E_y.multiline = true;
         _0E_y.autoSize = TextFieldAutoSize.RIGHT;
         _0E_y.height = _loc2_ + 6;
         _0E_y.y = -2;
         _J_7(_0E_y,this.onMenuRollOver);
         addChild(_0E_y);
         this._1n6 = new Shape();
         this._1n6.name = "commandBackground";
         this._1n6.graphics.beginFill(style.commandLineColor,0.1);
         this._1n6.graphics.drawRoundRect(0,0,100,18,_loc2_,_loc2_);
         this._1n6.scale9Grid = new Rectangle(9,9,80,1);
         addChild(this._1n6);
         _loc3_ = new TextFormat(style.menuFont,style.menuFontSize,style.highColor);
         this._wA_ = new TextField();
         this._wA_.name = "commandField";
         this._wA_.type = TextFieldType.INPUT;
         this._wA_.x = 40;
         this._wA_.height = _loc2_ + 6;
         this._wA_.addEventListener(KeyboardEvent.KEY_DOWN,this._0dP_);
         this._wA_.addEventListener(KeyboardEvent.KEY_UP,this._2T_);
         this._wA_.addEventListener(FocusEvent.FOCUS_IN,this._0Q_8);
         this._wA_.addEventListener(FocusEvent.FOCUS_OUT,this._0dU_);
         this._wA_.defaultTextFormat = _loc3_;
         addChild(this._wA_);
         this._08s = _1ae("hintField",true);
         this._08s.mouseEnabled = false;
         this._08s.x = this._wA_.x;
         this._08s.autoSize = TextFieldAutoSize.LEFT;
         addChild(this._08s);
         this._jc();
         _loc3_.color = style.commandLineColor;
         this._0zL_ = new TextField();
         this._0zL_.name = "commandPrefx";
         this._0zL_.type = TextFieldType.DYNAMIC;
         this._0zL_.x = 2;
         this._0zL_.height = _loc2_ + 6;
         this._0zL_.selectable = false;
         this._0zL_.defaultTextFormat = _loc3_;
         this._0zL_.addEventListener(MouseEvent.MOUSE_DOWN,this._1bT_);
         this._0zL_.addEventListener(MouseEvent.MOUSE_MOVE,this._1hy);
         this._0zL_.addEventListener(MouseEvent.ROLL_OUT,this._1hy);
         addChild(this._0zL_);
         this._0F_0 = new Shape();
         this._0F_0.name = "blinkLine";
         this._0F_0.alpha = 0.2;
         addChild(this._0F_0);
         this._2v = new Sprite();
         this._2v.name = "scroller";
         this._2v.tabEnabled = false;
         this._2v.y = _loc2_ + 4;
         this._2v.buttonMode = true;
         this._2v.addEventListener(MouseEvent.MOUSE_DOWN,this._0J_o,false,0,true);
         this._1C_K_ = new Sprite();
         this._1C_K_.name = "scrollbar";
         this._1C_K_.tabEnabled = false;
         this._1C_K_.y = style.controlSize;
         this._1C_K_.graphics.beginFill(style.controlColor,1);
         this._1C_K_.graphics.drawRect(-style.controlSize,0,style.controlSize,30);
         this._1C_K_.graphics.beginFill(0,0);
         this._1C_K_.graphics.drawRect(-style.controlSize * 2,0,style.controlSize * 2,30);
         this._1C_K_.graphics.endFill();
         this._1C_K_.addEventListener(MouseEvent.MOUSE_DOWN,this._Q_c,false,0,true);
         this._2v.addChild(this._1C_K_);
         addChild(this._2v);
         this._wA_.visible = false;
         this._0zL_.visible = false;
         this._1n6.visible = false;
         this._0n4("");
         init(640,100,true);
         _07a(_0E_y);
         if(console.so[_A_g] is Array)
         {
            this._18I_ = console.so[_A_g];
         }
         else
         {
            console.so[_A_g] = this._18I_ = new Array();
         }
         if(config.rememberFilterSettings && console.so[_so] is Array)
         {
            this._1vH_ = console.so[_so];
         }
         else
         {
            console.so[_so] = this._1vH_ = new Array();
         }
         if(config.rememberFilterSettings && console.so[_M_y] is Array)
         {
            this._0W_W_ = console.so[_M_y];
         }
         if(this._1vH_.length > 0 || this._0W_W_ == null)
         {
            console.so[_M_y] = this._0W_W_ = new Array();
         }
         if(config.rememberFilterSettings && console.so[_0T_A_] is uint)
         {
            this._0fc = console.so[_0T_A_];
         }
         addEventListener(MouseEvent.MOUSE_WHEEL,this._1b2,false,0,true);
         addEventListener(TextEvent.LINK,this._02b,false,0,true);
         addEventListener(Event.ADDED_TO_STAGE,this._1jz,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this._j0,false,0,true);
      }
      
      public function _1J_Z_(param1:String, param2:Function, param3:Array, param4:String) : void
      {
         if(param1)
         {
            param1 = param1.replace(/[^\w]*/g,"");
            if(param2 == null)
            {
               delete this._0tU_[param1];
            }
            else
            {
               this._0tU_[param1] = new Array(param2,param3,param4);
            }
            this._0xz = true;
         }
         else
         {
            console.report("ERROR: Invalid add menu params.",9);
         }
      }
      
      private function _1jz(param1:Event = null) : void
      {
         stage.addEventListener(MouseEvent.MOUSE_DOWN,this._0uz,true,0,true);
         stage.addEventListener(KeyboardEvent.KEY_UP,this._X_W_,false,0,true);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this._32,false,0,true);
      }
      
      private function _j0(param1:Event = null) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_DOWN,this._0uz,true);
         stage.removeEventListener(KeyboardEvent.KEY_UP,this._X_W_);
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._32);
      }
      
      private function _0uz(param1:MouseEvent) : void
      {
         this._0W_w = param1.shiftKey;
         this._1nu = param1.ctrlKey;
         this._1Z_u = param1.altKey;
      }
      
      private function _1b2(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this._0W_w)
         {
            _loc2_ = console.config.style.traceFontSize + (param1.delta > 0?1:-1);
            if(_loc2_ > 10 && _loc2_ < 20)
            {
               console.config.style.traceFontSize = _loc2_;
               console.config.style.updateStyleSheet();
               this._0F_1();
               param1.stopPropagation();
            }
         }
      }
      
      private function _1hy(param1:MouseEvent) : void
      {
         console.panels.tooltip(param1.type == MouseEvent.MOUSE_MOVE?"Current scope::(CommandLine)":"",this);
      }
      
      private function _1bT_(param1:MouseEvent) : void
      {
         try
         {
            stage.focus = this._wA_;
            this._lu();
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      private function _32(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.SHIFT)
         {
            this._0W_w = true;
         }
         if(param1.keyCode == Keyboard.CONTROL)
         {
            this._1nu = true;
         }
         if(param1.keyCode == 18)
         {
            this._1Z_u = true;
         }
      }
      
      private function _X_W_(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.SHIFT)
         {
            this._0W_w = false;
         }
         else if(param1.keyCode == Keyboard.CONTROL)
         {
            this._1nu = false;
         }
         else if(param1.keyCode == 18)
         {
            this._1Z_u = false;
         }
         if((param1.keyCode == Keyboard.TAB || param1.keyCode == Keyboard.ENTER) && parent.visible && visible && this._wA_.visible)
         {
            try
            {
               stage.focus = this._wA_;
               this._lu();
               return;
            }
            catch(err:Error)
            {
               return;
            }
         }
      }
      
      public function requestLogin(param1:Boolean = true) : void
      {
         var _loc2_:ColorTransform = new ColorTransform();
         if(param1)
         {
            console.commandLine = true;
            console.report("//",-2);
            console.report("// <b>Enter remoting password</b> in CommandLine below...",-2);
            this._0n4("Password");
            _loc2_.color = style.controlColor;
            this._1n6.transform.colorTransform = _loc2_;
            this._mn.transform.colorTransform = new ColorTransform(0.7,0.7,0.7);
         }
         else
         {
            this._0n4("");
            this._1n6.transform.colorTransform = _loc2_;
            this._mn.transform.colorTransform = _loc2_;
         }
         this._wA_.displayAsPassword = param1;
         this._B_v = param1;
      }
      
      public function update(param1:Boolean) : void
      {
         if(this._0F_0.alpha > 0)
         {
            this._0F_0.alpha = this._0F_0.alpha - 0.25;
         }
         if(style.showCommandLineScope)
         {
            if(this._1L_m != console.cl.scopeString)
            {
               this._1L_m = console.cl.scopeString;
               this._0n4(this._1L_m);
            }
         }
         else if(this._1L_m != null)
         {
            this._1L_m = "";
            this._0n4("");
         }
         if(param1)
         {
            this._0F_0.alpha = 1;
            this._0xz = true;
            this._13r = true;
         }
         if(this._13r)
         {
            this._13r = false;
            this._0O_5(true);
         }
         if(this._0xz)
         {
            this._0xz = false;
            this._V_3();
         }
      }
      
      public function _0F_1() : void
      {
         this._vm = true;
         this._13r = true;
      }
      
      private function _0O_5(param1:Boolean = false) : void
      {
         if(this._vm)
         {
            this._01w();
         }
         else if(!param1)
         {
            this._0nu();
         }
         if(this._0F_3 != this._1E_y)
         {
            if(this._vm)
            {
               this._mn.setSelection(this._mn.text.length - this._0F_3,this._mn.text.length - this._1E_y);
            }
            else
            {
               this._mn.setSelection(this._mn.text.length - this._1E_y,this._mn.text.length - this._0F_3);
            }
            this._1E_y = -1;
            this._0F_3 = -1;
         }
      }
      
      private function _0nu() : void
      {
         var _loc1_:* = "";
         var _loc2_:_1D_7 = console.logs.first;
         var _loc3_:* = this._1vH_.length != 1;
         var _loc4_:Boolean = this._0fc == 0 && this._1vH_.length == 0;
         while(_loc2_)
         {
            if(_loc4_ || this._0N_d(_loc2_))
            {
               _loc1_ = _loc1_ + this._eA_(_loc2_,_loc3_);
            }
            _loc2_ = _loc2_.next;
         }
         this._1D_m = true;
         this._mn.htmlText = "<logs>" + _loc1_ + "</logs>";
         this._1D_m = false;
         this._0pk();
      }
      
      public function _qx(param1:Boolean) : void
      {
         if(param1 && this._vm)
         {
            this._vm = false;
            this._0O_5();
            this._mn.scrollV = this._mn.maxScrollV;
         }
         else if(!param1)
         {
            this._vm = true;
            this._01w();
         }
         this.updateMenu();
      }
      
      private function _01w() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = "";
         var _loc3_:int = Math.round(this._mn.height / style.traceFontSize);
         var _loc4_:int = Math.round(this._mn.width * 5 / style.traceFontSize);
         var _loc5_:_1D_7 = console.logs.last;
         var _loc6_:* = this._1vH_.length != 1;
         while(_loc5_)
         {
            if(this._0N_d(_loc5_))
            {
               _loc1_ = Math.ceil(_loc5_.text.length / _loc4_);
               if(_loc5_.html || _loc3_ >= _loc1_)
               {
                  _loc2_ = this._eA_(_loc5_,_loc6_) + _loc2_;
                  _loc3_ = _loc3_ - _loc1_;
                  if(_loc3_ <= 0)
                  {
                     break;
                  }
               }
               else
               {
                  _loc5_ = _loc5_.clone();
                  _loc5_.text = _loc5_.text.substring(Math.max(0,_loc5_.text.length - _loc4_ * _loc3_));
                  _loc2_ = this._eA_(_loc5_,_loc6_) + _loc2_;
                  break;
               }
            }
            _loc5_ = _loc5_._17R_;
         }
         this._1D_m = true;
         this._mn.htmlText = "<logs>" + _loc2_ + "</logs>";
         this._mn.scrollV = this._mn.maxScrollV;
         this._1D_m = false;
         this._0pk();
      }
      
      private function _0N_d(param1:_1D_7) : Boolean
      {
         return (this._0fc == 0 || param1.priority >= this._0fc) && (this._ly(param1.ch) || this._gE_ && this._1vH_.indexOf(Console._0Z_Y_) >= 0 && param1.text.toLowerCase().indexOf(this._gE_) >= 0 || this._1lV_ && this._1vH_.indexOf(Console._0Z_Y_) >= 0 && param1.text.search(this._1lV_) >= 0);
      }
      
      private function _ly(param1:String) : Boolean
      {
         return (this._1vH_.length == 0 || this._1vH_.indexOf(param1) >= 0) && (this._0W_W_.length == 0 || this._0W_W_.indexOf(param1) < 0);
      }
      
      public function get reportChannel() : String
      {
         return this._1vH_.length == 1?this._1vH_[0]:Console._B_G_;
      }
      
      public function setViewingChannels(... rest) : void
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:Array = new Array();
         for each(_loc2_ in rest)
         {
            _loc4_.push(Console._0U_s(_loc2_));
         }
         if(this._1vH_[0] == _1R_M_._0yJ_ && (!_loc4_ || _loc4_[0] != this._1vH_[0]))
         {
            console.refs.exitFocus();
         }
         this._0W_W_.splice(0);
         this._1vH_.splice(0);
         if(_loc4_.indexOf(Console._z4) < 0 && _loc4_.indexOf(null) < 0)
         {
            for each(_loc3_ in _loc4_)
            {
               if(_loc3_)
               {
                  this._1vH_.push(_loc3_);
               }
            }
         }
         this._0F_1();
         console.panels.updateMenu();
      }
      
      public function get viewingChannels() : Array
      {
         return this._1vH_;
      }
      
      public function _1iQ_(... rest) : void
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:Array = new Array();
         for each(_loc2_ in rest)
         {
            _loc4_.push(Console._0U_s(_loc2_));
         }
         if(this._1vH_[0] == _1R_M_._0yJ_)
         {
            console.refs.exitFocus();
         }
         this._0W_W_.splice(0);
         this._1vH_.splice(0);
         if(_loc4_.indexOf(Console._z4) < 0 && _loc4_.indexOf(null) < 0)
         {
            for each(_loc3_ in _loc4_)
            {
               if(_loc3_)
               {
                  this._0W_W_.push(_loc3_);
               }
            }
         }
         this._0F_1();
         console.panels.updateMenu();
      }
      
      public function get ignoredChannels() : Array
      {
         return this._0W_W_;
      }
      
      private function _0K_w(param1:String = "") : void
      {
         if(param1)
         {
            this._1lV_ = null;
            this._gE_ = _1R_M_._0B_m(param1.toLowerCase());
            this._0iP_();
         }
         else
         {
            this._0jA_();
         }
      }
      
      private function _lR_(param1:String = "") : void
      {
         if(param1)
         {
            this._gE_ = null;
            this._1lV_ = new RegExp(_1R_M_._0B_m(param1),"gi");
            this._0iP_();
         }
         else
         {
            this._0jA_();
         }
      }
      
      private function _0iP_() : void
      {
         console.clear(Console._0Z_Y_);
         console.logs.addChannel(Console._0Z_Y_);
         this.setViewingChannels(Console._0Z_Y_);
      }
      
      private function _0jA_() : void
      {
         this._1lV_ = null;
         this._gE_ = null;
         if(this._1vH_.length == 1 && this._1vH_[0] == Console._0Z_Y_)
         {
            this.setViewingChannels(Console._z4);
         }
      }
      
      private function _eA_(param1:_1D_7, param2:Boolean) : String
      {
         var _loc3_:* = "<p>";
         if(param2)
         {
            _loc3_ = _loc3_ + param1._F_n;
         }
         if(config.showLineNumber)
         {
            _loc3_ = _loc3_ + param1._dj;
         }
         if(config.showTimestamp)
         {
            _loc3_ = _loc3_ + param1._0xS_;
         }
         var _loc4_:String = "p" + param1.priority;
         return _loc3_ + "<" + _loc4_ + ">" + this._wB_(param1.text) + "</" + _loc4_ + "></p>";
      }
      
      private function _wB_(param1:String) : String
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         if(this._1lV_)
         {
            this._1lV_.lastIndex = 0;
            _loc2_ = this._1lV_.exec(param1);
            while(_loc2_ != null)
            {
               _loc3_ = _loc2_.index;
               _loc4_ = _loc2_[0];
               if(_loc4_.search("<|>") >= 0)
               {
                  this._1lV_.lastIndex = this._1lV_.lastIndex - (_loc4_.length - _loc4_.search("<|>"));
               }
               else if(param1.lastIndexOf("<",_loc3_) <= param1.lastIndexOf(">",_loc3_))
               {
                  param1 = param1.substring(0,_loc3_) + "<u>" + param1.substring(_loc3_,_loc3_ + _loc4_.length) + "</u>" + param1.substring(_loc3_ + _loc4_.length);
                  this._1lV_.lastIndex = this._1lV_.lastIndex + 7;
               }
               _loc2_ = this._1lV_.exec(param1);
            }
         }
         else if(this._gE_)
         {
            _loc5_ = param1.toLowerCase();
            _loc6_ = _loc5_.lastIndexOf(this._gE_);
            while(_loc6_ >= 0)
            {
               param1 = param1.substring(0,_loc6_) + "<u>" + param1.substring(_loc6_,_loc6_ + this._gE_.length) + "</u>" + param1.substring(_loc6_ + this._gE_.length);
               _loc6_ = _loc5_.lastIndexOf(this._gE_,_loc6_ - 2);
            }
         }
         return param1;
      }
      
      private function _0r4(param1:Event = null) : void
      {
         var _loc2_:int = 0;
         if(this._1D_m || this._0W_w)
         {
            return;
         }
         var _loc3_:* = this._mn.scrollV >= this._mn.maxScrollV;
         if(!console.paused && this._vm != _loc3_)
         {
            _loc2_ = this._mn.maxScrollV - this._mn.scrollV;
            this._0F_3 = this._mn.text.length - this._mn.selectionBeginIndex;
            this._1E_y = this._mn.text.length - this._mn.selectionEndIndex;
            this._vm = _loc3_;
            this._0O_5();
            this._mn.scrollV = this._mn.maxScrollV - _loc2_;
         }
         this._0pk();
      }
      
      private function _0pk() : void
      {
         if(this._mn.maxScrollV <= 1)
         {
            this._2v.visible = false;
         }
         else
         {
            this._2v.visible = true;
            if(this._vm)
            {
               this._0pV_ = 1;
            }
            else
            {
               this._0pV_ = (this._mn.scrollV - 1) / (this._mn.maxScrollV - 1);
            }
         }
      }
      
      private function _0J_o(param1:MouseEvent) : void
      {
         if(this._1C_K_.visible && this._1C_K_.mouseY > 0 || !this._1C_K_.visible && this._2v.mouseY > this._0eQ_ / 2)
         {
            this._0D_f = 3;
         }
         else
         {
            this._0D_f = -3;
         }
         this._mn.scrollV = this._mn.scrollV + this._0D_f;
         this._N_x = 0;
         addEventListener(Event.ENTER_FRAME,this._1R_L_,false,0,true);
         stage.addEventListener(MouseEvent.MOUSE_UP,this._N_u,false,0,true);
      }
      
      private function _1R_L_(param1:Event) : void
      {
         this._N_x++;
         if(this._N_x > 10)
         {
            this._N_x = 9;
            if(this._0D_f < 0 && this._1C_K_.y > this._2v.mouseY || this._0D_f > 0 && this._1C_K_.y + this._1C_K_.height < this._2v.mouseY)
            {
               this._mn.scrollV = this._mn.scrollV + this._0D_f;
            }
         }
      }
      
      private function _N_u(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this._1R_L_);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._N_u);
      }
      
      private function get _0pV_() : Number
      {
         return (this._1C_K_.y - style.controlSize) / (this._0eQ_ - 30 - style.controlSize * 2);
      }
      
      private function set _0pV_(param1:Number) : void
      {
         this._1C_K_.y = style.controlSize + (this._0eQ_ - 30 - style.controlSize * 2) * param1;
      }
      
      private function _Q_c(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         this._0Q_w = true;
         if(!console.paused && this._vm)
         {
            this._vm = false;
            _loc2_ = this._0pV_;
            this._0O_5();
            this._0pV_ = _loc2_;
         }
         this._1C_K_.startDrag(false,new Rectangle(0,style.controlSize,0,this._0eQ_ - 30 - style.controlSize * 2));
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this._0P_F_,false,0,true);
         stage.addEventListener(MouseEvent.MOUSE_UP,this._1fD_,false,0,true);
         param1.stopPropagation();
      }
      
      private function _0P_F_(param1:MouseEvent) : void
      {
         this._1D_m = true;
         this._mn.scrollV = Math.round(this._0pV_ * (this._mn.maxScrollV - 1) + 1);
         this._1D_m = false;
      }
      
      private function _1fD_(param1:MouseEvent) : void
      {
         this._1C_K_.stopDrag();
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._0P_F_);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._1fD_);
         this._0Q_w = false;
         this._0r4();
      }
      
      override public function set width(param1:Number) : void
      {
         this._1D_m = true;
         super.width = param1;
         this._mn.width = param1 - 4;
         _0E_y.width = param1 - 6;
         this._wA_.width = width - 15 - this._wA_.x;
         this._1n6.width = param1;
         this._0F_0.graphics.clear();
         this._0F_0.graphics.lineStyle(1,style.controlColor);
         this._0F_0.graphics.moveTo(10,-1);
         this._0F_0.graphics.lineTo(param1 - 10,-1);
         this._2v.x = param1;
         this._vm = true;
         this._1N_N_();
         this._0xz = true;
         this._13r = true;
         this._1D_m = false;
      }
      
      override public function set height(param1:Number) : void
      {
         this._1D_m = true;
         var _loc2_:int = style.menuFontSize;
         var _loc3_:Number = _loc2_ + 6 + style.traceFontSize;
         if(height != param1)
         {
            this._A_6 = param1 < (!!this._wA_.visible?_loc3_ + _loc2_ + 4:_loc3_);
         }
         super.height = param1;
         var _loc4_:Boolean = this._A_6 || !style.topMenu;
         this._E___();
         this._mn.y = !!_loc4_?Number(0):Number(_loc2_);
         this._mn.height = param1 - (!!this._wA_.visible?_loc2_ + 4:0) - (!!_loc4_?0:_loc2_);
         var _loc5_:Number = param1 - (_loc2_ + 6);
         this._wA_.y = _loc5_;
         this._0zL_.y = _loc5_;
         this._08s.y = this._wA_.y - this._08s.height;
         this._1n6.y = _loc5_;
         this._0F_0.y = !!this._wA_.visible?Number(_loc5_):Number(param1);
         this._2v.y = !!_loc4_?Number(6):Number(_loc2_ + 4);
         var _loc6_:uint = style.controlSize;
         this._0eQ_ = this._0F_0.y - (!!this._wA_.visible?0:_loc6_ * 2) - this._2v.y;
         this._1C_K_.visible = this._0eQ_ > 40;
         this._2v.graphics.clear();
         if(this._0eQ_ >= 10)
         {
            this._2v.graphics.beginFill(style.controlColor,0.7);
            this._2v.graphics.drawRect(-_loc6_,0,_loc6_,_loc6_);
            this._2v.graphics.drawRect(-_loc6_,this._0eQ_ - _loc6_,_loc6_,_loc6_);
            this._2v.graphics.beginFill(style.controlColor,0.25);
            this._2v.graphics.drawRect(-_loc6_,_loc6_,_loc6_,this._0eQ_ - _loc6_ * 2);
            this._2v.graphics.beginFill(0,0);
            this._2v.graphics.drawRect(-_loc6_ * 2,_loc6_ * 2,_loc6_ * 2,this._0eQ_ - _loc6_ * 2);
            this._2v.graphics.endFill();
         }
         this._vm = true;
         this._13r = true;
         this._1D_m = false;
      }
      
      private function _E___() : void
      {
         var _loc1_:Boolean = this._A_6 || !style.topMenu;
         this._mn.y = !!_loc1_?Number(0):Number(_0E_y.y + _0E_y.height - 6);
         this._mn.height = Math.max(0,height - (!!this._wA_.visible?style.menuFontSize + 4:0) - this._mn.y);
      }
      
      public function updateMenu(param1:Boolean = false) : void
      {
         if(param1)
         {
            this._V_3();
         }
         else
         {
            this._0xz = true;
         }
      }
      
      private function _V_3() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = null;
         var _loc3_:* = "<r><high>";
         if(this._A_6 || !style.topMenu)
         {
            _loc3_ = _loc3_ + "<menu><b> <a href=\"event:show\">‹</a>";
         }
         else
         {
            if(!console.panels.channelsPanel)
            {
               _loc3_ = _loc3_ + this.getChannelsLink(true);
            }
            _loc3_ = _loc3_ + "<menu> <b>";
            for(_loc2_ in this._0tU_)
            {
               _loc3_ = _loc3_ + ("<a href=\"event:external_" + _loc2_ + "\">" + _loc2_ + "</a> ");
               _loc1_ = true;
            }
            if(_loc1_)
            {
               _loc3_ = _loc3_ + "¦ ";
            }
            _loc3_ = _loc3_ + this._03__("<a href=\"event:fps\">F</a>",console.fpsMonitor > 0);
            _loc3_ = _loc3_ + this._03__(" <a href=\"event:mm\">M</a>",console.memoryMonitor > 0);
            _loc3_ = _loc3_ + this._03__(" <a href=\"event:command\">CL</a>",this.commandLine);
            if(console.remoter.remoting != _0B_2._1X_3)
            {
               if(config.displayRollerEnabled)
               {
                  _loc3_ = _loc3_ + this._03__(" <a href=\"event:roller\">Ro</a>",console.displayRoller);
               }
               if(config.rulerToolEnabled)
               {
                  _loc3_ = _loc3_ + this._03__(" <a href=\"event:ruler\">RL</a>",console.panels.rulerActive);
               }
            }
            _loc3_ = _loc3_ + " ¦</b>";
            _loc3_ = _loc3_ + " <a href=\"event:copy\">Sv</a>";
            _loc3_ = _loc3_ + (" <a href=\"event:priority\">P" + this._0fc + "</a>");
            _loc3_ = _loc3_ + this._03__(" <a href=\"event:pause\">P</a>",console.paused);
            _loc3_ = _loc3_ + " <a href=\"event:clear\">C</a> <a href=\"event:close\">X</a> <a href=\"event:hide\">›</a>";
         }
         _loc3_ = _loc3_ + " </b></menu></high></r>";
         _0E_y.htmlText = _loc3_;
         _0E_y.scrollH = _0E_y.maxScrollH;
         this._E___();
      }
      
      public function getChannelsLink(param1:Boolean = false) : String
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc8_:int = 0;
         var _loc4_:* = "<chs>";
         var _loc5_:Array = console.logs.getChannels();
         var _loc6_:int = _loc5_.length;
         if(param1 && _loc6_ > style.maxChannelsInMenu)
         {
            _loc6_ = style.maxChannelsInMenu;
         }
         var _loc7_:Boolean = this._1vH_.length > 0 || this._0W_W_.length > 0;
         while(_loc8_ < _loc6_)
         {
            _loc2_ = _loc5_[_loc8_];
            _loc3_ = !_loc7_ && _loc8_ == 0 || _loc7_ && _loc8_ != 0 && this._ly(_loc2_)?"<ch><b>" + _loc2_ + "</b></ch>":_loc2_;
            _loc4_ = _loc4_ + ("<a href=\"event:channel_" + _loc2_ + "\">[" + _loc3_ + "]</a> ");
            _loc8_++;
         }
         if(param1)
         {
            _loc4_ = _loc4_ + ("<ch><a href=\"event:channels\"><b>" + (_loc5_.length > _loc6_?"...":"") + "</b>^^ </a></ch>");
         }
         return _loc4_ + "</chs> ";
      }
      
      private function _03__(param1:String, param2:Boolean) : String
      {
         if(param2)
         {
            return "<menuHi>" + param1 + "</menuHi>";
         }
         return param1;
      }
      
      public function onMenuRollOver(param1:TextEvent, param2:_0M_f = null) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         if(param2 == null)
         {
            param2 = this;
         }
         var _loc5_:* = !!param1.text?param1.text.replace("event:",""):"";
         if(_loc5_ == "channel_" + Console._z4)
         {
            _loc5_ = "View all channels";
         }
         else if(_loc5_ == "channel_" + Console._0M_x)
         {
            _loc5_ = "Default channel::Logs with no channel";
         }
         else if(_loc5_ == "channel_" + Console._B_G_)
         {
            _loc5_ = "Console\'s channel::Logs generated from Console";
         }
         else if(_loc5_ == "channel_" + Console._0Z_Y_)
         {
            _loc5_ = !!this._1lV_?String(this._1lV_):this._gE_;
            _loc5_ = "Filtering channel" + "::*" + _loc5_ + "*";
         }
         else if(_loc5_ == "channel_" + _1R_M_._0yJ_)
         {
            _loc5_ = "Inspecting channel";
         }
         else if(_loc5_.indexOf("channel_") == 0)
         {
            _loc5_ = "Change channel::shift: select multiple\nctrl: ignore channel";
         }
         else if(_loc5_ == "pause")
         {
            if(console.paused)
            {
               _loc5_ = "Resume updates";
            }
            else
            {
               _loc5_ = "Pause updates";
            }
         }
         else if(_loc5_ == "close" && param2 == this)
         {
            _loc5_ = "Close::Type password to show again";
         }
         else if(_loc5_.indexOf("external_") == 0)
         {
            _loc3_ = this._0tU_[_loc5_.substring(9)];
            if(_loc3_)
            {
               _loc5_ = _loc3_[2];
            }
         }
         else
         {
            _loc4_ = {
               "fps":"Frames Per Second",
               "mm":"Memory Monitor",
               "roller":"Display Roller::Map the display list under your mouse",
               "ruler":"Screen Ruler::Measure the distance and angle between two points on screen.",
               "command":"Command Line",
               "copy":"Save to clipboard::shift: no channel name\nctrl: use viewing filters\nalt: save to file",
               "clear":"Clear log",
               "priority":"Priority filter::shift: previous priority\n(skips unused priorites)",
               "channels":"Expand channels",
               "close":"Close"
            };
            _loc5_ = _loc4_[_loc5_];
         }
         console.panels.tooltip(_loc5_,param2);
      }
      
      private function _02b(param1:TextEvent) : void
      {
         var str:String = null;
         var file:FileReference = null;
         var ind:int = 0;
         var menu:Array = null;
         var _local3:* = undefined;
         var e:TextEvent = param1;
         _0E_y.setSelection(0,0);
         stopDrag();
         var t:String = e.text;
         if(t == "pause")
         {
            if(console.paused)
            {
               console.paused = false;
            }
            else
            {
               console.paused = true;
            }
            console.panels.tooltip(null);
         }
         else if(t == "hide")
         {
            console.panels.tooltip();
            this._A_6 = true;
            console.config.style.topMenu = false;
            this.height = height;
            this.updateMenu();
         }
         else if(t == "show")
         {
            console.panels.tooltip();
            this._A_6 = false;
            console.config.style.topMenu = true;
            this.height = height;
            this.updateMenu();
         }
         else if(t == "close")
         {
            console.panels.tooltip();
            visible = false;
            dispatchEvent(new Event(Event.CLOSE));
         }
         else if(t == "channels")
         {
            console.panels.channelsPanel = !console.panels.channelsPanel;
         }
         else if(t == "fps")
         {
            console.fpsMonitor = !console.fpsMonitor;
         }
         else if(t == "priority")
         {
            this._063(this._0W_w);
         }
         else if(t == "mm")
         {
            console.memoryMonitor = !console.memoryMonitor;
         }
         else if(t == "roller")
         {
            console.displayRoller = !console.displayRoller;
         }
         else if(t == "ruler")
         {
            console.panels.tooltip();
            console.panels.startRuler();
         }
         else if(t == "command")
         {
            this.commandLine = !this.commandLine;
         }
         else if(t == "copy")
         {
            str = console.logs.getLogsAsString("\r\n",!this._0W_w,!!this._1nu?this._0N_d:null);
            if(this._1Z_u)
            {
               file = new FileReference();
               try
               {
                  _local3 = file;
                  _local3["save"](str,"log.txt");
               }
               catch(err:Error)
               {
                  console.report("Save to file is not supported in your flash player.",8);
               }
            }
            else
            {
               System.setClipboard(str);
               console.report("Copied log to clipboard.",-1);
            }
         }
         else if(t == "clear")
         {
            console.clear();
         }
         else if(t == "settings")
         {
            console.report("A new window should open in browser. If not, try searching for \'Flash Player Global Security Settings panel\' online :)",-1);
            Security.showSettings(SecurityPanel.SETTINGS_MANAGER);
         }
         else if(t == "remote")
         {
            console.remoter.remoting = _0B_2._1X_3;
         }
         else if(t.indexOf("ref") == 0)
         {
            console.refs.handleRefEvent(t);
         }
         else if(t.indexOf("channel_") == 0)
         {
            this.onChannelPressed(t.substring(8));
         }
         else if(t.indexOf("cl_") == 0)
         {
            ind = t.indexOf("_",3);
            console.cl.handleScopeEvent(uint(t.substring(3,ind < 0?Number(t.length):Number(ind))));
            if(ind >= 0)
            {
               this._wA_.text = t.substring(ind + 1);
            }
         }
         else if(t.indexOf("external_") == 0)
         {
            menu = this._0tU_[t.substring(9)];
            if(menu)
            {
               menu[0].apply(null,menu[1]);
            }
         }
         _0E_y.setSelection(0,0);
         e.stopPropagation();
      }
      
      public function onChannelPressed(param1:String) : void
      {
         var _loc2_:Array = null;
         if(this._1nu && param1 != Console._z4)
         {
            _loc2_ = this._05O_(this._0W_W_,param1);
            this._1iQ_.apply(this,_loc2_);
         }
         else if(this._0W_w && param1 != Console._z4 && this._1vH_[0] != _1R_M_._0yJ_)
         {
            _loc2_ = this._05O_(this._1vH_,param1);
            this.setViewingChannels.apply(this,_loc2_);
         }
         else
         {
            console.setViewingChannels(param1);
         }
      }
      
      private function _05O_(param1:Array, param2:String) : Array
      {
         param1 = param1.concat();
         var _loc3_:int = param1.indexOf(param2);
         if(_loc3_ >= 0)
         {
            param1.splice(_loc3_,1);
            if(param1.length == 0)
            {
               param1.push(Console._z4);
            }
         }
         else
         {
            param1.push(param2);
         }
         return param1;
      }
      
      public function set priority(param1:uint) : void
      {
         this._0fc = param1;
         console.so[_0T_A_] = this._0fc;
         this._0F_1();
         this.updateMenu();
      }
      
      public function get priority() : uint
      {
         return this._0fc;
      }
      
      private function _063(param1:Boolean) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 10;
         var _loc4_:_1D_7 = console.logs.last;
         var _loc5_:int = this._0fc;
         this._0fc = 0;
         var _loc6_:uint = 32000;
         while(_loc4_ && _loc6_ > 0)
         {
            _loc6_--;
            if(this._0N_d(_loc4_))
            {
               if(_loc4_.priority > _loc5_ && _loc3_ > _loc4_.priority)
               {
                  _loc3_ = _loc4_.priority;
               }
               if(_loc4_.priority < _loc5_ && _loc2_ < _loc4_.priority)
               {
                  _loc2_ = _loc4_.priority;
               }
            }
            _loc4_ = _loc4_._17R_;
         }
         if(param1)
         {
            if(_loc2_ == _loc5_)
            {
               _loc5_ = 10;
            }
            else
            {
               _loc5_ = _loc2_;
            }
         }
         else if(_loc3_ == _loc5_)
         {
            _loc5_ = 0;
         }
         else
         {
            _loc5_ = _loc3_;
         }
         this.priority = _loc5_;
      }
      
      private function _ii(... rest) : void
      {
         this._3p = -1;
         console.updateSO();
         this._18I_ = new Array();
      }
      
      private function _0dP_(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.TAB)
         {
            if(this._0g2)
            {
               this._wA_.text = this._0g2;
               this._lu();
               this._jc();
            }
         }
      }
      
      private function _2T_(param1:KeyboardEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         if(param1.keyCode == Keyboard.ENTER)
         {
            this._0F_1();
            this._jc();
            if(this._B_v)
            {
               console.remoter.login(this._wA_.text);
               this._wA_.text = "";
               this.requestLogin(false);
            }
            else
            {
               _loc2_ = this._wA_.text;
               if(_loc2_.length > 2)
               {
                  _loc3_ = this._18I_.indexOf(_loc2_);
                  while(_loc3_ >= 0)
                  {
                     this._18I_.splice(_loc3_,1);
                     _loc3_ = this._18I_.indexOf(_loc2_);
                  }
                  this._18I_.unshift(_loc2_);
                  this._3p = -1;
                  if(this._18I_.length > 20)
                  {
                     this._18I_.splice(20);
                  }
                  console.updateSO(_A_g);
               }
               this._wA_.text = "";
               if(config.commandLineInputPassThrough != null)
               {
                  _loc2_ = config.commandLineInputPassThrough(_loc2_);
               }
               if(_loc2_)
               {
                  console.cl.run(_loc2_);
               }
            }
         }
         else if(param1.keyCode == Keyboard.ESCAPE)
         {
            if(stage)
            {
               stage.focus = null;
            }
         }
         else if(param1.keyCode == Keyboard.UP)
         {
            this._jc();
            if(this._wA_.text && this._3p < 0)
            {
               this._18I_.unshift(this._wA_.text);
               this._3p++;
            }
            if(this._3p < this._18I_.length - 1)
            {
               this._3p++;
               this._wA_.text = this._18I_[this._3p];
               this._lu();
            }
            else
            {
               this._3p = this._18I_.length;
               this._wA_.text = "";
            }
         }
         else if(param1.keyCode == Keyboard.DOWN)
         {
            this._jc();
            if(this._3p > 0)
            {
               this._3p--;
               this._wA_.text = this._18I_[this._3p];
               this._lu();
            }
            else
            {
               this._3p = -1;
               this._wA_.text = "";
            }
         }
         else if(param1.keyCode == Keyboard.TAB)
         {
            this._lu();
         }
         else if(!this._B_v)
         {
            this._0Q_8();
         }
      }
      
      private function _lu() : void
      {
         this._wA_.setSelection(this._wA_.text.length,this._wA_.text.length);
      }
      
      private function _0Q_8(param1:Event = null) : void
      {
         var _loc2_:String = this._wA_.text;
         if(_loc2_ && config.commandLineAutoCompleteEnabled && console.remoter.remoting != _0B_2._1X_3)
         {
            try
            {
               this._jc(console.cl.getHintsFor(_loc2_,5));
               return;
            }
            catch(err:Error)
            {
            }
         }
         this._jc();
      }
      
      private function _0dU_(param1:Event) : void
      {
         this._jc();
      }
      
      private function _jc(param1:Array = null) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:Rectangle = null;
         var _loc5_:String = null;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         if(param1 && param1.length)
         {
            this._0g2 = param1[0][0];
            if(param1.length > 1)
            {
               _loc5_ = param1[1][0];
               _loc6_ = false;
               _loc7_ = 0;
               while(_loc7_ < _loc5_.length)
               {
                  if(_loc5_.charAt(_loc7_) == this._0g2.charAt(_loc7_))
                  {
                     _loc6_ = true;
                     _loc7_++;
                     continue;
                  }
                  if(_loc6_ && this._wA_.text.length < _loc7_)
                  {
                     this._0g2 = this._0g2.substring(0,_loc7_);
                  }
                  break;
               }
            }
            _loc2_ = new Array();
            for each(_loc3_ in param1)
            {
               _loc2_.push("<p3>" + _loc3_[0] + "</p3> <p0>" + (!!_loc3_[1]?_loc3_[1]:"") + "</p0>");
            }
            this._08s.htmlText = "<p>" + _loc2_.reverse().join("\n") + "</p>";
            this._08s.visible = true;
            _loc4_ = this._wA_.getCharBoundaries(this._wA_.text.length - 1);
            if(!_loc4_)
            {
               _loc4_ = new Rectangle();
            }
            this._08s.x = this._wA_.x + _loc4_.x + _loc4_.width + 30;
            this._08s.y = height - this._08s.height;
         }
         else
         {
            this._08s.visible = false;
            this._0g2 = null;
         }
      }
      
      public function _0n4(param1:String) : void
      {
         if(this._B_v)
         {
            this._B_v = false;
            this.requestLogin(false);
         }
         this._0zL_.autoSize = TextFieldAutoSize.LEFT;
         this._0zL_.text = param1;
         this._1N_N_();
      }
      
      private function _1N_N_() : void
      {
         var _loc1_:Number = width - 48;
         if(this._0zL_.width > 120 || this._0zL_.width > _loc1_)
         {
            this._0zL_.autoSize = TextFieldAutoSize.NONE;
            this._0zL_.width = _loc1_ > 120?Number(120):Number(_loc1_);
            this._0zL_.scrollH = this._0zL_.maxScrollH;
         }
         this._wA_.x = this._0zL_.width + 2;
         this._wA_.width = width - 15 - this._wA_.x;
         this._08s.x = this._wA_.x;
      }
      
      public function set commandLine(param1:Boolean) : void
      {
         if(param1)
         {
            this._wA_.visible = true;
            this._0zL_.visible = true;
            this._1n6.visible = true;
         }
         else
         {
            this._wA_.visible = false;
            this._0zL_.visible = false;
            this._1n6.visible = false;
         }
         this._0xz = true;
         this.height = height;
      }
      
      public function get commandLine() : Boolean
      {
         return this._wA_.visible;
      }
   }
}
