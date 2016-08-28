package com.company.assembleegameclient.engine3d
{
   import flash.geom.Vector3D;
   
   public class _001
   {
      
      public static const NONE:int = 0;
      
      public static const _15K_:int = 1;
      
      public static const _2N_:int = 2;
      
      public static const _u3:int = 3;
       
      
      public var _1wg:Vector3D;
      
      public var _1J_:Number;
      
      public function _001(param1:Vector3D = null, param2:Vector3D = null, param3:Vector3D = null)
      {
         super();
         if(param1 != null && param2 != null && param3 != null)
         {
            this._1wg = new Vector3D();
            _aZ_(param1,param2,param3,this._1wg);
            this._1J_ = -this._1wg.dotProduct(param1);
         }
      }
      
      public static function _aZ_(param1:Vector3D, param2:Vector3D, param3:Vector3D, param4:Vector3D) : void
      {
         var _loc5_:Number = param2.x - param1.x;
         var _loc6_:Number = param2.y - param1.y;
         var _loc7_:Number = param2.z - param1.z;
         var _loc8_:Number = param3.x - param1.x;
         var _loc9_:Number = param3.y - param1.y;
         var _loc10_:Number = param3.z - param1.z;
         param4.x = _loc6_ * _loc10_ - _loc7_ * _loc9_;
         param4.y = _loc7_ * _loc8_ - _loc5_ * _loc10_;
         param4.z = _loc5_ * _loc9_ - _loc6_ * _loc8_;
         param4.normalize();
      }
      
      public static function _U_4(param1:Vector.<Number>, param2:Vector3D) : void
      {
         var _loc3_:Number = param1[3] - param1[0];
         var _loc4_:Number = param1[4] - param1[1];
         var _loc5_:Number = param1[5] - param1[2];
         var _loc6_:Number = param1[6] - param1[0];
         var _loc7_:Number = param1[7] - param1[1];
         var _loc8_:Number = param1[8] - param1[2];
         param2.x = _loc4_ * _loc8_ - _loc5_ * _loc7_;
         param2.y = _loc5_ * _loc6_ - _loc3_ * _loc8_;
         param2.z = _loc3_ * _loc7_ - _loc4_ * _loc6_;
         param2.normalize();
      }
      
      public function _05m(param1:Vector3D) : int
      {
         var _loc2_:Number = this._1wg.dotProduct(param1) + this._1J_;
         if(_loc2_ > 0.001)
         {
            return _15K_;
         }
         if(_loc2_ < -0.001)
         {
            return _2N_;
         }
         return _u3;
      }
      
      public function _12R_(param1:Line3D) : Number
      {
         var _loc2_:Number = -this._1J_ - this._1wg.x * param1.v0_.x - this._1wg.y * param1.v0_.y - this._1wg.z * param1.v0_.z;
         var _loc3_:Number = this._1wg.x * (param1.v1_.x - param1.v0_.x) + this._1wg.y * (param1.v1_.y - param1.v0_.y) + this._1wg.z * (param1.v1_.z - param1.v0_.z);
         if(_loc3_ == 0)
         {
            return NaN;
         }
         return _loc2_ / _loc3_;
      }
      
      public function _5j(param1:Number, param2:Number) : Number
      {
         return -(this._1J_ + this._1wg.x * param1 + this._1wg.y * param2) / this._1wg.z;
      }
      
      public function toString() : String
      {
         return "Plane(n = " + this._1wg + ", d = " + this._1J_ + ")";
      }
   }
}
