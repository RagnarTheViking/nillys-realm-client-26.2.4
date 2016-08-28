package com.company.util
{
   import flash.geom.Rectangle;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   
   public class ConversionUtil
   {
       
      
      public function ConversionUtil(param1:StaticEnforcer)
      {
         super();
      }
      
      public static function _0G_X_(param1:Object, param2:String = ",") : Array
      {
         if(param1 == null)
         {
            return new Array();
         }
         return param1.toString().split(param2).map(_0V_e);
      }
      
      public static function _z(param1:Object, param2:String = ",") : Array
      {
         if(param1 == null)
         {
            return new Array();
         }
         return param1.toString().split(param2).map(mapParseFloat);
      }
      
      public static function _1b5(param1:Object, param2:String = ",") : Vector.<int>
      {
         if(param1 == null)
         {
            return new Vector.<int>();
         }
         return Vector.<int>(param1.toString().split(param2).map(_0V_e));
      }
      
      public static function _0rp(param1:Object, param2:String = ",") : Vector.<Number>
      {
         if(param1 == null)
         {
            return new Vector.<Number>();
         }
         return Vector.<Number>(param1.toString().split(param2).map(mapParseFloat));
      }
      
      public static function _Z_M_(param1:Object, param2:String = ",") : Array
      {
         if(param1 == null)
         {
            return new Array();
         }
         return param1.toString().split(param2);
      }
      
      public static function _sQ_(param1:Object, param2:String = ",") : Rectangle
      {
         if(param1 == null)
         {
            return new Rectangle();
         }
         var _loc3_:Array = param1.toString().split(param2).map(mapParseFloat);
         return _loc3_ == null || _loc3_.length < 4?new Rectangle():new Rectangle(_loc3_[0],_loc3_[1],_loc3_[2],_loc3_[3]);
      }
      
      public static function _1O_q(param1:Object, param2:String = ",") : Point
      {
         if(param1 == null)
         {
            return new Point();
         }
         var _loc3_:Array = param1.toString().split(param2).map(ConversionUtil.mapParseFloat);
         return _loc3_ == null || _loc3_.length < 2?new Point():new Point(_loc3_[0],_loc3_[1]);
      }
      
      public static function _use(param1:Object, param2:String = ",") : Array
      {
         var _loc3_:Array = new Array();
         if(param1 == null)
         {
            _loc3_.push(new Point());
            _loc3_.push(new Point());
            return _loc3_;
         }
         var _loc4_:Array = param1.toString().split(param2).map(ConversionUtil.mapParseFloat);
         if(_loc4_ == null || _loc4_.length < 4)
         {
            _loc3_.push(new Point());
            _loc3_.push(new Point());
            return _loc3_;
         }
         _loc3_.push(new Point(_loc4_[0],_loc4_[1]));
         _loc3_.push(new Point(_loc4_[2],_loc4_[3]));
         return _loc3_;
      }
      
      public static function _1R_a(param1:Object, param2:String = ",") : Vector3D
      {
         if(param1 == null)
         {
            return new Vector3D();
         }
         var _loc3_:Array = param1.toString().split(param2).map(ConversionUtil.mapParseFloat);
         return _loc3_ == null || _loc3_.length < 3?new Vector3D():new Vector3D(_loc3_[0],_loc3_[1],_loc3_[2]);
      }
      
      public static function _1jc(param1:Object, param2:String = ",") : Vector.<int>
      {
         if(param1 == null)
         {
            return new Vector.<int>();
         }
         return Vector.<int>(param1.toString().split(param2).map(_ps));
      }
      
      public static function _1I_A_(param1:Object, param2:Vector.<Number>, param3:String = ",") : void
      {
         var _loc4_:Number = NaN;
         if(param1 == null)
         {
            return;
         }
         var _loc5_:Array = param1.toString().split(param3).map(mapParseFloat);
         for each(_loc4_ in _loc5_)
         {
            param2.push(_loc4_);
         }
      }
      
      public static function _1D_G_(param1:Object, param2:Vector.<int>, param3:String = ",") : void
      {
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return;
         }
         var _loc5_:Array = param1.toString().split(param3).map(mapParseFloat);
         for each(_loc4_ in _loc5_)
         {
            param2.push(_loc4_);
         }
      }
      
      public static function mapParseFloat(param1:*, ... rest) : Number
      {
         return parseFloat(param1);
      }
      
      public static function _0V_e(param1:*, ... rest) : Number
      {
         return parseInt(param1);
      }
      
      public static function _ps(param1:*, ... rest) : Number
      {
         return String(param1).charCodeAt();
      }
      
      public static function _051(param1:Vector3D) : Array
      {
         return [param1.x,param1.y,param1.z];
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
