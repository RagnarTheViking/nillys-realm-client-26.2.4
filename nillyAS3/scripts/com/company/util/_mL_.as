package com.company.util
{
   import flash.display.DisplayObjectContainer;
   import flash.display.DisplayObject;
   
   public class _mL_
   {
       
      
      public function _mL_()
      {
         super();
      }
      
      public static function _1D_5(param1:DisplayObjectContainer, param2:DisplayObject) : void
      {
         if(param1 != null && param2 != null && !param1.contains(param2))
         {
            param1.addChild(param2);
         }
      }
      
      public static function _0g1(param1:DisplayObjectContainer, param2:DisplayObject) : void
      {
         if(param1 != null && param2 != null && param1.contains(param2))
         {
            param1.removeChild(param2);
         }
      }
   }
}
