package com.company.assembleegameclient.map
{
   public class GroundAnimation
   {
      
      public static const NONE:int = 0;
      
      public static const WAVE:int = 1;
      
      public static const FLOW:int = 2;
       
      
      public var type_:int = 0;
      
      public var dx_:Number = 0;
      
      public var dy_:Number = 0;
      
      public function GroundAnimation()
      {
         super();
      }
      
      public function _pO_(param1:XML) : void
      {
         switch(String(param1))
         {
            case "Wave":
               this.type_ = WAVE;
               break;
            case "Flow":
               this.type_ = FLOW;
         }
         this.dx_ = param1.@dx;
         this.dy_ = param1.@dy;
      }
   }
}
