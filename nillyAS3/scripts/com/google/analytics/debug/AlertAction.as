package com.google.analytics.debug
{
   public class AlertAction
   {
       
      
      public var container:com.google.analytics.debug.Alert;
      
      private var _callback;
      
      public var activator:String;
      
      public var name:String;
      
      public function AlertAction(param1:String, param2:String, param3:*)
      {
         super();
         this.name = param1;
         this.activator = param2;
         this._callback = param3;
      }
      
      public function execute() : void
      {
         var _loc1_:* = undefined;
         if(this._callback)
         {
            if(this._callback is Function)
            {
               (this._callback as Function)();
            }
            else if(this._callback is String)
            {
               _loc1_ = this.container;
               _loc1_[this._callback]();
            }
         }
      }
   }
}
