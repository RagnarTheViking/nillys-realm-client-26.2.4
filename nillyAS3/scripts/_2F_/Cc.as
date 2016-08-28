package _2F_
{
   import flash.display.DisplayObjectContainer;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.display.LoaderInfo;
   import flash.geom.Rectangle;
   
   public class Cc
   {
      
      private static var _1Y_t:_2F_.Console;
      
      private static var _config:_2F_._0__X_;
       
      
      public function Cc()
      {
         super();
      }
      
      public static function get config() : _2F_._0__X_
      {
         if(!_config)
         {
            _config = new _2F_._0__X_();
         }
         return _config;
      }
      
      public static function start(param1:DisplayObjectContainer, param2:String = "") : void
      {
         if(_1Y_t)
         {
            if(param1 && !_1Y_t.parent)
            {
               param1.addChild(_1Y_t);
            }
         }
         else
         {
            _1Y_t = new _2F_.Console(param2,config);
            if(param1)
            {
               param1.addChild(_1Y_t);
            }
         }
      }
      
      public static function _1pA_(param1:DisplayObject, param2:String = "") : void
      {
         if(_1Y_t)
         {
            if(param1 && param1.stage && _1Y_t.parent != param1.stage)
            {
               param1.stage.addChild(_1Y_t);
            }
         }
         else if(param1 && param1.stage)
         {
            start(param1.stage,param2);
         }
         else
         {
            _1Y_t = new _2F_.Console(param2,config);
            if(param1)
            {
               param1.addEventListener(Event.ADDED_TO_STAGE,_0K_V_);
            }
         }
      }
      
      public static function add(param1:*, param2:int = 2, param3:Boolean = false) : void
      {
         if(_1Y_t)
         {
            _1Y_t.add(param1,param2,param3);
         }
      }
      
      public static function ch(param1:*, param2:*, param3:int = 2, param4:Boolean = false) : void
      {
         if(_1Y_t)
         {
            _1Y_t.ch(param1,param2,param3,param4);
         }
      }
      
      public static function log(... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t.log.apply(null,rest);
         }
      }
      
      public static function info(... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t.info.apply(null,rest);
         }
      }
      
      public static function debug(... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t.debug.apply(null,rest);
         }
      }
      
      public static function _0G_b(... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t._0G_b.apply(null,rest);
         }
      }
      
      public static function error(... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t.error.apply(null,rest);
         }
      }
      
      public static function _1F_e(... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t._1F_e.apply(null,rest);
         }
      }
      
      public static function _po(param1:*, ... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t._1O_3(param1,rest,_2F_.Console._7k);
         }
      }
      
      public static function _qk(param1:*, ... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t._1O_3(param1,rest,_2F_.Console.INFO);
         }
      }
      
      public static function _J_u(param1:*, ... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t._1O_3(param1,rest,_2F_.Console.DEBUG);
         }
      }
      
      public static function _1C_i(param1:*, ... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t._1O_3(param1,rest,_2F_.Console.WARN);
         }
      }
      
      public static function _0ak(param1:*, ... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t._1O_3(param1,rest,_2F_.Console.ERROR);
         }
      }
      
      public static function _0J_L_(param1:*, ... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t._1O_3(param1,rest,_2F_.Console.FATAL);
         }
      }
      
      public static function _1Q_E_(param1:*, param2:int = -1, param3:int = 5) : void
      {
         if(_1Y_t)
         {
            _1Y_t._1Q_E_(param1,param2,param3);
         }
      }
      
      public static function _cX_(param1:*, param2:*, param3:int = -1, param4:int = 5) : void
      {
         if(_1Y_t)
         {
            _1Y_t._cX_(param1,param2,param3,param4);
         }
      }
      
      public static function inspect(param1:Object, param2:Boolean = true) : void
      {
         if(_1Y_t)
         {
            _1Y_t.inspect(param1,param2);
         }
      }
      
      public static function _I_6(param1:*, param2:Object, param3:Boolean = true) : void
      {
         if(_1Y_t)
         {
            _1Y_t._I_6(param1,param2,param3);
         }
      }
      
      public static function explode(param1:Object, param2:int = 3) : void
      {
         if(_1Y_t)
         {
            _1Y_t.explode(param1,param2);
         }
      }
      
      public static function explodech(param1:*, param2:Object, param3:int = 3) : void
      {
         if(_1Y_t)
         {
            _1Y_t.explodech(param1,param2,param3);
         }
      }
      
      public static function _0B_0(... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t._0B_0.apply(null,rest);
         }
      }
      
      public static function _0zz(param1:*, param2:int, ... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t._0zz.apply(null,new Array(param1,param2).concat(rest));
         }
      }
      
      public static function map(param1:DisplayObjectContainer, param2:uint = 0) : void
      {
         if(_1Y_t)
         {
            _1Y_t.map(param1,param2);
         }
      }
      
      public static function mapch(param1:*, param2:DisplayObjectContainer, param3:uint = 0) : void
      {
         if(_1Y_t)
         {
            _1Y_t.mapch(param1,param2,param3);
         }
      }
      
      public static function clear(param1:String = null) : void
      {
         if(_1Y_t)
         {
            _1Y_t.clear(param1);
         }
      }
      
      public static function _F_w(param1:_0p, param2:Function = null, param3:Array = null) : void
      {
         if(_1Y_t)
         {
            _1Y_t._F_w(param1,param2,param3);
         }
      }
      
      public static function _1J_Z_(param1:String, param2:Function, param3:Array = null, param4:String = null) : void
      {
         if(_1Y_t)
         {
            _1Y_t._1J_Z_(param1,param2,param3,param4);
         }
      }
      
      public static function _0M_L_(param1:LoaderInfo) : void
      {
         if(_1Y_t)
         {
            _1Y_t._0M_L_(param1);
         }
      }
      
      public static function _N_H_(param1:String, param2:Object, param3:Boolean = false) : void
      {
         if(_1Y_t)
         {
            _1Y_t._N_H_(param1,param2,param3);
         }
      }
      
      public static function _1tp(param1:String, param2:Function, param3:String = "", param4:Boolean = true, param5:String = ";") : void
      {
         if(_1Y_t)
         {
            _1Y_t._1tp(param1,param2,param3,param4,param5);
         }
      }
      
      public static function _M_b(param1:Object, param2:String = null) : String
      {
         if(_1Y_t)
         {
            return _1Y_t._M_b(param1,param2);
         }
         return null;
      }
      
      public static function _0S_N_(param1:String) : void
      {
         if(_1Y_t)
         {
            _1Y_t._0S_N_(param1);
         }
      }
      
      public static function _1H_s(param1:String, param2:Object, param3:String, param4:Number = -1, param5:String = null, param6:Rectangle = null, param7:Boolean = false) : void
      {
         if(_1Y_t)
         {
            _1Y_t._1H_s(param1,param2,param3,param4,param5,param6,param7);
         }
      }
      
      public static function _Q_A_(param1:String, param2:Number = NaN, param3:Number = NaN) : void
      {
         if(_1Y_t)
         {
            _1Y_t._Q_A_(param1,param2,param3);
         }
      }
      
      public static function removeGraph(param1:String, param2:Object = null, param3:String = null) : void
      {
         if(_1Y_t)
         {
            _1Y_t.removeGraph(param1,param2,param3);
         }
      }
      
      public static function setViewingChannels(... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t.setViewingChannels.apply(null,rest);
         }
      }
      
      public static function _1iQ_(... rest) : void
      {
         if(_1Y_t)
         {
            _1Y_t._1iQ_.apply(null,rest);
         }
      }
      
      public static function set _mo(param1:uint) : void
      {
         if(_1Y_t)
         {
            _1Y_t._mo = param1;
         }
      }
      
      public static function get width() : Number
      {
         if(_1Y_t)
         {
            return _1Y_t.width;
         }
         return 0;
      }
      
      public static function set width(param1:Number) : void
      {
         if(_1Y_t)
         {
            _1Y_t.width = param1;
         }
      }
      
      public static function get height() : Number
      {
         if(_1Y_t)
         {
            return _1Y_t.height;
         }
         return 0;
      }
      
      public static function set height(param1:Number) : void
      {
         if(_1Y_t)
         {
            _1Y_t.height = param1;
         }
      }
      
      public static function get x() : Number
      {
         if(_1Y_t)
         {
            return _1Y_t.x;
         }
         return 0;
      }
      
      public static function set x(param1:Number) : void
      {
         if(_1Y_t)
         {
            _1Y_t.x = param1;
         }
      }
      
      public static function get y() : Number
      {
         if(_1Y_t)
         {
            return _1Y_t.y;
         }
         return 0;
      }
      
      public static function set y(param1:Number) : void
      {
         if(_1Y_t)
         {
            _1Y_t.y = param1;
         }
      }
      
      public static function get visible() : Boolean
      {
         if(_1Y_t)
         {
            return _1Y_t.visible;
         }
         return false;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         if(_1Y_t)
         {
            _1Y_t.visible = param1;
         }
      }
      
      public static function get fpsMonitor() : Boolean
      {
         if(_1Y_t)
         {
            return _1Y_t.fpsMonitor;
         }
         return false;
      }
      
      public static function set fpsMonitor(param1:Boolean) : void
      {
         if(_1Y_t)
         {
            _1Y_t.fpsMonitor = param1;
         }
      }
      
      public static function get memoryMonitor() : Boolean
      {
         if(_1Y_t)
         {
            return _1Y_t.memoryMonitor;
         }
         return false;
      }
      
      public static function set memoryMonitor(param1:Boolean) : void
      {
         if(_1Y_t)
         {
            _1Y_t.memoryMonitor = param1;
         }
      }
      
      public static function get commandLine() : Boolean
      {
         if(_1Y_t)
         {
            return _1Y_t.commandLine;
         }
         return false;
      }
      
      public static function set commandLine(param1:Boolean) : void
      {
         if(_1Y_t)
         {
            _1Y_t.commandLine = param1;
         }
      }
      
      public static function get displayRoller() : Boolean
      {
         if(_1Y_t)
         {
            return _1Y_t.displayRoller;
         }
         return false;
      }
      
      public static function set displayRoller(param1:Boolean) : void
      {
         if(_1Y_t)
         {
            _1Y_t.displayRoller = param1;
         }
      }
      
      public static function setRollerCaptureKey(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false) : void
      {
         if(_1Y_t)
         {
            _1Y_t.setRollerCaptureKey(param1,param4,param2,param3);
         }
      }
      
      public static function get remoting() : Boolean
      {
         if(_1Y_t)
         {
            return _1Y_t.remoting;
         }
         return false;
      }
      
      public static function set remoting(param1:Boolean) : void
      {
         if(_1Y_t)
         {
            _1Y_t.remoting = param1;
         }
      }
      
      public static function remotingSocket(param1:String, param2:int) : void
      {
         if(_1Y_t)
         {
            _1Y_t.remotingSocket(param1,param2);
         }
      }
      
      public static function remove() : void
      {
         if(_1Y_t)
         {
            if(_1Y_t.parent)
            {
               _1Y_t.parent.removeChild(_1Y_t);
            }
            _1Y_t = null;
         }
      }
      
      public static function _hK_(param1:String = "\r\n") : String
      {
         if(_1Y_t)
         {
            return _1Y_t._hK_(param1);
         }
         return "";
      }
      
      public static function get _0D_t() : _2F_.Console
      {
         return _1Y_t;
      }
      
      private static function _0K_V_(param1:Event) : void
      {
         var _loc2_:DisplayObjectContainer = param1.currentTarget as DisplayObjectContainer;
         _loc2_.removeEventListener(Event.ADDED_TO_STAGE,_0K_V_);
         if(_1Y_t && _1Y_t.parent == null)
         {
            _loc2_.stage.addChild(_1Y_t);
         }
      }
   }
}
