package _0ib
{
   import _1wl._0tL_;
   import _1wl._0v6;
   import flash.utils.ByteArray;
   import flash.events.Event;
   import flash.utils.getQualifiedClassName;
   import flash.display.DisplayObjectContainer;
   import _2F_.Console;
   
   public class CommandLine extends _05E_
   {
      
      private static const _1dp:String = "<b>Advanced CommandLine is disabled.</b>\nEnable by setting `Cc.config.commandLineAllowed = true;´\nType <b>/commands</b> for permitted commands.";
      
      private static const _0A_2:Array = [Executer._0I_5,"base","C"];
       
      
      private var _S_e:_0tL_;
      
      private var _1c8;
      
      private var _0O_d:_0v6;
      
      private var _0fD_:String = "";
      
      private var _14y:Object;
      
      public var _0fn:Array;
      
      public function CommandLine(param1:Console)
      {
         var m:Console = param1;
         this._0fn = new Array("filter","filterexp");
         super(m);
         this._S_e = new _0tL_();
         this._1c8 = m;
         this._14y = new Object();
         this._0O_d = new _0v6(m);
         this._S_e._set("C",m);
         remoter.registerCallback("cmd",function(param1:ByteArray):void
         {
            run(param1.readUTF());
         });
         remoter.registerCallback("scope",function(param1:ByteArray):void
         {
            handleScopeEvent(param1.readUnsignedInt());
         });
         remoter.registerCallback("cls",this._1tN_);
         remoter.addEventListener(Event.CONNECT,this._zU_);
         this.addCLCmd("help",this._0C_x,"How to use command line");
         this.addCLCmd("save|store",this._039,"Save current scope as weak reference. (same as Cc.store(...))");
         this.addCLCmd("savestrong|storestrong",this._10q,"Save current scope as strong reference");
         this.addCLCmd("saved|stored",this._1e,"Show a list of all saved references");
         this.addCLCmd("string",this._1V_E_,"Create String, useful to paste complex strings without worrying about \" or \'",false,null);
         this.addCLCmd("commands",this._5r,"Show a list of all slash commands",true);
         this.addCLCmd("inspect",this._M_9,"Inspect current scope");
         this.addCLCmd("explode",this._V_V_,"Explode current scope to its properties and values (similar to JSON)");
         this.addCLCmd("map",this._0b3,"Get display list map starting from current scope");
         this.addCLCmd("function",this._S_Y_,"Create function. param is the commandline string to create as function. (experimental)");
         this.addCLCmd("autoscope",this._03h,"Toggle autoscoping.");
         this.addCLCmd("base",this._0B_I_,"Return to base scope");
         this.addCLCmd("/",this._0w,"Return to previous scope");
      }
      
      public function set base(param1:Object) : void
      {
         if(this.base)
         {
            report("Set new commandLine base from " + this.base + " to " + param1,10);
         }
         else
         {
            this._0O_d._1G_a = this._1c8;
            this._1c8 = param1;
            this._0fD_ = _1R_M_._1xD_(param1,false);
         }
         this._S_e._set("base",param1);
      }
      
      public function get base() : Object
      {
         return this._S_e._get("base");
      }
      
      public function _1tN_(param1:ByteArray) : void
      {
         this._0fD_ = param1.readUTF();
      }
      
      public function handleScopeEvent(param1:uint) : void
      {
         var _loc2_:ByteArray = null;
         var _loc3_:* = undefined;
         if(remoter.remoting == _0B_2._1X_3)
         {
            _loc2_ = new ByteArray();
            _loc2_.writeUnsignedInt(param1);
            remoter.send("scope",_loc2_);
         }
         else
         {
            _loc3_ = console.refs.getRefById(param1);
            if(_loc3_)
            {
               console.cl.setReturned(_loc3_,true,false);
            }
            else
            {
               console.report("Reference no longer exist.",-2);
            }
         }
      }
      
      public function _N_H_(param1:String, param2:Object, param3:Boolean = false) : void
      {
         if(!param1)
         {
            report("ERROR: Give a name to save.",10);
            return;
         }
         if(param2 is Function)
         {
            param3 = true;
         }
         param1 = param1.replace(/[^\w]*/g,"");
         if(_0A_2.indexOf(param1) >= 0)
         {
            report("ERROR: The name [" + param1 + "] is reserved",10);
            return;
         }
         this._S_e._set(param1,param2,param3);
      }
      
      public function getHintsFor(param1:String, param2:uint) : Array
      {
         var X:String = null;
         var canadate:Array = null;
         var cmd:Object = null;
         var Y:String = null;
         var str:String = param1;
         var max:uint = param2;
         var all:Array = new Array();
         for(X in this._14y)
         {
            cmd = this._14y[X];
            if(config.commandLineAllowed || cmd.allow)
            {
               all.push(["/" + X + " ",!!cmd.d?cmd.d:null]);
            }
         }
         if(config.commandLineAllowed)
         {
            for(Y in this._S_e)
            {
               all.push(["$" + Y,_1R_M_._1xD_(this._S_e._get(Y))]);
            }
            if(this._1c8)
            {
               all.push(["this",_1R_M_._1xD_(this._1c8)]);
               all = all.concat(console.refs.getPossibleCalls(this._1c8));
            }
         }
         str = str.toLowerCase();
         var hints:Array = new Array();
         for each(canadate in all)
         {
            if(canadate[0].toLowerCase().indexOf(str) == 0)
            {
               hints.push(canadate);
            }
         }
         hints = hints.sort(function(param1:Array, param2:Array):int
         {
            if(param1[0].length < param2[0].length)
            {
               return -1;
            }
            if(param1[0].length > param2[0].length)
            {
               return 1;
            }
            return 0;
         });
         if(max > 0 && hints.length > max)
         {
            hints.splice(max);
            hints.push(["..."]);
         }
         return hints;
      }
      
      public function get scopeString() : String
      {
         return !!config.commandLineAllowed?this._0fD_:"";
      }
      
      public function addCLCmd(param1:String, param2:Function, param3:String, param4:Boolean = false, param5:String = ";") : void
      {
         var _loc7_:int = 0;
         var _loc6_:Array = param1.split("|");
         while(_loc7_ < _loc6_.length)
         {
            param1 = _loc6_[_loc7_];
            this._14y[param1] = new SlashCommand(param1,param2,param3,false,param4,param5);
            if(_loc7_ > 0)
            {
               this._14y.setPropertyIsEnumerable(param1,false);
            }
            _loc7_++;
         }
      }
      
      public function _1tp(param1:String, param2:Function, param3:String = "", param4:Boolean = true, param5:String = ";") : void
      {
         var _loc6_:SlashCommand = null;
         param1 = param1.replace(/[^\w]*/g,"");
         if(this._14y[param1] != null)
         {
            _loc6_ = this._14y[param1];
            if(!_loc6_.user)
            {
               throw new Error("Can not alter build-in slash command [" + param1 + "]");
            }
         }
         if(param2 == null)
         {
            delete this._14y[param1];
         }
         else
         {
            this._14y[param1] = new SlashCommand(param1,param2,_1R_M_._0B_m(param3),true,param4,param5);
         }
      }
      
      public function run(param1:String, param2:Object = null) : *
      {
         var bytes:ByteArray = null;
         var exe:Executer = null;
         var X:String = null;
         var str:String = param1;
         var saves:Object = param2;
         if(!str)
         {
            return;
         }
         str = str.replace(/\s*/,"");
         if(remoter.remoting == _0B_2._1X_3)
         {
            if(str.charAt(0) == "~")
            {
               str = str.substring(1);
            }
            else if(str.search(new RegExp("/" + this._0fn.join("|/"))) != 0)
            {
               report("Run command at remote: " + str,-2);
               bytes = new ByteArray();
               bytes.writeUTF(str);
               if(!console.remoter.send("cmd",bytes))
               {
                  report("Command could not be sent to client.",10);
               }
               return null;
            }
         }
         report("&gt; " + str,4,false);
         var v:* = null;
         try
         {
            if(str.charAt(0) == "/")
            {
               this._0L_e(str.substring(1));
            }
            else
            {
               if(!config.commandLineAllowed)
               {
                  report(_1dp,9);
                  return null;
               }
               exe = new Executer();
               exe.addEventListener(Event.COMPLETE,this._0J_A_,false,0,true);
               if(saves)
               {
                  for(X in this._S_e)
                  {
                     if(!saves[X])
                     {
                        saves[X] = this._S_e[X];
                     }
                  }
               }
               else
               {
                  saves = this._S_e;
               }
               exe._1gp(saves);
               exe._0zV_(_0A_2);
               exe._1A_5 = config.commandLineAutoScope;
               v = exe.exec(this._1c8,str);
            }
         }
         catch(e:Error)
         {
            reportError(e);
         }
         return v;
      }
      
      private function _0J_A_(param1:Event) : void
      {
         var _loc2_:Executer = param1.currentTarget as Executer;
         if(this._1c8 == _loc2_.scope)
         {
            this.setReturned(_loc2_.returned);
         }
         else if(_loc2_.scope == _loc2_.returned)
         {
            this.setReturned(_loc2_.scope,true);
         }
         else
         {
            this.setReturned(_loc2_.returned);
            this.setReturned(_loc2_.scope,true);
         }
      }
      
      private function _0L_e(param1:String) : void
      {
         var slashcmd:SlashCommand = null;
         var restStr:String = null;
         var endInd:int = 0;
         var str:String = param1;
         var brk:int = str.search(/[^\w]/);
         var cmd:String = str.substring(0,brk > 0?Number(brk):Number(str.length));
         if(cmd == "")
         {
            this.setReturned(this._S_e._get(Executer._0I_5),true);
            return;
         }
         var param:String = brk > 0?str.substring(brk + 1):"";
         if(this._14y[cmd] != null)
         {
            try
            {
               slashcmd = this._14y[cmd];
               if(!config.commandLineAllowed && !slashcmd.allow)
               {
                  report(_1dp,9);
                  return;
               }
               if(slashcmd.endMarker)
               {
                  endInd = param.indexOf(slashcmd.endMarker);
                  if(endInd >= 0)
                  {
                     restStr = param.substring(endInd + slashcmd.endMarker.length);
                     param = param.substring(0,endInd);
                  }
               }
               if(param.length == 0)
               {
                  slashcmd.f();
               }
               else
               {
                  slashcmd.f(param);
               }
               if(restStr)
               {
                  this.run(restStr);
               }
            }
            catch(err:Error)
            {
               reportError(err);
            }
         }
         else
         {
            report("Undefined command <b>/commands</b> for list of all commands.",10);
         }
      }
      
      public function setReturned(param1:*, param2:Boolean = false, param3:Boolean = true) : void
      {
         if(!config.commandLineAllowed)
         {
            report(_1dp,9);
            return;
         }
         if(param1 !== undefined)
         {
            this._S_e._set(Executer._0I_5,param1,true);
            if(param2 && param1 !== this._1c8)
            {
               this._0O_d._1G_a = this._1c8;
               this._1c8 = param1;
               if(remoter.remoting != _0B_2._1X_3)
               {
                  this._0fD_ = _1R_M_._1xD_(this._1c8,false);
                  this._zU_();
               }
               report("Changed to " + console.refs.makeRefTyped(param1),-1);
            }
            else if(param3)
            {
               report("Returned " + console.refs.makeString(param1),-1);
            }
         }
         else if(param3)
         {
            report("Exec successful, undefined return.",-1);
         }
      }
      
      public function _zU_(param1:Event = null) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(this._0fD_);
         console.remoter.send("cls",_loc2_);
      }
      
      private function reportError(param1:Error) : void
      {
         var _loc2_:String = null;
         var _loc6_:int = 0;
         var _loc10_:int = 0;
         var _loc3_:String = console.refs.makeString(param1);
         var _loc4_:Array = _loc3_.split(/\n\s*/);
         var _loc5_:int = 10;
         var _loc7_:int = _loc4_.length;
         var _loc8_:Array = [];
         var _loc9_:RegExp = new RegExp("\\s*at\\s+(" + Executer._W_j + "|" + getQualifiedClassName(this) + ")");
         while(_loc10_ < _loc7_)
         {
            _loc2_ = _loc4_[_loc10_];
            if(_loc2_.search(_loc9_) == 0)
            {
               if(_loc6_ > 0 && _loc10_ > 0)
               {
                  break;
               }
               _loc6_++;
            }
            _loc8_.push("<p" + _loc5_ + "> " + _loc2_ + "</p" + _loc5_ + ">");
            if(_loc5_ > 6)
            {
               _loc5_--;
            }
            _loc10_++;
         }
         report(_loc8_.join("\n"),9);
      }
      
      private function _039(param1:String = null) : void
      {
         this._N_H_(param1,this._1c8,false);
      }
      
      private function _10q(param1:String = null) : void
      {
         this._N_H_(param1,this._1c8,true);
      }
      
      private function _1e(... rest) : void
      {
         var _loc2_:* = null;
         var _loc3_:_0v6 = null;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         report("Saved vars: ",-1);
         for(_loc2_ in this._S_e)
         {
            _loc3_ = this._S_e._0lq(_loc2_);
            _loc4_++;
            if(_loc3_._1G_a == null)
            {
               _loc5_++;
            }
            report((!!_loc3_.strong?"strong":"weak") + " <b>$" + _loc2_ + "</b> = " + console.refs.makeString(_loc3_._1G_a),-2);
         }
         report("Found " + _loc4_ + " item(s), " + _loc5_ + " empty.",-1);
      }
      
      private function _1V_E_(param1:String) : void
      {
         report("String with " + param1.length + " chars entered. Use /save <i>(name)</i> to save.",-2);
         this.setReturned(param1,true);
      }
      
      private function _5r(... rest) : void
      {
         var _loc2_:SlashCommand = null;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         for each(_loc2_ in this._14y)
         {
            if(config.commandLineAllowed || _loc2_.allow)
            {
               if(_loc2_.user)
               {
                  _loc4_.push(_loc2_);
               }
               else
               {
                  _loc3_.push(_loc2_);
               }
            }
         }
         _loc3_ = _loc3_.sortOn("n");
         report("Built-in commands:" + (!!config.commandLineAllowed?"":" (limited permission)"),4);
         for each(_loc2_ in _loc3_)
         {
            report("<b>/" + _loc2_.n + "</b> <p-1>" + _loc2_.d + "</p-1>",-2);
         }
         if(_loc4_.length)
         {
            _loc4_ = _loc4_.sortOn("n");
            report("User commands:",4);
            for each(_loc2_ in _loc4_)
            {
               report("<b>/" + _loc2_.n + "</b> <p-1>" + _loc2_.d + "</p-1>",-2);
            }
         }
      }
      
      private function _M_9(... rest) : void
      {
         console.refs.focus(this._1c8);
      }
      
      private function _V_V_(param1:String = "0") : void
      {
         var _loc2_:int = int(param1);
         console.explodech(console.panels.mainPanel.reportChannel,this._1c8,_loc2_ <= 0?3:int(_loc2_));
      }
      
      private function _0b3(param1:String = "0") : void
      {
         console.mapch(console.panels.mainPanel.reportChannel,this._1c8 as DisplayObjectContainer,int(param1));
      }
      
      private function _S_Y_(param1:String = "") : void
      {
         var _loc2_:FakeFunction = new FakeFunction(this.run,param1);
         report("Function created. Use /savestrong <i>(name)</i> to save.",-2);
         this.setReturned(_loc2_.exec,true);
      }
      
      private function _03h(... rest) : void
      {
         config.commandLineAutoScope = !config.commandLineAutoScope;
         report("Auto-scoping <b>" + (!!config.commandLineAutoScope?"enabled":"disabled") + "</b>.",10);
      }
      
      private function _0B_I_(... rest) : void
      {
         this.setReturned(this.base,true);
      }
      
      private function _0w(... rest) : void
      {
         this.setReturned(this._0O_d._1G_a,true);
      }
      
      private function _0C_x(... rest) : void
      {
         report("____Command Line Help___",10);
         report("/filter (text) = filter/search logs for matching text",5);
         report("/commands to see all slash commands",5);
         report("Press up/down arrow keys to recall previous line",2);
         report("__Examples:",10);
         report("<b>stage.stageWidth</b>",5);
         report("<b>stage.scaleMode = flash.display.StageScaleMode.NO_SCALE</b>",5);
         report("<b>stage.frameRate = 12</b>",5);
         report("__________",10);
      }
   }
}

class FakeFunction
{
    
   
   private var line:String;
   
   private var run:Function;
   
   function FakeFunction(param1:Function, param2:String)
   {
      super();
      this.run = param1;
      this.line = param2;
   }
   
   public function exec(... rest) : *
   {
      return this.run(this.line,rest);
   }
}

class SlashCommand
{
    
   
   public var n:String;
   
   public var f:Function;
   
   public var d:String;
   
   public var user:Boolean;
   
   public var allow:Boolean;
   
   public var endMarker:String;
   
   function SlashCommand(param1:String, param2:Function, param3:String, param4:Boolean, param5:Boolean, param6:String)
   {
      super();
      this.n = param1;
      this.f = param2;
      this.d = !!param3?param3:"";
      this.user = param4;
      this.allow = param5;
      this.endMarker = param6;
   }
}
