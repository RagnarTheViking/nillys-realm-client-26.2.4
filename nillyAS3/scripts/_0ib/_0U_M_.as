package _0ib
{
   import flash.display.DisplayObjectContainer;
   import flash.display.DisplayObject;
   import flash.utils.ByteArray;
   import flash.utils.describeType;
   import flash.utils.getQualifiedClassName;
   import _2F_.Console;
   import _2F_.Cc;
   
   public class _0U_M_ extends _05E_
   {
       
      
      public function _0U_M_(param1:Console)
      {
         super(param1);
      }
      
      public function map(param1:DisplayObjectContainer, param2:uint = 0, param3:String = null) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:DisplayObject = null;
         var _loc6_:String = null;
         var _loc7_:DisplayObjectContainer = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:DisplayObject = null;
         var _loc11_:uint = 0;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:DisplayObject = null;
         if(!param1)
         {
            report("Not a DisplayObjectContainer.",10,true,param3);
            return;
         }
         var _loc16_:Array = new Array();
         _loc16_.push(param1);
         while(_loc14_ < _loc16_.length)
         {
            _loc5_ = _loc16_[_loc14_];
            _loc14_++;
            if(_loc5_ is DisplayObjectContainer)
            {
               _loc7_ = _loc5_ as DisplayObjectContainer;
               _loc8_ = _loc7_.numChildren;
               _loc9_ = 0;
               while(_loc9_ < _loc8_)
               {
                  _loc10_ = _loc7_.getChildAt(_loc9_);
                  _loc16_.splice(_loc14_ + _loc9_,0,_loc10_);
                  _loc9_++;
               }
            }
            if(_loc15_)
            {
               if(_loc15_ is DisplayObjectContainer && (_loc15_ as DisplayObjectContainer).contains(_loc5_))
               {
                  _loc13_++;
               }
               else
               {
                  while(_loc15_)
                  {
                     _loc15_ = _loc15_.parent;
                     if(_loc15_ is DisplayObjectContainer)
                     {
                        if(_loc13_ > 0)
                        {
                           _loc13_--;
                        }
                        if((_loc15_ as DisplayObjectContainer).contains(_loc5_))
                        {
                           _loc13_++;
                           break;
                        }
                     }
                  }
               }
            }
            _loc6_ = "";
            _loc9_ = 0;
            while(_loc9_ < _loc13_)
            {
               _loc6_ = _loc6_ + (_loc9_ == _loc13_ - 1?" ∟ ":" - ");
               _loc9_++;
            }
            if(param2 <= 0 || _loc13_ <= param2)
            {
               _loc4_ = false;
               _loc11_ = console.refs.setLogRef(_loc5_);
               _loc12_ = _loc5_.name;
               if(_loc11_)
               {
                  _loc12_ = "<a href=\'event:cl_" + _loc11_ + "\'>" + _loc12_ + "</a>";
               }
               if(_loc5_ is DisplayObjectContainer)
               {
                  _loc12_ = "<b>" + _loc12_ + "</b>";
               }
               else
               {
                  _loc12_ = "<i>" + _loc12_ + "</i>";
               }
               _loc6_ = _loc6_ + (_loc12_ + " " + console.refs.makeRefTyped(_loc5_));
               report(_loc6_,_loc5_ is DisplayObjectContainer?5:2,true,param3);
            }
            else if(!_loc4_)
            {
               _loc4_ = true;
               report(_loc6_ + "...",5,true,param3);
            }
            _loc15_ = _loc5_;
         }
         report(param1.name + ":" + console.refs.makeRefTyped(param1) + " has " + (_loc16_.length - 1) + " children/sub-children.",9,true,param3);
         if(config.commandLineAllowed)
         {
            report("Click on the child display\'s name to set scope.",-2,true,param3);
         }
      }
      
      public function explode(param1:Object, param2:int = 3, param3:int = 9) : String
      {
         var _loc4_:XMLList = null;
         var _loc5_:String = null;
         var _loc6_:XML = null;
         var _loc7_:XML = null;
         var _loc8_:* = null;
         var _loc9_:* = typeof param1;
         if(param1 == null)
         {
            return "<p-2>" + param1 + "</p-2>";
         }
         if(param1 is String)
         {
            return "\"" + _1R_M_._0B_m(param1 as String) + "\"";
         }
         if(_loc9_ != "object" || param2 == 0 || param1 is ByteArray)
         {
            return console.refs.makeString(param1);
         }
         if(param3 < 0)
         {
            param3 = 0;
         }
         var _loc10_:XML = describeType(param1);
         var _loc11_:Array = [];
         _loc4_ = _loc10_["accessor"];
         for each(_loc6_ in _loc4_)
         {
            _loc5_ = _loc6_.@name;
            if(_loc6_.@access != "writeonly")
            {
               try
               {
                  _loc11_.push(this._1T_T_(param1,_loc5_,param2,param3));
               }
               catch(e:Error)
               {
               }
            }
            else
            {
               _loc11_.push(_loc5_);
            }
         }
         _loc4_ = _loc10_["variable"];
         for each(_loc7_ in _loc4_)
         {
            _loc5_ = _loc7_.@name;
            _loc11_.push(this._1T_T_(param1,_loc5_,param2,param3));
         }
         try
         {
            for(_loc8_ in param1)
            {
               _loc11_.push(this._1T_T_(param1,_loc8_,param2,param3));
            }
         }
         catch(e:Error)
         {
         }
         return "<p" + param3 + ">{" + _1R_M_._1xD_(param1) + "</p" + param3 + "> " + _loc11_.join(", ") + "<p" + param3 + ">}</p" + param3 + ">";
      }
      
      private function _1T_T_(param1:*, param2:String, param3:int, param4:int) : String
      {
         return param2 + ":" + this.explode(param1[param2],param3 - 1,param4 - 1);
      }
      
      public function _12h(param1:int, param2:int) : String
      {
         var _loc9_:Boolean = false;
         var _loc3_:Error = new Error();
         var _loc4_:String = !!_loc3_.hasOwnProperty("getStackTrace")?_loc3_.getStackTrace():null;
         if(!_loc4_)
         {
            return "";
         }
         var _loc5_:* = "";
         var _loc6_:Array = _loc4_.split(/\n\sat\s/);
         var _loc7_:int = _loc6_.length;
         var _loc8_:RegExp = new RegExp("Function|" + getQualifiedClassName(Console) + "|" + getQualifiedClassName(Cc));
         var _loc10_:int = 2;
         while(_loc10_ < _loc7_)
         {
            if(!_loc9_ && _loc6_[_loc10_].search(_loc8_) != 0)
            {
               _loc9_ = true;
            }
            if(_loc9_)
            {
               _loc5_ = _loc5_ + ("\n<p" + param2 + "> @ " + _loc6_[_loc10_] + "</p" + param2 + ">");
               if(param2 > 0)
               {
                  param2--;
               }
               param1--;
               if(param1 <= 0)
               {
                  break;
               }
            }
            _loc10_++;
         }
         return _loc5_;
      }
   }
}
