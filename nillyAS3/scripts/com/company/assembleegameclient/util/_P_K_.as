package com.company.assembleegameclient.util
{
   import flash.display.DisplayObject;
   
   public class _P_K_
   {
       
      
      public function _P_K_()
      {
         super();
      }
      
      public static function _1I_p(param1:DisplayObject, param2:Class) : DisplayObject
      {
         while(param1 && !(param1 is param2))
         {
            param1 = param1.parent;
         }
         return param1;
      }
      
      public static function _0Z_w(param1:DisplayObject, ... rest) : DisplayObject
      {
         var _loc3_:Class = null;
         while(param1)
         {
            for each(_loc3_ in rest)
            {
               if(param1 is _loc3_)
               {
                  return param1;
               }
            }
            param1 = param1.parent;
         }
         return param1;
      }
   }
}
