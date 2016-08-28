package _0ib
{
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   import flash.system.System;
   import _2F_.Console;
   
   public class _1sD_ extends _05E_
   {
       
      
      private var _0U_O_:Object;
      
      private var _0B_4:Dictionary;
      
      private var _count:uint;
      
      public function _1sD_(param1:Console)
      {
         super(param1);
         this._0U_O_ = new Object();
         this._0B_4 = new Dictionary(true);
         console.remoter.registerCallback("gc",this.gc);
      }
      
      public function _M_b(param1:Object, param2:String) : String
      {
         var _loc3_:String = getQualifiedClassName(param1);
         if(!param2)
         {
            param2 = _loc3_ + "@" + getTimer();
         }
         if(this._0B_4[param1])
         {
            if(this._0U_O_[this._0B_4[param1]])
            {
               this._0S_N_(this._0B_4[param1]);
            }
         }
         if(this._0U_O_[param2])
         {
            if(this._0B_4[param1] == param2)
            {
               this._count--;
            }
            else
            {
               param2 = param2 + "@" + getTimer() + "_" + Math.floor(Math.random() * 100);
            }
         }
         this._0U_O_[param2] = true;
         this._count++;
         this._0B_4[param1] = param2;
         return param2;
      }
      
      public function _0S_N_(param1:String) : void
      {
         var _loc2_:* = null;
         for(_loc2_ in this._0B_4)
         {
            if(this._0B_4[_loc2_] == param1)
            {
               delete this._0B_4[_loc2_];
            }
         }
         if(this._0U_O_[param1])
         {
            delete this._0U_O_[param1];
            this._count--;
         }
      }
      
      public function update() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._count == 0)
         {
            return;
         }
         var _loc3_:Array = new Array();
         var _loc4_:Object = new Object();
         for(_loc1_ in this._0B_4)
         {
            _loc4_[this._0B_4[_loc1_]] = true;
         }
         for(_loc2_ in this._0U_O_)
         {
            if(!_loc4_[_loc2_])
            {
               _loc3_.push(_loc2_);
               delete this._0U_O_[_loc2_];
               this._count--;
            }
         }
         if(_loc3_.length)
         {
            report("<b>GARBAGE COLLECTED " + _loc3_.length + " item(s): </b>" + _loc3_.join(", "),-2);
         }
      }
      
      public function get count() : uint
      {
         return this._count;
      }
      
      public function gc() : void
      {
         var ok:Boolean = false;
         var str:String = null;
         var _local2:* = undefined;
         if(remoter.remoting == _0B_2._1X_3)
         {
            try
            {
               remoter.send("gc");
            }
            catch(e:Error)
            {
               report(e,10);
            }
         }
         else
         {
            try
            {
               if(System["gc"] != null)
               {
                  _local2 = System;
                  _local2["gc"]();
                  ok = true;
               }
            }
            catch(e:Error)
            {
            }
            str = "Manual garbage collection " + (!!ok?"successful.":"FAILED. You need debugger version of flash player.");
            report(str,!!ok?-1:10);
         }
      }
   }
}
