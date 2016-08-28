package com.company.assembleegameclient.engine3d
{
   import flash.geom.Vector3D;
   
   public class _04S_
   {
      
      public static const LIGHT_VECTOR:Vector3D = _U_Q_();
       
      
      public function _04S_()
      {
         super();
      }
      
      public static function _0T_h(param1:Vector3D, param2:Number) : Number
      {
         var _loc3_:Number = Math.max(0,param1.dotProduct(LIGHT_VECTOR));
         return param2 + (1 - param2) * _loc3_;
      }
      
      private static function _U_Q_() : Vector3D
      {
         var _loc1_:Vector3D = new Vector3D(1,3,2);
         _loc1_.normalize();
         return _loc1_;
      }
   }
}
