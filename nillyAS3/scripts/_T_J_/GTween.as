package _T_J_
{
   import flash.events.EventDispatcher;
   import flash.display.Shape;
   import flash.utils.Dictionary;
   import flash.events.Event;
   import flash.utils.getTimer;
   import flash.events.IEventDispatcher;
   
   public class GTween extends EventDispatcher
   {
      
      public static var version:Number = 2.01;
      
      public static var _1H_X_:Boolean = false;
      
      public static var _1K_5:Function = _03V_;
      
      public static var _0Y___:Boolean = false;
      
      public static var _1va:Number = 1;
      
      protected static var _o9:Boolean = false;
      
      protected static var _0E_o:Object = {};
      
      protected static var _P_J_:Shape;
      
      protected static var time:Number;
      
      protected static var _1zQ_:Dictionary = new Dictionary(true);
      
      protected static var _14m:Dictionary = new Dictionary(false);
      
      {
         _0C_C_();
      }
      
      protected var _02D_:Number = 0;
      
      protected var _1j:Object;
      
      protected var _0id:Boolean = true;
      
      protected var _1oY_:Number;
      
      protected var _R_2:Boolean;
      
      protected var _ra:Object;
      
      protected var _1is:Object;
      
      protected var _proxy:TargetProxy;
      
      public var _1cP_:Boolean = true;
      
      public var data;
      
      public var duration:Number;
      
      public var ease:Function;
      
      public var _Y_I_:_T_J_.GTween;
      
      public var _1pZ_:Object;
      
      public var _1M_V_:Boolean;
      
      public var _5o:int = 1;
      
      public var target:Object;
      
      public var _1mO_:Boolean;
      
      public var _0X_R_:Number = 1;
      
      public var _0l0:Number;
      
      public var _1f4:Number;
      
      public var _1H_N_:Number;
      
      public var _1P_C_:Number;
      
      public var _lh:Number;
      
      public var _1pz:Boolean;
      
      public var _0C_0:Boolean;
      
      public var onComplete:Function;
      
      public var _1C___:Function;
      
      public var _09i:Function;
      
      public function GTween(param1:Object = null, param2:Number = 1, param3:Object = null, param4:Object = null, param5:Object = null)
      {
         var _loc6_:Boolean = false;
         super();
         this.ease = _1K_5;
         this._0C_0 = _1H_X_;
         this.target = param1;
         this.duration = param2;
         this._1pZ_ = this.copy(param5,{});
         if(param4)
         {
            _loc6_ = param4.swapValues;
            delete param4.swapValues;
         }
         this.copy(param4,this);
         this._yI_(param3);
         if(_loc6_)
         {
            this.swapValues();
         }
         if(this.duration == 0 && this.delay == 0 && this._1cP_)
         {
            this.position = 0;
         }
      }
      
      public static function _2x(param1:Object, param2:Array, param3:Boolean = false) : void
      {
         var _loc4_:String = null;
         var _loc5_:uint = 0;
         while(_loc5_ < param2.length)
         {
            _loc4_ = param2[_loc5_];
            if(_loc4_ == "*")
            {
               _o9 = true;
            }
            if(_0E_o[_loc4_] == null)
            {
               _0E_o[_loc4_] = [param1];
            }
            else if(param3)
            {
               _0E_o[_loc4_].unshift(param1);
            }
            else
            {
               _0E_o[_loc4_].push(param1);
            }
            _loc5_++;
         }
      }
      
      public static function _03V_(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return param1;
      }
      
      protected static function _0C_C_() : void
      {
         (_P_J_ = new Shape()).addEventListener(Event.ENTER_FRAME,_G_n);
         time = getTimer() / 1000;
      }
      
      protected static function _G_n(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:_T_J_.GTween = null;
         var _loc4_:Number = time;
         time = getTimer() / 1000;
         if(_0Y___)
         {
            return;
         }
         var _loc5_:Number = (time - _loc4_) * _1va;
         for(_loc2_ in _1zQ_)
         {
            _loc3_ = _loc2_ as _T_J_.GTween;
            _loc3_.position = _loc3_._1oY_ + (!!_loc3_._1mO_?_1va:_loc5_) * _loc3_._0X_R_;
         }
      }
      
      public function get paused() : Boolean
      {
         return this._0id;
      }
      
      public function set paused(param1:Boolean) : void
      {
         if(param1 == this._0id)
         {
            return;
         }
         this._0id = param1;
         if(this._0id)
         {
            delete _1zQ_[this];
            if(this.target is IEventDispatcher)
            {
               this.target.removeEventListener("_",this._11v);
            }
            delete _14m[this];
         }
         else
         {
            if(isNaN(this._1oY_) || this._5o != 0 && this._1oY_ >= this._5o * this.duration)
            {
               this._R_2 = false;
               this._1P_C_ = this._lh = this._1f4 = this._1H_N_ = this._0l0 = 0;
               this._1oY_ = -this.delay;
            }
            _1zQ_[this] = true;
            if(this.target is IEventDispatcher)
            {
               this.target.addEventListener("_",this._11v);
            }
            else
            {
               _14m[this] = true;
            }
         }
      }
      
      public function get position() : Number
      {
         return this._1oY_;
      }
      
      public function set position(param1:Number) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Array = null;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         this._0l0 = this._1oY_;
         this._1H_N_ = this._1f4;
         this._lh = this._1P_C_;
         var _loc9_:Number = this._5o * this.duration;
         var _loc10_:Boolean = param1 >= _loc9_ && this._5o > 0;
         if(_loc10_)
         {
            if(this._lh == _loc9_)
            {
               return;
            }
            this._1oY_ = _loc9_;
            this._1P_C_ = this._1M_V_ && !(this._5o & 1)?Number(0):Number(this.duration);
         }
         else
         {
            this._1oY_ = param1;
            this._1P_C_ = this._1oY_ < 0?Number(0):Number(this._1oY_ % this.duration);
            if(this._1M_V_ && this._1oY_ / this.duration & 1)
            {
               this._1P_C_ = this.duration - this._1P_C_;
            }
         }
         this._1f4 = this.duration == 0 && this._1oY_ >= 0?Number(1):Number(this.ease(this._1P_C_ / this.duration,0,1,1));
         if(this.target && (this._1oY_ >= 0 || this._0l0 >= 0) && this._1P_C_ != this._lh)
         {
            if(!this._R_2)
            {
               this.init();
            }
            for(_loc2_ in this._1j)
            {
               _loc3_ = this._ra[_loc2_];
               _loc4_ = this._1is[_loc2_];
               _loc5_ = _loc3_ + _loc4_ * this._1f4;
               _loc6_ = _0E_o[_loc2_];
               if(_loc6_)
               {
                  _loc7_ = _loc6_.length;
                  _loc8_ = 0;
                  while(_loc8_ < _loc7_)
                  {
                     _loc5_ = _loc6_[_loc8_].tween(this,_loc2_,_loc5_,_loc3_,_loc4_,this._1f4,_loc10_);
                     _loc8_++;
                  }
                  if(!isNaN(_loc5_))
                  {
                     this.target[_loc2_] = _loc5_;
                  }
               }
               else
               {
                  this.target[_loc2_] = _loc5_;
               }
            }
         }
         if(_o9)
         {
            _loc6_ = _0E_o["*"];
            _loc7_ = _loc6_.length;
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc6_[_loc8_].tween(this,"*",NaN,NaN,NaN,this._1f4,_loc10_);
               _loc8_++;
            }
         }
         if(!this._1pz)
         {
            if(this._0C_0)
            {
               this._vf("change");
            }
            if(this._1C___ != null)
            {
               this._1C___(this);
            }
         }
         if(_loc10_)
         {
            this.paused = true;
            if(this._Y_I_)
            {
               this._Y_I_.paused = false;
            }
            if(!this._1pz)
            {
               if(this._0C_0)
               {
                  this._vf("complete");
               }
               if(this.onComplete != null)
               {
                  this.onComplete(this);
               }
            }
         }
      }
      
      public function get delay() : Number
      {
         return this._02D_;
      }
      
      public function set delay(param1:Number) : void
      {
         if(this._1oY_ <= 0)
         {
            this._1oY_ = -param1;
         }
         this._02D_ = param1;
      }
      
      public function get proxy() : TargetProxy
      {
         if(this._proxy == null)
         {
            this._proxy = new TargetProxy(this);
         }
         return this._proxy;
      }
      
      public function setValue(param1:String, param2:Number) : void
      {
         this._1j[param1] = param2;
         this._11v();
      }
      
      public function getValue(param1:String) : Number
      {
         return this._1j[param1];
      }
      
      public function _5U_(param1:String) : Boolean
      {
         delete this._1is[param1];
         delete this._ra[param1];
         return delete this._1j[param1];
      }
      
      public function _97(param1:Object) : void
      {
         this.copy(param1,this._1j,true);
         this._11v();
      }
      
      public function _yI_(param1:Object = null) : void
      {
         this._1j = {};
         this._97(param1);
      }
      
      public function _w2() : Object
      {
         return this.copy(this._1j,{});
      }
      
      public function _1jM_(param1:String) : Number
      {
         return this._ra[param1];
      }
      
      public function swapValues() : void
      {
         var _loc1_:* = null;
         var _loc2_:Number = NaN;
         if(!this._R_2)
         {
            this.init();
         }
         var _loc3_:Object = this._1j;
         this._1j = this._ra;
         this._ra = _loc3_;
         for(_loc1_ in this._1is)
         {
            this._1is[_loc1_] = this._1is[_loc1_] * -1;
         }
         if(this._1oY_ < 0)
         {
            _loc2_ = this._0l0;
            this.position = 0;
            this._1oY_ = this._0l0;
            this._0l0 = _loc2_;
         }
         else
         {
            this.position = this._1oY_;
         }
      }
      
      public function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Number = NaN;
         var _loc5_:uint = 0;
         this._R_2 = true;
         this._ra = {};
         this._1is = {};
         for(_loc1_ in this._1j)
         {
            if(_0E_o[_loc1_])
            {
               _loc2_ = _0E_o[_loc1_];
               _loc3_ = _loc2_.length;
               _loc4_ = _loc1_ in this.target?Number(this.target[_loc1_]):Number(NaN);
               _loc5_ = 0;
               while(_loc5_ < _loc3_)
               {
                  _loc4_ = _loc2_[_loc5_].init(this,_loc1_,_loc4_);
                  _loc5_++;
               }
               if(!isNaN(_loc4_))
               {
                  this._1is[_loc1_] = this._1j[_loc1_] - (this._ra[_loc1_] = _loc4_);
               }
            }
            else
            {
               this._1is[_loc1_] = this._1j[_loc1_] - (this._ra[_loc1_] = this.target[_loc1_]);
            }
         }
         if(_o9)
         {
            _loc2_ = _0E_o["*"];
            _loc3_ = _loc2_.length;
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc2_[_loc5_].init(this,"*",NaN);
               _loc5_++;
            }
         }
         if(!this._1pz)
         {
            if(this._0C_0)
            {
               this._vf("init");
            }
            if(this._09i != null)
            {
               this._09i(this);
            }
         }
      }
      
      public function _0uL_() : void
      {
         this.position = 0;
         this.paused = true;
      }
      
      public function end() : void
      {
         this.position = this._5o > 0?Number(this._5o * this.duration):Number(this.duration);
      }
      
      protected function _11v() : void
      {
         this._R_2 = false;
         if(this._1oY_ > 0)
         {
            this._1oY_ = 0;
         }
         if(this._1cP_)
         {
            this.paused = false;
         }
      }
      
      protected function copy(param1:Object, param2:Object, param3:Boolean = false) : Object
      {
         var _loc4_:* = null;
         for(_loc4_ in param1)
         {
            if(param3 && param1[_loc4_] == null)
            {
               delete param2[_loc4_];
            }
            else
            {
               param2[_loc4_] = param1[_loc4_];
            }
         }
         return param2;
      }
      
      protected function _vf(param1:String) : void
      {
         if(hasEventListener(param1))
         {
            dispatchEvent(new Event(param1));
         }
      }
   }
}

import flash.utils.Proxy;
import _T_J_.GTween;
import flash.utils.flash_proxy;

dynamic class TargetProxy extends Proxy
{
    
   
   private var tween:GTween;
   
   function TargetProxy(param1:GTween)
   {
      super();
      this.tween = param1;
   }
   
   override flash_proxy function callProperty(param1:*, ... rest) : *
   {
      return this.tween.target[param1].apply(null,rest);
   }
   
   override flash_proxy function getProperty(param1:*) : *
   {
      var _loc2_:Number = this.tween.getValue(param1);
      return !!isNaN(_loc2_)?this.tween.target[param1]:_loc2_;
   }
   
   override flash_proxy function setProperty(param1:*, param2:*) : void
   {
      if(param2 is Boolean || param2 is String || isNaN(param2))
      {
         this.tween.target[param1] = param2;
      }
      else
      {
         this.tween.setValue(String(param1),Number(param2));
      }
   }
   
   override flash_proxy function deleteProperty(param1:*) : Boolean
   {
      this.tween._5U_(param1);
      return true;
   }
}
