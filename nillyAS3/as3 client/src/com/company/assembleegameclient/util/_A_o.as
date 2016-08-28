package com.company.assembleegameclient.util
{
   import flash.events.IEventDispatcher;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   
   public class _A_o implements IEventDispatcher
   {
      
      private static var stage3D:com.company.assembleegameclient.util._01D_ = null;
       
      
      protected var _1G_a:DisplayObject;
      
      public function _A_o(param1:DisplayObject)
      {
         super();
         this._1G_a = param1;
      }
      
      public function _1xU_() : DisplayObjectContainer
      {
         return this._1G_a.stage;
      }
      
      public function _05C_() : Number
      {
         if(this._1G_a.stage != null)
         {
            this._1G_a.stage;
            return 800;
         }
         return 800;
      }
      
      public function _0P_C_() : Number
      {
         if(this._1G_a.stage != null)
         {
            this._1G_a.stage;
            return 600;
         }
         return 600;
      }
      
      public function _9a() : InteractiveObject
      {
         return this._1G_a.stage.focus;
      }
      
      public function setFocus(param1:InteractiveObject) : void
      {
         this._1G_a.stage.focus = param1;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._1G_a.stage.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._1G_a.stage.removeEventListener(param1,param2,param3);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._1G_a.stage.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._1G_a.stage.hasEventListener(param1);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._1G_a.stage.willTrigger(param1);
      }
      
      public function _1M_() : String
      {
         return this._1G_a.stage.quality;
      }
      
      public function _0T_u(param1:String) : void
      {
         this._1G_a.stage.quality = param1;
      }
      
      public function getStage3Ds(param1:int) : com.company.assembleegameclient.util._01D_
      {
         if(stage3D == null)
         {
            stage3D = new com.company.assembleegameclient.util._01D_(this._1G_a.stage.stage3Ds[param1]);
         }
         return stage3D;
      }
   }
}
