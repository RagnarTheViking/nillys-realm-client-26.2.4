package com.company.assembleegameclient.map
{
   import flash.utils.Dictionary;
   
   public class RegionLibrary
   {
      
      public static const _1T_r:Dictionary = new Dictionary();
      
      public static var _07h:Dictionary = new Dictionary();
       
      
      public function RegionLibrary()
      {
         super();
      }
      
      public static function add(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:int = 0;
         for each(_loc2_ in param1.Region)
         {
            _loc3_ = int(_loc2_.@type);
            _1T_r[_loc3_] = _loc2_;
            _07h[String(_loc2_.@id)] = _loc3_;
         }
      }
      
      public static function _M_(param1:int) : String
      {
         var _loc2_:XML = _1T_r[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         return String(_loc2_.@id);
      }
      
      public static function getColor(param1:int) : uint
      {
         var _loc2_:XML = _1T_r[param1];
         if(_loc2_ == null)
         {
            return 0;
         }
         return uint(_loc2_.Color);
      }
   }
}
