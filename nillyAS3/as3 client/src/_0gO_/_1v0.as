package _0gO_
{
   import flash.geom.Matrix3D;
   import flash.utils.ByteArray;
   
   public class _1v0
   {
       
      
      public function _1v0()
      {
         super();
      }
      
      public static function _0h(param1:Number = 90, param2:Number = 1, param3:Number = 1, param4:Number = 2048) : Matrix3D
      {
         var _loc5_:Number = param3 * Math.tan(param1 * Math.PI / 360);
         var _loc6_:Number = -_loc5_;
         var _loc7_:Number = _loc6_ * param2;
         var _loc8_:Number = _loc5_ * param2;
         var _loc9_:Number = 2 * param3 / (_loc8_ - _loc7_);
         var _loc10_:Number = 2 * param3 / (_loc5_ - _loc6_);
         var _loc11_:Number = (_loc8_ + _loc7_) / (_loc8_ - _loc7_);
         var _loc12_:Number = (_loc5_ + _loc6_) / (_loc5_ - _loc6_);
         var _loc13_:Number = -(param4 + param3) / (param4 - param3);
         var _loc14_:Number = -2 * (param4 * param3) / (param4 - param3);
         return new Matrix3D(Vector.<Number>([_loc9_,0,0,0,0,_loc10_,0,0,_loc11_,_loc12_,_loc13_,-1,0,0,_loc14_,0]));
      }
      
      public static function _az(param1:ByteArray, param2:int) : String
      {
         var _loc3_:uint = 0;
         var _loc5_:int = 0;
         var _loc4_:* = "";
         while(_loc5_ < param2)
         {
            _loc3_ = param1.readUnsignedByte();
            if(_loc3_ === 0)
            {
               param1.position = param1.position + Math.max(0,param2 - (_loc5_ + 1));
               break;
            }
            _loc4_ = _loc4_ + String.fromCharCode(_loc3_);
            _loc5_++;
         }
         return _loc4_;
      }
      
      public static function _0dL_(param1:uint) : uint
      {
         param1--;
         param1 = param1 | param1 >> 1;
         param1 = param1 | param1 >> 2;
         param1 = param1 | param1 >> 4;
         param1 = param1 | param1 >> 8;
         param1 = param1 | param1 >> 16;
         return param1 + 1;
      }
   }
}
