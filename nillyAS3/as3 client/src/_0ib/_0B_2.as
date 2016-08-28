package _0ib
{
   import flash.net.LocalConnection;
   import flash.net.Socket;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.events.StatusEvent;
   import flash.events.AsyncErrorEvent;
   import flash.system.Security;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.ProgressEvent;
   import _2F_.Console;
   
   public class _0B_2 extends _05E_
   {
      
      public static const NONE:uint = 0;
      
      public static const _0__Y_:uint = 1;
      
      public static const _1X_3:uint = 2;
       
      
      private var _callbacks:Object;
      
      private var _mode:uint;
      
      private var _1e9:LocalConnection;
      
      private var _G_t:Socket;
      
      private var _rr:ByteArray;
      
      private var _1xM_:Object;
      
      private var _0jc:Dictionary;
      
      private var _0R_9:String = "";
      
      private var _0d6:Boolean;
      
      private var _1E_D_:String;
      
      private var _1J_k:String;
      
      public function _0B_2(param1:Console)
      {
         var m:Console = param1;
         this._callbacks = new Object();
         this._rr = new ByteArray();
         this._1xM_ = new Object();
         this._0jc = new Dictionary();
         super(m);
         this.registerCallback("login",function(param1:ByteArray):void
         {
            login(param1.readUTF());
         });
         this.registerCallback("requestLogin",this.requestLogin);
         this.registerCallback("loginFail",this.loginFail);
         this.registerCallback("loginSuccess",this.loginSuccess);
      }
      
      public function update() : void
      {
         var _loc1_:* = null;
         var _loc2_:ByteArray = null;
         var _loc3_:String = null;
         var _loc4_:ByteArray = null;
         if(this._rr.length)
         {
            if(this._G_t && this._G_t.connected)
            {
               this._G_t.writeBytes(this._rr);
               this._rr = new ByteArray();
            }
            else if(this._1e9)
            {
               this._rr.position = 0;
               if(this._rr.bytesAvailable < 38000)
               {
                  _loc2_ = this._rr;
                  this._rr = new ByteArray();
               }
               else
               {
                  _loc2_ = new ByteArray();
                  this._rr.readBytes(_loc2_,0,Math.min(38000,this._rr.bytesAvailable));
                  _loc4_ = new ByteArray();
                  this._rr.readBytes(_loc4_);
                  this._rr = _loc4_;
               }
               _loc3_ = config.remotingConnectionName + (this.remoting == _1X_3?_0__Y_:_1X_3);
               this._1e9.send(_loc3_,"synchronize",this._1E_D_,_loc2_);
            }
            else
            {
               this._rr = new ByteArray();
            }
         }
         for(_loc1_ in this._1xM_)
         {
            this._1gu(_loc1_);
         }
      }
      
      private function _1gu(param1:String) : void
      {
         var pointer:uint = 0;
         var cmd:String = null;
         var arg:ByteArray = null;
         var callbackData:Object = null;
         var blen:uint = 0;
         var recbuffer:ByteArray = null;
         var _local3:* = undefined;
         var id:String = param1;
         if(!this._0jc[id])
         {
            this._0jc[id] = true;
            if(this._1J_k)
            {
               report("Remote switched to new sender [" + id + "] as primary.",-2);
            }
            this._1J_k = id;
         }
         var buffer:ByteArray = this._1xM_[id];
         try
         {
            pointer = buffer.position = 0;
            while(buffer.bytesAvailable)
            {
               cmd = buffer.readUTF();
               arg = null;
               if(buffer.bytesAvailable == 0)
               {
                  break;
               }
               if(buffer.readBoolean())
               {
                  if(buffer.bytesAvailable == 0)
                  {
                     break;
                  }
                  blen = buffer.readUnsignedInt();
                  if(buffer.bytesAvailable < blen)
                  {
                     break;
                  }
                  arg = new ByteArray();
                  buffer.readBytes(arg,0,blen);
               }
               callbackData = this._callbacks[cmd];
               if(!callbackData.latest || id == this._1J_k)
               {
                  if(arg)
                  {
                     callbackData.fun(arg);
                  }
                  else
                  {
                     callbackData.fun();
                  }
               }
               pointer = buffer.position;
            }
            if(pointer < buffer.length)
            {
               recbuffer = new ByteArray();
               recbuffer.writeBytes(buffer,pointer);
               _local3 = recbuffer;
               buffer = _local3;
               this._1xM_[id] = _local3;
            }
            else
            {
               delete this._1xM_[id];
            }
            return;
         }
         catch(err:Error)
         {
            report("Remoting sync error: " + err,9);
            return;
         }
      }
      
      private function synchronize(param1:String, param2:Object) : void
      {
         if(!(param2 is ByteArray))
         {
            report("Remoting sync error. Recieved non-ByteArray:" + param2,9);
            return;
         }
         var _loc3_:ByteArray = param2 as ByteArray;
         var _loc4_:ByteArray = this._1xM_[param1];
         if(_loc4_)
         {
            _loc4_.position = _loc4_.length;
            _loc4_.writeBytes(_loc3_);
         }
         else
         {
            this._1xM_[param1] = _loc3_;
         }
      }
      
      public function send(param1:String, param2:ByteArray = null) : Boolean
      {
         if(this._mode == NONE)
         {
            return false;
         }
         this._rr.position = this._rr.length;
         this._rr.writeUTF(param1);
         if(param2)
         {
            this._rr.writeBoolean(true);
            this._rr.writeUnsignedInt(param2.length);
            this._rr.writeBytes(param2);
         }
         else
         {
            this._rr.writeBoolean(false);
         }
         return true;
      }
      
      public function get remoting() : uint
      {
         return this._mode;
      }
      
      public function get canSend() : Boolean
      {
         return this._mode == _0__Y_ && this._0d6;
      }
      
      public function set remoting(param1:uint) : void
      {
         var _loc2_:String = null;
         if(param1 == this._mode)
         {
            return;
         }
         this._1E_D_ = this._1nR_();
         if(param1 == _0__Y_)
         {
            if(!this._l0(_0__Y_))
            {
               report("Could not create remoting client service. You will not be able to control this console with remote.",10);
            }
            this._rr = new ByteArray();
            this._1e9.addEventListener(StatusEvent.STATUS,this._X_i,false,0,true);
            report("<b>Remoting started.</b> " + this._0D___(),-1);
            this._0d6 = this._1M_5("");
            if(this._0d6)
            {
               this._1T_u();
            }
            else
            {
               this.send("requestLogin");
            }
         }
         else if(param1 == _1X_3)
         {
            if(this._l0(_1X_3))
            {
               this._rr = new ByteArray();
               this._1e9.addEventListener(AsyncErrorEvent.ASYNC_ERROR,this._1cn,false,0,true);
               this._1e9.addEventListener(StatusEvent.STATUS,this._0Z_N_,false,0,true);
               report("<b>Remote started.</b> " + this._0D___(),-1);
               _loc2_ = Security.sandboxType;
               if(_loc2_ == Security.LOCAL_WITH_FILE || _loc2_ == Security.LOCAL_WITH_NETWORK)
               {
                  report("Untrusted local sandbox. You may not be able to listen for logs properly.",10);
                  this._0T_D_();
               }
               this.login(this._0R_9);
            }
            else
            {
               report("Could not create remote service. You might have a console remote already running.",10);
            }
         }
         else
         {
            this.close();
         }
         console.panels.updateMenu();
      }
      
      public function remotingSocket(param1:String, param2:int = 0) : void
      {
         if(this._G_t && this._G_t.connected)
         {
            this._G_t.close();
            this._G_t = null;
         }
         if(param1 && param2)
         {
            this.remoting = _0__Y_;
            report("Connecting to socket " + param1 + ":" + param2);
            this._G_t = new Socket();
            this._G_t.addEventListener(Event.CLOSE,this._1t9);
            this._G_t.addEventListener(Event.CONNECT,this._41);
            this._G_t.addEventListener(IOErrorEvent.IO_ERROR,this._Q_R_);
            this._G_t.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this._J_B_);
            this._G_t.addEventListener(ProgressEvent.SOCKET_DATA,this._L_n);
            this._G_t.connect(param1,param2);
         }
      }
      
      private function _1t9(param1:Event) : void
      {
         if(param1.currentTarget == this._G_t)
         {
            this._G_t = null;
         }
      }
      
      private function _41(param1:Event) : void
      {
         report("Remoting socket connected.",-1);
         this._rr = new ByteArray();
         if(this._0d6 || this._1M_5(""))
         {
            this._1T_u();
         }
         else
         {
            this.send("requestLogin");
         }
      }
      
      private function _Q_R_(param1:Event) : void
      {
         report("Remoting socket error." + param1,9);
         this.remotingSocket(null);
      }
      
      private function _J_B_(param1:Event) : void
      {
         report("Remoting security error." + param1,9);
         this.remotingSocket(null);
      }
      
      private function _L_n(param1:Event) : void
      {
         this._hM_(param1.currentTarget as Socket);
      }
      
      public function _hM_(param1:Socket) : void
      {
         if(!this._0jc[param1])
         {
            this._0jc[param1] = this._1nR_();
            this._G_t = param1;
         }
         var _loc2_:ByteArray = new ByteArray();
         param1.readBytes(_loc2_);
         this.synchronize(this._0jc[param1],_loc2_);
      }
      
      private function _X_i(param1:StatusEvent) : void
      {
         if(param1.level == "error" && !(this._G_t && this._G_t.connected))
         {
            this._0d6 = false;
         }
      }
      
      private function _0Z_N_(param1:StatusEvent) : void
      {
         if(this.remoting == _1X_3 && param1.level == "error")
         {
            report("Problem communicating to client.",10);
         }
      }
      
      private function _kq(param1:SecurityErrorEvent) : void
      {
         report("Remoting security error.",9);
         this._0T_D_();
      }
      
      private function _1cn(param1:AsyncErrorEvent) : void
      {
         report("Problem with remote sync. [<a href=\'event:remote\'>Click here</a>] to restart.",10);
         this.remoting = NONE;
      }
      
      private function _0D___() : String
      {
         return "<p4>channel:" + config.remotingConnectionName + " (" + Security.sandboxType + ")</p4>";
      }
      
      private function _0T_D_() : void
      {
         report("Make sure your flash file is \'trusted\' in Global Security Settings.",-2);
         report("Go to Settings Manager [<a href=\'event:settings\'>click here</a>] &gt; \'Global Security Settings Panel\' (on left) &gt; add the location of the local flash (swf) file.",-2);
      }
      
      private function _1nR_() : String
      {
         return new Date().time + "." + Math.floor(Math.random() * 100000);
      }
      
      private function _l0(param1:uint) : Boolean
      {
         var targetmode:uint = param1;
         this.close();
         this._mode = targetmode;
         this._1e9 = new LocalConnection();
         this._1e9.client = {"synchronize":this.synchronize};
         if(config.allowedRemoteDomain)
         {
            this._1e9.allowDomain(config.allowedRemoteDomain);
            this._1e9.allowInsecureDomain(config.allowedRemoteDomain);
         }
         this._1e9.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this._kq,false,0,true);
         try
         {
            this._1e9.connect(config.remotingConnectionName + this._mode);
         }
         catch(err:Error)
         {
            return false;
         }
         return true;
      }
      
      public function registerCallback(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._callbacks[param1] = {
            "fun":param2,
            "latest":param3
         };
      }
      
      private function loginFail() : void
      {
         if(this.remoting != _1X_3)
         {
            return;
         }
         report("Login Failed",10);
         console.panels.mainPanel.requestLogin();
      }
      
      private function _1T_u() : void
      {
         this._0d6 = true;
         this.send("loginSuccess");
         dispatchEvent(new Event(Event.CONNECT));
      }
      
      private function loginSuccess() : void
      {
         console.setViewingChannels();
         report("Login Successful",-1);
      }
      
      private function requestLogin() : void
      {
         if(this.remoting != _1X_3)
         {
            return;
         }
         this._rr = new ByteArray();
         if(this._0R_9)
         {
            this.login(this._0R_9);
         }
         else
         {
            console.panels.mainPanel.requestLogin();
         }
      }
      
      public function login(param1:String = "") : void
      {
         var _loc2_:ByteArray = null;
         if(this.remoting == _1X_3)
         {
            this._0R_9 = param1;
            report("Attempting to login...",-1);
            _loc2_ = new ByteArray();
            _loc2_.writeUTF(param1);
            this.send("login",_loc2_);
         }
         else if(this._0d6 || this._1M_5(param1))
         {
            this._1T_u();
         }
         else
         {
            this.send("loginFail");
         }
      }
      
      private function _1M_5(param1:String) : Boolean
      {
         return config.remotingPassword === null && config.keystrokePassword == param1 || config.remotingPassword === "" || config.remotingPassword == param1;
      }
      
      public function close() : void
      {
         if(this._1e9)
         {
            try
            {
               this._1e9.close();
            }
            catch(error:Error)
            {
               report("Remote.close: " + error,10);
            }
         }
         this._mode = NONE;
         this._rr = new ByteArray();
         this._1e9 = null;
      }
   }
}
