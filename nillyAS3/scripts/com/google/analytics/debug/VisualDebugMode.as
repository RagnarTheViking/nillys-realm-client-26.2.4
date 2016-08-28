package com.google.analytics.debug
{
   public class VisualDebugMode
   {
      
      public static const basic:com.google.analytics.debug.VisualDebugMode = new com.google.analytics.debug.VisualDebugMode(0,"basic");
      
      public static const advanced:com.google.analytics.debug.VisualDebugMode = new com.google.analytics.debug.VisualDebugMode(1,"advanced");
      
      public static const geek:com.google.analytics.debug.VisualDebugMode = new com.google.analytics.debug.VisualDebugMode(2,"geek");
       
      
      private var _value:int;
      
      private var _name:String;
      
      public function VisualDebugMode(param1:int = 0, param2:String = "")
      {
         super();
         this._value = param1;
         this._name = param2;
      }
      
      public function valueOf() : int
      {
         return this._value;
      }
      
      public function toString() : String
      {
         return this._name;
      }
   }
}
