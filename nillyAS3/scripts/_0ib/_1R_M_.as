package _0ib
{
   import flash.utils.getQualifiedClassName;
   import _1wl._0tL_;
   import flash.utils.Dictionary;
   import flash.utils.ByteArray;
   import flash.geom.Rectangle;
   import flash.geom.Point;
   import flash.geom.Matrix;
   import flash.events.Event;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import _2F_.Console;
   
   public class _1R_M_ extends _05E_
   {
      
      public static const _0yJ_:String = "⌂";
       
      
      private var _1M_Q_:_0tL_;
      
      private var _07G_:Dictionary;
      
      private var _1xm:uint = 1;
      
      private var _H_l:Boolean;
      
      private var _0gr;
      
      private var _kE_:Array;
      
      private var _H_k:uint;
      
      private var _0uH_:Array;
      
      private var _I_x:Array;
      
      private var _0de:uint;
      
      public function _1R_M_(param1:Console)
      {
         var console:Console = param1;
         this._1M_Q_ = new _0tL_();
         this._07G_ = new Dictionary(true);
         this._0uH_ = new Array();
         this._I_x = new Array();
         super(console);
         remoter.registerCallback("ref",function(param1:ByteArray):void
         {
            handleString(param1.readUTF());
         });
         remoter.registerCallback("focus",this._0zu);
      }
      
      public static function _0B_m(param1:String) : String
      {
         return param1.replace(/</g,"&lt;").replace(/\>/g,"&gt;").replace(/\x00/g,"");
      }
      
      public static function _1xD_(param1:Object, param2:Boolean = true) : String
      {
         var _loc3_:String = getQualifiedClassName(param1);
         var _loc4_:int = _loc3_.indexOf("::");
         var _loc5_:String = param1 is Class?"*":"";
         _loc3_ = _loc5_ + _loc3_.substring(_loc4_ >= 0?Number(_loc4_ + 2):Number(0)) + _loc5_;
         if(param2)
         {
            return _0B_m(_loc3_);
         }
         return _loc3_;
      }
      
      public function update(param1:uint) : void
      {
         if(this._I_x.length || this._0uH_.length)
         {
            if(param1 > this._0de + config.objectHardReferenceTimer * 1000)
            {
               this._0uH_ = this._I_x;
               this._I_x = new Array();
               this._0de = param1;
            }
         }
      }
      
      public function setLogRef(param1:*) : uint
      {
         var _loc2_:int = 0;
         if(!config.useObjectLinking)
         {
            return 0;
         }
         var _loc3_:uint = this._07G_[param1];
         if(!_loc3_)
         {
            _loc3_ = this._1xm;
            this._1M_Q_[_loc3_] = param1;
            this._07G_[param1] = _loc3_;
            if(config.objectHardReferenceTimer)
            {
               this._I_x.push(param1);
            }
            this._1xm++;
            _loc2_ = _loc3_ - 50;
            while(_loc2_ >= 0)
            {
               if(this._1M_Q_[_loc2_] === null)
               {
                  delete this._1M_Q_[_loc2_];
               }
               _loc2_ = _loc2_ - 50;
            }
         }
         return _loc3_;
      }
      
      public function _1nj(param1:*) : uint
      {
         return this._07G_[param1];
      }
      
      public function getRefById(param1:uint) : *
      {
         return this._1M_Q_[param1];
      }
      
      public function makeString(param1:*, param2:* = null, param3:Boolean = false, param4:int = -1) : String
      {
         var txt:String = null;
         var err:Error = null;
         var stackstr:String = null;
         var str:String = null;
         var len:int = 0;
         var hasmaxlen:Boolean = false;
         var i:int = 0;
         var strpart:String = null;
         var add:String = null;
         var o:* = param1;
         var prop:* = param2;
         var html:Boolean = param3;
         var maxlen:int = param4;
         var v:* = undefined;
         try
         {
            v = !!prop?o[prop]:o;
         }
         catch(err:Error)
         {
            return "<p0><i>" + err.toString() + "</i></p0>";
         }
         if(v is Error)
         {
            err = v as Error;
            stackstr = !!err.hasOwnProperty("getStackTrace")?err.getStackTrace():err.toString();
            if(stackstr)
            {
               return stackstr;
            }
            return err.toString();
         }
         if(v is XML || v is XMLList)
         {
            return this._0M_T_(_0B_m(v.toXMLString()),maxlen,o,prop);
         }
         if(v is QName)
         {
            return String(v);
         }
         if(v is Array || getQualifiedClassName(v).indexOf("__AS3__.vec::Vector.") == 0)
         {
            str = "[";
            len = v.length;
            hasmaxlen = maxlen >= 0;
            i = 0;
            while(i < len)
            {
               strpart = this.makeString(v[i],null,false,maxlen);
               str = str + ((!!i?", ":"") + strpart);
               maxlen = maxlen - strpart.length;
               if(hasmaxlen && maxlen <= 0 && i < len - 1)
               {
                  str = str + (", " + this._1bN_(o,prop,"..."));
                  break;
               }
               i = i + 1;
            }
            return str + "]";
         }
         if(config.useObjectLinking && v && typeof v == "object")
         {
            add = "";
            if(v is ByteArray)
            {
               add = " position:" + v.position + " length:" + v.length;
            }
            else if(v is Date || v is Rectangle || v is Point || v is Matrix || v is Event)
            {
               add = " " + String(v);
            }
            else if(v is DisplayObject && v.name)
            {
               add = " " + v.name;
            }
            txt = "{" + this._1bN_(o,prop,_1xD_(v)) + _0B_m(add) + "}";
         }
         else
         {
            if(v is ByteArray)
            {
               txt = "[ByteArray position:" + ByteArray(v).position + " length:" + ByteArray(v).length + "]";
            }
            else
            {
               txt = String(v);
            }
            if(!html)
            {
               return this._0M_T_(_0B_m(txt),maxlen,o,prop);
            }
         }
         return txt;
      }
      
      public function makeRefTyped(param1:*) : String
      {
         if(param1 && typeof param1 == "object" && !(param1 is QName))
         {
            return "{" + this._1bN_(param1,null,_1xD_(param1)) + "}";
         }
         return _1xD_(param1);
      }
      
      private function _1bN_(param1:*, param2:*, param3:String) : String
      {
         if(param2 && !(param2 is String))
         {
            param1 = param1[param2];
            param2 = null;
         }
         var _loc4_:uint = this.setLogRef(param1);
         if(_loc4_)
         {
            return "<menu><a href=\'event:ref_" + _loc4_ + (!!param2?"_" + param2:"") + "\'>" + param3 + "</a></menu>";
         }
         return param3;
      }
      
      private function _0M_T_(param1:String, param2:int, param3:*, param4:* = null) : String
      {
         if(param2 >= 0 && param1.length > param2)
         {
            param1 = param1.substring(0,param2);
            return param1 + this._1bN_(param3,param4," ...");
         }
         return param1;
      }
      
      private function _tL_(param1:int) : void
      {
         this._H_k = this._H_k + param1;
         var _loc2_:* = this._kE_[this._H_k];
         if(_loc2_)
         {
            this.focus(_loc2_,this._H_l);
         }
      }
      
      public function handleRefEvent(param1:String) : void
      {
         var _loc2_:ByteArray = null;
         if(remoter.remoting == _0B_2._1X_3)
         {
            _loc2_ = new ByteArray();
            _loc2_.writeUTF(param1);
            remoter.send("ref",_loc2_);
         }
         else
         {
            this.handleString(param1);
         }
      }
      
      private function handleString(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         if(param1 == "refexit")
         {
            this.exitFocus();
            console.setViewingChannels();
         }
         else if(param1 == "refprev")
         {
            this._tL_(-2);
         }
         else if(param1 == "reffwd")
         {
            this._tL_(0);
         }
         else if(param1 == "refi")
         {
            this.focus(this._0gr,!this._H_l);
         }
         else
         {
            _loc2_ = param1.indexOf("_") + 1;
            if(_loc2_ > 0)
            {
               _loc4_ = "";
               _loc5_ = param1.indexOf("_",_loc2_);
               if(_loc5_ > 0)
               {
                  _loc3_ = uint(param1.substring(_loc2_,_loc5_));
                  _loc4_ = param1.substring(_loc5_ + 1);
               }
               else
               {
                  _loc3_ = uint(param1.substring(_loc2_));
               }
               _loc6_ = this.getRefById(_loc3_);
               if(_loc4_)
               {
                  _loc6_ = _loc6_[_loc4_];
               }
               if(_loc6_)
               {
                  if(param1.indexOf("refe_") == 0)
                  {
                     console.explodech(console.panels.mainPanel.reportChannel,_loc6_);
                  }
                  else
                  {
                     this.focus(_loc6_,this._H_l);
                  }
                  return;
               }
            }
            report("Reference no longer exist (garbage collected).",-2);
         }
      }
      
      public function focus(param1:*, param2:Boolean = false) : void
      {
         remoter.send("focus");
         console.clear(_0yJ_);
         console.setViewingChannels(_0yJ_);
         if(!this._kE_)
         {
            this._kE_ = new Array();
         }
         if(this._0gr != param1)
         {
            this._0gr = param1;
            if(this._kE_.length <= this._H_k)
            {
               this._kE_.push(param1);
            }
            else
            {
               this._kE_[this._H_k] = param1;
            }
            this._H_k++;
         }
         this._H_l = param2;
         this.inspect(param1,this._H_l);
      }
      
      private function _0zu() : void
      {
         console.clear(_0yJ_);
         console.setViewingChannels(_0yJ_);
      }
      
      public function exitFocus() : void
      {
         var _loc1_:ByteArray = null;
         this._0gr = null;
         this._H_l = false;
         this._kE_ = null;
         this._H_k = 0;
         if(remoter.remoting == _0B_2._0__Y_)
         {
            _loc1_ = new ByteArray();
            _loc1_.writeUTF("refexit");
            remoter.send("ref",_loc1_);
         }
         console.clear(_0yJ_);
      }
      
      public function inspect(param1:*, param2:Boolean = true, param3:String = null) : void
      {
         var menuStr:String = null;
         var nodes:XMLList = null;
         var constantX:XML = null;
         var hasstuff:Boolean = false;
         var isstatic:Boolean = false;
         var methodX:XML = null;
         var accessorX:XML = null;
         var variableX:XML = null;
         var extendX:XML = null;
         var implementX:XML = null;
         var metadataX:XML = null;
         var mn:XMLList = null;
         var en:String = null;
         var et:String = null;
         var disp:DisplayObject = null;
         var theParent:DisplayObjectContainer = null;
         var pr:DisplayObjectContainer = null;
         var indstr:String = null;
         var cont:DisplayObjectContainer = null;
         var clen:int = 0;
         var ci:int = 0;
         var child:DisplayObject = null;
         var params:Array = null;
         var mparamsList:XMLList = null;
         var paraX:XML = null;
         var access:String = null;
         var inherit:uint = 0;
         var obj:* = param1;
         var viewAll:Boolean = param2;
         var ch:String = param3;
         var X:* = undefined;
         if(!obj)
         {
            report(obj,-2,true,ch);
            return;
         }
         var refIndex:uint = this.setLogRef(obj);
         var showInherit:String = "";
         if(!viewAll)
         {
            showInherit = " [<a href=\'event:refi\'>show inherited</a>]";
         }
         if(this._kE_)
         {
            menuStr = "<b>[<a href=\'event:refexit\'>exit</a>]";
            if(this._H_k > 1)
            {
               menuStr = menuStr + " [<a href=\'event:refprev\'>previous</a>]";
            }
            if(this._kE_ && this._H_k < this._kE_.length)
            {
               menuStr = menuStr + " [<a href=\'event:reffwd\'>forward</a>]";
            }
            menuStr = menuStr + ("</b> || [<a href=\'event:ref_" + refIndex + "\'>refresh</a>]");
            menuStr = menuStr + ("</b> [<a href=\'event:refe_" + refIndex + "\'>explode</a>]");
            if(config.commandLineAllowed)
            {
               menuStr = menuStr + (" [<a href=\'event:cl_" + refIndex + "\'>scope</a>]");
            }
            if(viewAll)
            {
               menuStr = menuStr + " [<a href=\'event:refi\'>hide inherited</a>]";
            }
            else
            {
               menuStr = menuStr + showInherit;
            }
            report(menuStr,-1,true,ch);
            report("",1,true,ch);
         }
         var V:XML = describeType(obj);
         var cls:Object = obj is Class?obj:obj.constructor;
         var clsV:XML = describeType(cls);
         var self:String = V.@name;
         var isClass:Boolean = obj is Class;
         var st:String = !!isClass?"*":"";
         var str:String = "<b>{" + st + this._1bN_(obj,null,_0B_m(self)) + st + "}</b>";
         var props:Array = [];
         if(V.@isStatic == "true")
         {
            props.push("<b>static</b>");
         }
         if(V.@isDynamic == "true")
         {
            props.push("dynamic");
         }
         if(V.@isFinal == "true")
         {
            props.push("final");
         }
         if(props.length > 0)
         {
            str = str + (" <p-1>" + props.join(" | ") + "</p-1>");
         }
         report(str,-2,true,ch);
         nodes = V.extendsClass;
         if(nodes.length())
         {
            props = [];
            for each(extendX in nodes)
            {
               st = extendX.@type.toString();
               props.push(st.indexOf("*") < 0?this._R_O_(getDefinitionByName(st)):_0B_m(st));
               if(!viewAll)
               {
                  break;
               }
            }
            report("<p10>Extends:</p10> " + props.join(" &gt; "),1,true,ch);
         }
         nodes = V.implementsInterface;
         if(nodes.length())
         {
            props = [];
            for each(implementX in nodes)
            {
               props.push(this._R_O_(getDefinitionByName(implementX.@type.toString())));
            }
            report("<p10>Implements:</p10> " + props.join(", "),1,true,ch);
         }
         report("",1,true,ch);
         props = [];
         nodes = V.metadata.(@name == "Event");
         if(nodes.length())
         {
            for each(metadataX in nodes)
            {
               mn = metadataX.arg;
               en = mn.(@key == "name").@value;
               et = mn.(@key == "type").@value;
               if(refIndex)
               {
                  props.push("<a href=\'event:cl_" + refIndex + "_dispatchEvent(new " + et + "(\"" + en + "\"))\'>" + en + "</a><p0>(" + et + ")</p0>");
               }
               else
               {
                  props.push(en + "<p0>(" + et + ")</p0>");
               }
            }
            report("<p10>Events:</p10> " + props.join("<p-1>; </p-1>"),1,true,ch);
            report("",1,true,ch);
         }
         if(obj is DisplayObject)
         {
            disp = obj as DisplayObject;
            theParent = disp.parent;
            if(theParent)
            {
               props = new Array("@" + theParent.getChildIndex(disp));
               while(theParent)
               {
                  pr = theParent;
                  theParent = theParent.parent;
                  indstr = !!theParent?"@" + theParent.getChildIndex(pr):"";
                  props.push("<b>" + pr.name + "</b>" + indstr + this._R_O_(pr));
               }
               report("<p10>Parents:</p10> " + props.join("<p-1> -> </p-1>") + "<br/>",1,true,ch);
            }
         }
         if(obj is DisplayObjectContainer)
         {
            props = [];
            cont = obj as DisplayObjectContainer;
            clen = cont.numChildren;
            ci = 0;
            while(ci < clen)
            {
               child = cont.getChildAt(ci);
               props.push("<b>" + child.name + "</b>@" + ci + this._R_O_(child));
               ci = ci + 1;
            }
            if(clen)
            {
               report("<p10>Children:</p10> " + props.join("<p-1>; </p-1>") + "<br/>",1,true,ch);
            }
         }
         props = [];
         nodes = clsV..constant;
         for each(constantX in nodes)
         {
            report(" const <p3>" + constantX.@name + "</p3>:" + constantX.@type + " = " + this._R_O_(cls,constantX.@name.toString()) + "</p0>",1,true,ch);
         }
         if(nodes.length())
         {
            report("",1,true,ch);
         }
         props = [];
         nodes = clsV..method;
         for each(methodX in nodes)
         {
            if(viewAll || self == methodX.@declaredBy)
            {
               hasstuff = true;
               isstatic = methodX.parent().name() != "factory";
               str = " " + (!!isstatic?"static ":"") + "function ";
               params = [];
               mparamsList = methodX.parameter;
               for each(paraX in mparamsList)
               {
                  params.push(paraX.@optional == "true"?"<i>" + paraX.@type + "</i>":paraX.@type);
               }
               if(refIndex && (isstatic || !isClass))
               {
                  str = str + ("<a href=\'event:cl_" + refIndex + "_" + methodX.@name + "()\'><p3>" + methodX.@name + "</p3></a>");
               }
               else
               {
                  str = str + ("<p3>" + methodX.@name + "</p3>");
               }
               str = str + ("(" + params.join(", ") + "):" + methodX.@returnType);
               report(str,1,true,ch);
            }
            else
            {
               inherit++;
            }
         }
         if(inherit)
         {
            report("   \t + " + inherit + " inherited methods." + showInherit,1,true,ch);
         }
         else if(hasstuff)
         {
            report("",1,true,ch);
         }
         hasstuff = false;
         inherit = 0;
         props = [];
         nodes = clsV..accessor;
         for each(accessorX in nodes)
         {
            if(viewAll || self == accessorX.@declaredBy)
            {
               hasstuff = true;
               isstatic = accessorX.parent().name() != "factory";
               str = " ";
               if(isstatic)
               {
                  str = str + "static ";
               }
               access = accessorX.@access;
               if(access == "readonly")
               {
                  str = str + "get";
               }
               else if(access == "writeonly")
               {
                  str = str + "set";
               }
               else
               {
                  str = str + "assign";
               }
               if(refIndex && (isstatic || !isClass))
               {
                  str = str + (" <a href=\'event:cl_" + refIndex + "_" + accessorX.@name + "\'><p3>" + accessorX.@name + "</p3></a>:" + accessorX.@type);
               }
               else
               {
                  str = str + (" <p3>" + accessorX.@name + "</p3>:" + accessorX.@type);
               }
               if(access != "writeonly" && (isstatic || !isClass))
               {
                  str = str + (" = " + this._R_O_(!!isstatic?cls:obj,accessorX.@name.toString()));
               }
               report(str,1,true,ch);
            }
            else
            {
               inherit++;
            }
         }
         if(inherit)
         {
            report("   \t + " + inherit + " inherited accessors." + showInherit,1,true,ch);
         }
         else if(hasstuff)
         {
            report("",1,true,ch);
         }
         nodes = clsV..variable;
         for each(variableX in nodes)
         {
            isstatic = variableX.parent().name() != "factory";
            str = !!isstatic?" static":"";
            if(refIndex)
            {
               str = str + (" var <p3><a href=\'event:cl_" + refIndex + "_" + variableX.@name + " = \'>" + variableX.@name + "</a>");
            }
            else
            {
               str = str + (" var <p3>" + variableX.@name);
            }
            str = str + ("</p3>:" + variableX.@type + " = " + this._R_O_(!!isstatic?cls:obj,variableX.@name.toString()));
            report(str,1,true,ch);
         }
         try
         {
            props = [];
            for(X in obj)
            {
               if(X is String)
               {
                  if(refIndex)
                  {
                     str = "<a href=\'event:cl_" + refIndex + "_" + X + " = \'>" + X + "</a>";
                  }
                  else
                  {
                     str = X;
                  }
                  report(" dynamic var <p3>" + str + "</p3> = " + this._R_O_(obj,X),1,true,ch);
               }
               else
               {
                  report(" dictionary <p3>" + this._R_O_(X) + "</p3> = " + this._R_O_(obj,X),1,true,ch);
               }
            }
         }
         catch(e:Error)
         {
            report("Could not get dynamic values. " + e.message,9,false,ch);
         }
         if(obj is String)
         {
            report("",1,true,ch);
            report("String",10,true,ch);
            report(_0B_m(obj),1,true,ch);
         }
         else if(obj is XML || obj is XMLList)
         {
            report("",1,true,ch);
            report("XMLString",10,true,ch);
            report(_0B_m(obj.toXMLString()),1,true,ch);
         }
         if(menuStr)
         {
            report("",1,true,ch);
            report(menuStr,-1,true,ch);
         }
      }
      
      public function getPossibleCalls(param1:*) : Array
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc5_:Array = null;
         var _loc6_:XMLList = null;
         var _loc7_:XML = null;
         var _loc8_:Array = new Array();
         var _loc9_:XML = describeType(param1);
         var _loc10_:XMLList = _loc9_.method;
         for each(_loc2_ in _loc10_)
         {
            _loc5_ = [];
            _loc6_ = _loc2_.parameter;
            for each(_loc7_ in _loc6_)
            {
               _loc5_.push(_loc7_.@optional == "true"?"<i>" + _loc7_.@type + "</i>":_loc7_.@type);
            }
            _loc8_.push([_loc2_.@name + "(",_loc5_.join(", ") + " ):" + _loc2_.@returnType]);
         }
         _loc10_ = _loc9_.accessor;
         for each(_loc3_ in _loc10_)
         {
            _loc8_.push([String(_loc3_.@name),String(_loc3_.@type)]);
         }
         _loc10_ = _loc9_.variable;
         for each(_loc4_ in _loc10_)
         {
            _loc8_.push([String(_loc4_.@name),String(_loc4_.@type)]);
         }
         return _loc8_;
      }
      
      private function _R_O_(param1:*, param2:* = null) : String
      {
         return this.makeString(param1,param2,false,!!config.useObjectLinking?100:-1);
      }
   }
}
