package _2F_
{
   import flash.display.Sprite;
   import _0ib._1R_M_;
   import _qO_._1Y_B_;
   import _0ib.CommandLine;
   import _0ib._S_T_;
   import _0ib._1sD_;
   import _0ib._0i1;
   import _0ib._0B_2;
   import _0ib._0U_M_;
   import _0ib._k8;
   import flash.net.SharedObject;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.display.LoaderInfo;
   import flash.events.IEventDispatcher;
   import flash.events.ErrorEvent;
   import flash.geom.Rectangle;
   import _qO_._n4;
   import flash.display.DisplayObjectContainer;
   import flash.utils.getTimer;
   import _1wl._1D_7;
   import flash.system.Capabilities;
   
   public class Console extends Sprite
   {
      
      public static const VERSION:Number = 2.6;
      
      public static const _15X_:String = "";
      
      public static const _h9:int = 611;
      
      public static const _1iR_:String = "2012/02/22 00:11";
      
      public static const _7k:uint = 1;
      
      public static const INFO:uint = 3;
      
      public static const DEBUG:uint = 6;
      
      public static const WARN:uint = 8;
      
      public static const ERROR:uint = 9;
      
      public static const FATAL:uint = 10;
      
      public static const _z4:String = " * ";
      
      public static const _0M_x:String = "-";
      
      public static const _B_G_:String = "C";
      
      public static const _0Z_Y_:String = "~";
       
      
      private var _config:_2F_._0__X_;
      
      private var _um:_1Y_B_;
      
      private var _O_5:CommandLine;
      
      private var _0tQ_:_S_T_;
      
      private var _5S_:_1R_M_;
      
      private var _0D_E_:_1sD_;
      
      private var _0P_W_:_0i1;
      
      private var _03A_:_0B_2;
      
      private var _1T_t:_0U_M_;
      
      private var _02L_:int = 50;
      
      private var _0id:Boolean;
      
      private var _12J_:_2F_._0p;
      
      private var _131:_k8;
      
      private var _150:SharedObject;
      
      private var _qn:Object;
      
      public function Console(param1:String = "", param2:_2F_._0__X_ = null)
      {
         var password:String = param1;
         var config:_2F_._0__X_ = param2;
         this._qn = {};
         super();
         name = "Console";
         if(config == null)
         {
            config = new _2F_._0__X_();
         }
         this._config = config;
         if(password)
         {
            this._config.keystrokePassword = password;
         }
         this._03A_ = new _0B_2(this);
         this._131 = new _k8(this);
         this._5S_ = new _1R_M_(this);
         this._O_5 = new CommandLine(this);
         this._1T_t = new _0U_M_(this);
         this._0P_W_ = new _0i1(this);
         this._0D_E_ = new _1sD_(this);
         this._0tQ_ = new _S_T_(this);
         this.cl.addCLCmd("remotingSocket",function(param1:String = ""):void
         {
            var _loc2_:Array = param1.split(/\s+|\:/);
            remotingSocket(_loc2_[0],_loc2_[1]);
         },"Connect to socket remote. /remotingSocket ip port");
         if(this._config._1oD_)
         {
            try
            {
               this._150 = SharedObject.getLocal(this._config._1oD_,this._config._1V_k);
               this._qn = this._150.data;
            }
            catch(e:Error)
            {
            }
         }
         this._config.style.updateStyleSheet();
         this._um = new _1Y_B_(this);
         if(password)
         {
            this.visible = false;
         }
         this.report("<b>Console v" + VERSION + _15X_ + "</b> build " + _h9 + ". " + Capabilities.playerType + " " + Capabilities.version + ".",-2);
         addEventListener(Event.ENTER_FRAME,this._1Y_a);
         addEventListener(Event.ADDED_TO_STAGE,this._1jz);
      }
      
      public static function _0U_s(param1:*) : String
      {
         if(param1 is String)
         {
            return param1 as String;
         }
         if(param1)
         {
            return _1R_M_._1xD_(param1);
         }
         return _0M_x;
      }
      
      private function _1jz(param1:Event = null) : void
      {
         if(this._O_5.base == null)
         {
            this._O_5.base = parent;
         }
         if(loaderInfo)
         {
            this._0M_L_(loaderInfo);
         }
         removeEventListener(Event.ADDED_TO_STAGE,this._1jz);
         addEventListener(Event.REMOVED_FROM_STAGE,this._j0);
         stage.addEventListener(Event.MOUSE_LEAVE,this._1C_s,false,0,true);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this._0tQ_._32,false,0,true);
         stage.addEventListener(KeyboardEvent.KEY_UP,this._0tQ_._X_W_,false,0,true);
      }
      
      private function _j0(param1:Event = null) : void
      {
         this._O_5.base = null;
         removeEventListener(Event.REMOVED_FROM_STAGE,this._j0);
         addEventListener(Event.ADDED_TO_STAGE,this._1jz);
         stage.removeEventListener(Event.MOUSE_LEAVE,this._1C_s);
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._0tQ_._32);
         stage.removeEventListener(KeyboardEvent.KEY_UP,this._0tQ_._X_W_);
      }
      
      private function _1C_s(param1:Event) : void
      {
         this._um.tooltip(null);
      }
      
      public function _0M_L_(param1:LoaderInfo) : void
      {
         var _loc2_:IEventDispatcher = null;
         try
         {
            _loc2_ = param1["uncaughtErrorEvents"];
            if(_loc2_)
            {
               _loc2_.addEventListener("uncaughtError",this._P_C_,false,0,true);
            }
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      private function _P_C_(param1:Event) : void
      {
         var _loc2_:String = null;
         var _loc3_:* = !!param1.hasOwnProperty("error")?param1["error"]:param1;
         if(_loc3_ is Error)
         {
            _loc2_ = this._5S_.makeString(_loc3_);
         }
         else if(_loc3_ is ErrorEvent)
         {
            _loc2_ = ErrorEvent(_loc3_).text;
         }
         if(!_loc2_)
         {
            _loc2_ = String(_loc3_);
         }
         this.report(_loc2_,FATAL,false);
      }
      
      public function _1H_s(param1:String, param2:Object, param3:String, param4:Number = -1, param5:String = null, param6:Rectangle = null, param7:Boolean = false) : void
      {
         this._0P_W_.add(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function _Q_A_(param1:String, param2:Number = NaN, param3:Number = NaN) : void
      {
         this._0P_W_._1xP_(param1,param2,param3);
      }
      
      public function removeGraph(param1:String, param2:Object = null, param3:String = null) : void
      {
         this._0P_W_.remove(param1,param2,param3);
      }
      
      public function _F_w(param1:_2F_._0p, param2:Function, param3:Array = null) : void
      {
         if(param1)
         {
            this._0tQ_._F_w(param1,param2,param3);
         }
      }
      
      public function _1J_Z_(param1:String, param2:Function, param3:Array = null, param4:String = null) : void
      {
         this.panels.mainPanel._1J_Z_(param1,param2,param3,param4);
      }
      
      public function get displayRoller() : Boolean
      {
         return this._um.displayRoller;
      }
      
      public function set displayRoller(param1:Boolean) : void
      {
         this._um.displayRoller = param1;
      }
      
      public function setRollerCaptureKey(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false) : void
      {
         if(this._12J_)
         {
            this._F_w(this._12J_,null);
            this._12J_ = null;
         }
         if(param1 && param1.length == 1)
         {
            this._12J_ = new _2F_._0p(param1,param2,param3,param4);
            this._F_w(this._12J_,this._1w5);
         }
      }
      
      public function get rollerCaptureKey() : _2F_._0p
      {
         return this._12J_;
      }
      
      private function _1w5() : void
      {
         if(this.displayRoller)
         {
            this.report("Display Roller Capture:<br/>" + _n4(this._um.getPanel(_n4.NAME))._1le(true),-1);
         }
      }
      
      public function get fpsMonitor() : Boolean
      {
         return this._0P_W_.fpsMonitor;
      }
      
      public function set fpsMonitor(param1:Boolean) : void
      {
         this._0P_W_.fpsMonitor = param1;
      }
      
      public function get memoryMonitor() : Boolean
      {
         return this._0P_W_.memoryMonitor;
      }
      
      public function set memoryMonitor(param1:Boolean) : void
      {
         this._0P_W_.memoryMonitor = param1;
      }
      
      public function _M_b(param1:Object, param2:String = null) : String
      {
         return this._0D_E_._M_b(param1,param2);
      }
      
      public function _0S_N_(param1:String) : void
      {
         this._0D_E_._0S_N_(param1);
      }
      
      public function gc() : void
      {
         this._0D_E_.gc();
      }
      
      public function _N_H_(param1:String, param2:Object, param3:Boolean = false) : void
      {
         this._O_5._N_H_(param1,param2,param3);
      }
      
      public function map(param1:DisplayObjectContainer, param2:uint = 0) : void
      {
         this._1T_t.map(param1,param2,_0M_x);
      }
      
      public function mapch(param1:*, param2:DisplayObjectContainer, param3:uint = 0) : void
      {
         this._1T_t.map(param2,param3,_0U_s(param1));
      }
      
      public function inspect(param1:Object, param2:Boolean = true) : void
      {
         this._5S_.inspect(param1,param2,_0M_x);
      }
      
      public function _I_6(param1:*, param2:Object, param3:Boolean = true) : void
      {
         this._5S_.inspect(param2,param3,_0U_s(param1));
      }
      
      public function explode(param1:Object, param2:int = 3) : void
      {
         this._1wt(new Array(this._1T_t.explode(param1,param2)),1,null,false,true);
      }
      
      public function explodech(param1:*, param2:Object, param3:int = 3) : void
      {
         this._1wt(new Array(this._1T_t.explode(param2,param3)),1,param1,false,true);
      }
      
      public function get paused() : Boolean
      {
         return this._0id;
      }
      
      public function set paused(param1:Boolean) : void
      {
         if(this._0id == param1)
         {
            return;
         }
         if(param1)
         {
            this.report("Paused",10);
         }
         else
         {
            this.report("Resumed",-1);
         }
         this._0id = param1;
         this._um.mainPanel._qx(param1);
      }
      
      override public function get width() : Number
      {
         return this._um.mainPanel.width;
      }
      
      override public function set width(param1:Number) : void
      {
         this._um.mainPanel.width = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         this._um.mainPanel.height = param1;
      }
      
      override public function get height() : Number
      {
         return this._um.mainPanel.height;
      }
      
      override public function get x() : Number
      {
         return this._um.mainPanel.x;
      }
      
      override public function set x(param1:Number) : void
      {
         this._um.mainPanel.x = param1;
      }
      
      override public function set y(param1:Number) : void
      {
         this._um.mainPanel.y = param1;
      }
      
      override public function get y() : Number
      {
         return this._um.mainPanel.y;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(param1)
         {
            this._um.mainPanel.visible = true;
         }
      }
      
      private function _1Y_a(param1:Event) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = getTimer();
         var _loc4_:Boolean = this._131.update(_loc3_);
         this._5S_.update(_loc3_);
         this._0D_E_.update();
         if(this.remoter.remoting != _0B_2._1X_3)
         {
            _loc2_ = this._0P_W_.update(!!stage?Number(stage.frameRate):Number(0));
         }
         this._03A_.update();
         if(visible && parent)
         {
            if(this.config._7E_ && parent.getChildAt(parent.numChildren - 1) != this && this._02L_ > 0)
            {
               this._02L_--;
               parent.addChild(this);
               this.report("Moved console on top (alwaysOnTop enabled), " + this._02L_ + " attempts left.",-1);
            }
            this._um.update(this._0id,_loc4_);
            if(_loc2_)
            {
               this._um.updateGraphs(_loc2_);
            }
         }
      }
      
      public function get remoting() : Boolean
      {
         return this._03A_.remoting == _0B_2._0__Y_;
      }
      
      public function set remoting(param1:Boolean) : void
      {
         this._03A_.remoting = !!param1?uint(_0B_2._0__Y_):uint(_0B_2.NONE);
      }
      
      public function remotingSocket(param1:String, param2:int) : void
      {
         this._03A_.remotingSocket(param1,param2);
      }
      
      public function setViewingChannels(... rest) : void
      {
         this._um.mainPanel.setViewingChannels.apply(this,rest);
      }
      
      public function _1iQ_(... rest) : void
      {
         this._um.mainPanel._1iQ_.apply(this,rest);
      }
      
      public function set _mo(param1:uint) : void
      {
         this._um.mainPanel.priority = param1;
      }
      
      public function report(param1:*, param2:int = 0, param3:Boolean = true, param4:String = null) : void
      {
         if(!param4)
         {
            param4 = this._um.mainPanel.reportChannel;
         }
         this._1wt([param1],param2,param4,false,param3,0);
      }
      
      public function _1wt(param1:Array, param2:int = 0, param3:* = null, param4:Boolean = false, param5:Boolean = false, param6:int = -1) : void
      {
         var _loc9_:int = 0;
         var _loc7_:* = "";
         var _loc8_:int = param1.length;
         while(_loc9_ < _loc8_)
         {
            _loc7_ = _loc7_ + ((!!_loc9_?" ":"") + this._5S_.makeString(param1[_loc9_],null,param5));
            _loc9_++;
         }
         if(param2 >= this._config._0O_w && param6 < 0)
         {
            param6 = this._config._1uD_;
         }
         if(!param5 && param6 > 0)
         {
            _loc7_ = _loc7_ + this._1T_t._12h(param6,param2);
         }
         this._131.add(new _1D_7(_loc7_,_0U_s(param3),param2,param4,param5));
      }
      
      public function set commandLine(param1:Boolean) : void
      {
         this._um.mainPanel.commandLine = param1;
      }
      
      public function get commandLine() : Boolean
      {
         return this._um.mainPanel.commandLine;
      }
      
      public function _1tp(param1:String, param2:Function, param3:String = "", param4:Boolean = true, param5:String = ";") : void
      {
         this._O_5._1tp(param1,param2,param3,param4,param5);
      }
      
      public function add(param1:*, param2:int = 2, param3:Boolean = false) : void
      {
         this._1wt([param1],param2,_0M_x,param3);
      }
      
      public function _1Q_E_(param1:*, param2:int = -1, param3:int = 5) : void
      {
         this._1wt([param1],param3,_0M_x,false,false,param2 >= 0?int(param2):int(this._config._1uD_));
      }
      
      public function _cX_(param1:*, param2:*, param3:int = -1, param4:int = 5) : void
      {
         this._1wt([param2],param4,param1,false,false,param3 >= 0?int(param3):int(this._config._1uD_));
      }
      
      public function log(... rest) : void
      {
         this._1wt(rest,_7k);
      }
      
      public function info(... rest) : void
      {
         this._1wt(rest,INFO);
      }
      
      public function debug(... rest) : void
      {
         this._1wt(rest,DEBUG);
      }
      
      public function _0G_b(... rest) : void
      {
         this._1wt(rest,WARN);
      }
      
      public function error(... rest) : void
      {
         this._1wt(rest,ERROR);
      }
      
      public function _1F_e(... rest) : void
      {
         this._1wt(rest,FATAL);
      }
      
      public function ch(param1:*, param2:*, param3:int = 2, param4:Boolean = false) : void
      {
         this._1wt([param2],param3,param1,param4);
      }
      
      public function _po(param1:*, ... rest) : void
      {
         this._1wt(rest,_7k,param1);
      }
      
      public function _qk(param1:*, ... rest) : void
      {
         this._1wt(rest,INFO,param1);
      }
      
      public function _J_u(param1:*, ... rest) : void
      {
         this._1wt(rest,DEBUG,param1);
      }
      
      public function _1C_i(param1:*, ... rest) : void
      {
         this._1wt(rest,WARN,param1);
      }
      
      public function _0ak(param1:*, ... rest) : void
      {
         this._1wt(rest,ERROR,param1);
      }
      
      public function _0J_L_(param1:*, ... rest) : void
      {
         this._1wt(rest,FATAL,param1);
      }
      
      public function _1O_3(param1:*, param2:Array, param3:int = 2, param4:Boolean = false) : void
      {
         this._1wt(param2,param3,param1,param4);
      }
      
      public function _0B_0(... rest) : void
      {
         this._1wt(rest,2,_0M_x,false,this._03D_(rest));
      }
      
      public function _0zz(param1:*, param2:int, ... rest) : void
      {
         this._1wt(rest,param2,param1,false,this._03D_(rest));
      }
      
      private function _03D_(param1:Array) : Boolean
      {
         var args:Array = param1;
         try
         {
            new XML("<p>" + args.join("") + "</p>");
         }
         catch(err:Error)
         {
            return false;
         }
         return true;
      }
      
      public function clear(param1:String = null) : void
      {
         this._131.clear(param1);
         if(!this._0id)
         {
            this._um.mainPanel._0F_1();
         }
         this._um.updateMenu();
      }
      
      public function _hK_(param1:String = "\r\n") : String
      {
         return this._131.getLogsAsString(param1);
      }
      
      public function get config() : _2F_._0__X_
      {
         return this._config;
      }
      
      public function get panels() : _1Y_B_
      {
         return this._um;
      }
      
      public function get cl() : CommandLine
      {
         return this._O_5;
      }
      
      public function get remoter() : _0B_2
      {
         return this._03A_;
      }
      
      public function get graphing() : _0i1
      {
         return this._0P_W_;
      }
      
      public function get refs() : _1R_M_
      {
         return this._5S_;
      }
      
      public function get logs() : _k8
      {
         return this._131;
      }
      
      public function get _G_w() : _0U_M_
      {
         return this._1T_t;
      }
      
      public function get so() : Object
      {
         return this._qn;
      }
      
      public function updateSO(param1:String = null) : void
      {
         if(this._150)
         {
            if(param1)
            {
               this._150.setDirty(param1);
            }
            else
            {
               this._150.clear();
            }
         }
      }
   }
}
