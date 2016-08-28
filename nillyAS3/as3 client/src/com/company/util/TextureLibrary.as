package com.company.util
{
   import flash.utils.Dictionary;
   import flash.display.BitmapData;
   import flash.media.Sound;
   import flash.media.SoundTransform;
   
   public class TextureLibrary
   {
      
      private static var _0D_y:Dictionary = new Dictionary();
      
      private static var _A_W_:Dictionary = new Dictionary();
      
      private static var _R_q:Dictionary = new Dictionary();
      
      private static var _N_y:Dictionary = new Dictionary();
       
      
      public function TextureLibrary(param1:StaticEnforcer)
      {
         super();
      }
      
      public static function _Q_H_(param1:String, param2:BitmapData) : void
      {
         _0D_y[param1] = param2;
         _N_y[param2] = param1;
      }
      
      public static function add(param1:String, param2:BitmapData, param3:int, param4:int) : void
      {
         var _loc6_:int = 0;
         _0D_y[param1] = param2;
         var _loc5_:_n5 = new _n5();
         _loc5_.addFromBitmapData(param2,param3,param4);
         _A_W_[param1] = _loc5_;
         while(_loc6_ < _loc5_._0D_y.length)
         {
            _N_y[_loc5_._0D_y[_loc6_]] = [param1,_loc6_];
            _loc6_++;
         }
      }
      
      public static function _1I_b(param1:String, param2:BitmapData) : void
      {
         var _loc3_:_n5 = _A_W_[param1];
         if(_loc3_ == null)
         {
            _loc3_ = new _n5();
            _A_W_[param1] = _loc3_;
         }
         _loc3_.add(param2);
         var _loc4_:int = _loc3_._0D_y.length - 1;
         _N_y[_loc3_._0D_y[_loc4_]] = [param1,_loc4_];
      }
      
      public static function _126(param1:String, param2:Class) : void
      {
         var _loc3_:Array = _R_q[param1];
         if(_loc3_ == null)
         {
            _R_q[param1] = new Array();
         }
         _R_q[param1].push(param2);
      }
      
      public static function _1__o(param1:BitmapData) : Object
      {
         return _N_y[param1];
      }
      
      public static function getImage(param1:String) : BitmapData
      {
         return _0D_y[param1];
      }
      
      public static function _0R_8(param1:String) : _n5
      {
         return _A_W_[param1];
      }
      
      public static function getBitmap(param1:String, param2:int) : BitmapData
      {
         var _loc3_:_n5 = _A_W_[param1];
         return _loc3_._0D_y[param2];
      }
      
      public static function _0pr(param1:String) : Sound
      {
         var _loc2_:Array = _R_q[param1];
         var _loc3_:int = Math.random() * _loc2_.length;
         return new _R_q[param1][_loc3_]();
      }
      
      public static function _fd(param1:String, param2:Number = 1) : void
      {
         var _loc6_:SoundTransform = null;
         var _loc3_:Array = _R_q[param1];
         var _loc4_:int = Math.random() * _loc3_.length;
         var _loc5_:Sound = new _R_q[param1][_loc4_]();
         if(param2 != 1)
         {
            _loc6_ = new SoundTransform(param2);
         }
         _loc5_.play(0,0,_loc6_);
      }
   }
}

class StaticEnforcer
{
    
   
   function StaticEnforcer()
   {
      super();
   }
}
