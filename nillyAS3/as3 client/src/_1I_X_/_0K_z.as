package _1I_X_
{
   import flash.utils.ByteArray;
   import flash.display.BitmapData;
   
   public class _0K_z
   {
      
      private static var _0R_5:Array;
      
      private static var _0oL_:Boolean = false;
       
      
      public function _0K_z()
      {
         super();
      }
      
      public static function encode(param1:BitmapData) : ByteArray
      {
         var _loc2_:uint = 0;
         var _loc3_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeUnsignedInt(2303741511);
         _loc4_.writeUnsignedInt(218765834);
         var _loc5_:ByteArray = new ByteArray();
         _loc5_.writeInt(param1.width);
         _loc5_.writeInt(param1.height);
         _loc5_.writeUnsignedInt(134610944);
         _loc5_.writeByte(0);
         _1pN_(_loc4_,1229472850,_loc5_);
         var _loc6_:ByteArray = new ByteArray();
         while(_loc7_ < param1.height)
         {
            _loc6_.writeByte(0);
            if(!param1.transparent)
            {
               _loc3_ = 0;
               while(_loc3_ < param1.width)
               {
                  _loc2_ = param1.getPixel(_loc3_,_loc7_);
                  _loc6_.writeUnsignedInt(uint((_loc2_ & 16777215) << 8 | 255));
                  _loc3_++;
               }
            }
            else
            {
               _loc3_ = 0;
               while(_loc3_ < param1.width)
               {
                  _loc2_ = param1.getPixel32(_loc3_,_loc7_);
                  _loc6_.writeUnsignedInt(uint((_loc2_ & 16777215) << 8 | _loc2_ >>> 24));
                  _loc3_++;
               }
            }
            _loc7_++;
         }
         _loc6_.compress();
         _1pN_(_loc4_,1229209940,_loc6_);
         _1pN_(_loc4_,1229278788,null);
         return _loc4_;
      }
      
      private static function _1pN_(param1:ByteArray, param2:uint, param3:ByteArray) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc10_:int = 0;
         if(!_0oL_)
         {
            _0oL_ = true;
            _0R_5 = [];
            _loc5_ = 0;
            while(_loc5_ < 256)
            {
               _loc4_ = _loc5_;
               _loc6_ = 0;
               while(_loc6_ < 8)
               {
                  if(_loc4_ & 1)
                  {
                     _loc4_ = uint(uint(3988292384) ^ uint(_loc4_ >>> 1));
                  }
                  else
                  {
                     _loc4_ = uint(_loc4_ >>> 1);
                  }
                  _loc6_++;
               }
               _0R_5[_loc5_] = _loc4_;
               _loc5_++;
            }
         }
         if(param3 != null)
         {
            _loc7_ = param3.length;
         }
         param1.writeUnsignedInt(_loc7_);
         var _loc8_:uint = param1.position;
         param1.writeUnsignedInt(param2);
         if(param3 != null)
         {
            param1.writeBytes(param3);
         }
         var _loc9_:uint = param1.position;
         param1.position = _loc8_;
         _loc4_ = 4294967295;
         while(_loc10_ < _loc9_ - _loc8_)
         {
            _loc4_ = uint(_0R_5[(_loc4_ ^ param1.readUnsignedByte()) & uint(255)] ^ uint(_loc4_ >>> 8));
            _loc10_++;
         }
         _loc4_ = uint(_loc4_ ^ uint(4294967295));
         param1.position = _loc9_;
         param1.writeUnsignedInt(_loc4_);
      }
   }
}
