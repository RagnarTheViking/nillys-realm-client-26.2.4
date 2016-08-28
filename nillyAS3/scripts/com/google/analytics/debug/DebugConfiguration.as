package com.google.analytics.debug
{
   import flash.utils.getTimer;
   import flash.net.URLRequest;
   import com.google.analytics.core.GIFRequest;
   import flash.ui.Keyboard;
   
   public class DebugConfiguration
   {
       
      
      public var showHideKey:Number;
      
      private var _mode:com.google.analytics.debug.VisualDebugMode;
      
      private var _verbose:Boolean = false;
      
      public var destroyKey:Number;
      
      public var GIFRequests:Boolean = false;
      
      public var showInfos:Boolean = true;
      
      public var infoTimeout:Number = 1000;
      
      public var minimizedOnStart:Boolean = false;
      
      private var _active:Boolean = false;
      
      public var traceOutput:Boolean = false;
      
      public var layout:com.google.analytics.debug.ILayout;
      
      public var warningTimeout:Number = 1500;
      
      public var javascript:Boolean = false;
      
      public var showWarnings:Boolean = true;
      
      private var _visualInitialized:Boolean = false;
      
      public function DebugConfiguration()
      {
         this._mode = com.google.analytics.debug.VisualDebugMode.basic;
         this.showHideKey = Keyboard.SPACE;
         this.destroyKey = Keyboard.BACKSPACE;
         super();
      }
      
      public function get verbose() : Boolean
      {
         return this._verbose;
      }
      
      public function set verbose(param1:Boolean) : void
      {
         this._verbose = param1;
      }
      
      public function set mode(param1:*) : void
      {
         if(param1 is String)
         {
            switch(param1)
            {
               case "geek":
                  param1 = com.google.analytics.debug.VisualDebugMode.geek;
                  break;
               case "advanced":
                  param1 = com.google.analytics.debug.VisualDebugMode.advanced;
                  break;
               case "basic":
               default:
                  param1 = com.google.analytics.debug.VisualDebugMode.basic;
            }
         }
         this._mode = param1;
      }
      
      public function success(param1:String) : void
      {
         if(this.layout)
         {
            this.layout.createSuccessAlert(param1);
         }
         if(!this.traceOutput)
         {
         }
      }
      
      public function get active() : Boolean
      {
         return this._active;
      }
      
      private function _initializeVisual() : void
      {
         if(this.layout)
         {
            this.layout.init();
            this._visualInitialized = true;
         }
      }
      
      private function _destroyVisual() : void
      {
         if(this.layout && this._visualInitialized)
         {
            this.layout.destroy();
         }
      }
      
      public function warning(param1:String, param2:com.google.analytics.debug.VisualDebugMode = null) : void
      {
         if(this._filter(param2))
         {
            return;
         }
         if(this.layout && this.showWarnings)
         {
            this.layout.createWarning(param1);
         }
         if(!this.traceOutput)
         {
         }
      }
      
      private function _filter(param1:com.google.analytics.debug.VisualDebugMode = null) : Boolean
      {
         return param1 && int(param1) >= int(this.mode);
      }
      
      public function failure(param1:String) : void
      {
         if(this.layout)
         {
            this.layout.createFailureAlert(param1);
         }
         if(!this.traceOutput)
         {
         }
      }
      
      public function get mode() : *
      {
         return this._mode;
      }
      
      public function set active(param1:Boolean) : void
      {
         this._active = param1;
         if(this._active)
         {
            this._initializeVisual();
         }
         else
         {
            this._destroyVisual();
         }
      }
      
      protected function trace(param1:String) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:Array = [];
         var _loc5_:* = "";
         var _loc6_:* = "";
         if(this.mode == com.google.analytics.debug.VisualDebugMode.geek)
         {
            _loc5_ = getTimer() + " - ";
            _loc6_ = new Array(_loc5_.length).join(" ") + " ";
         }
         if(param1.indexOf("\n") > -1)
         {
            _loc2_ = param1.split("\n");
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               if(_loc2_[_loc3_] != "")
               {
                  if(_loc3_ == 0)
                  {
                     _loc4_.push(_loc5_ + _loc2_[_loc3_]);
                  }
                  else
                  {
                     _loc4_.push(_loc6_ + _loc2_[_loc3_]);
                  }
               }
               _loc3_++;
            }
         }
         else
         {
            _loc4_.push(_loc5_ + param1);
         }
         var _loc7_:int = _loc4_.length;
         while(_loc8_ < _loc7_)
         {
            _loc8_++;
         }
      }
      
      public function alert(param1:String) : void
      {
         if(this.layout)
         {
            this.layout.createAlert(param1);
         }
         if(!this.traceOutput)
         {
         }
      }
      
      public function info(param1:String, param2:com.google.analytics.debug.VisualDebugMode = null) : void
      {
         if(this._filter(param2))
         {
            return;
         }
         if(this.layout && this.showInfos)
         {
            this.layout.createInfo(param1);
         }
         if(!this.traceOutput)
         {
         }
      }
      
      public function alertGifRequest(param1:String, param2:URLRequest, param3:GIFRequest) : void
      {
         if(this.layout)
         {
            this.layout.createGIFRequestAlert(param1,param2,param3);
         }
         if(!this.traceOutput)
         {
         }
      }
   }
}
