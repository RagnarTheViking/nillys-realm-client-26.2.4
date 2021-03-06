package com.company.assembleegameclient.util
{
   import flash.events.IEventDispatcher;
   import _0cW_.Screen3DHelper;
   import flash.display.Stage3D;
   import flash.events.Event;
   
   public class _01D_ implements IEventDispatcher
   {
      
      private static var context3D:Screen3DHelper;
       
      
      private var stage3D:Stage3D;
      
      public function _01D_(param1:Stage3D)
      {
         super();
         this.stage3D = param1;
      }
      
      public function requestContext3D() : void
      {
         this.stage3D.requestContext3D();
      }
      
      public function getContext3D() : Screen3DHelper
      {
         if(context3D == null)
         {
            context3D = new Screen3DHelper(this.stage3D.context3D);
         }
         return context3D;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this.stage3D.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this.stage3D.removeEventListener(param1,param2,param3);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this.stage3D.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this.stage3D.hasEventListener(param1);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this.stage3D.willTrigger(param1);
      }
   }
}
