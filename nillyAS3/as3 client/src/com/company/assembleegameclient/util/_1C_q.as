package com.company.assembleegameclient.util
{
   import flash.utils.Dictionary;
   
   public class _1C_q
   {
      
      private static var _1bM_:Dictionary = new Dictionary();
       
      
      public function _1C_q()
      {
         super();
      }
      
      public static function _1I_j(param1:Class) : Object
      {
         var _loc2_:Vector.<Object> = _1bM_[param1];
         if(_loc2_ == null)
         {
            _loc2_ = new Vector.<Object>();
            _1bM_[param1] = _loc2_;
         }
         else if(_loc2_.length > 0)
         {
            return _loc2_.pop();
         }
         return new param1();
      }
      
      public static function _0Z_C_(param1:*, param2:Object) : void
      {
         var _loc3_:Vector.<Object> = _1bM_[param1];
         if(_loc3_ == null)
         {
            _loc3_ = new Vector.<Object>();
            _1bM_[param1] = _loc3_;
         }
         _loc3_.push(param2);
      }
      
      public static function getObject(param1:*) : Object
      {
         var _loc2_:Vector.<Object> = _1bM_[param1];
         if(_loc2_ != null && _loc2_.length > 0)
         {
            return _loc2_.pop();
         }
         return null;
      }
      
      public static function dump(param1:*) : void
      {
         delete _1bM_[param1];
      }
      
      public static function _4B_(param1:Object) : void
      {
         var _loc2_:Class = Object(param1).constructor;
         var _loc3_:Vector.<Object> = _1bM_[_loc2_];
         if(_loc3_ == null)
         {
            _loc3_ = new Vector.<Object>();
            _1bM_[_loc2_] = _loc3_;
         }
         _loc3_.push(param1);
      }
   }
}
