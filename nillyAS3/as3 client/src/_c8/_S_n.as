package _c8
{
   import flash.utils.ByteArray;
   import flash.display.BitmapData;
   
   public class _S_n
   {
      
      private static const _1A_p:int = 1229472850;
      
      private static const _1N_3:int = 1229209940;
      
      private static const _sD_:int = 1950701684;
      
      private static const _0lt:int = 1767135348;
      
      private static const _0x2:int = 2052348020;
      
      private static const _O_X_:int = 1229278788;
      
      private static var _sH_:uint;
      
      private static var _1at:uint;
      
      private static var _1E_2:int;
      
      private static var _1mz:int;
      
      private static var _ne:int;
      
      private static var _0W_4:int;
      
      private static var _0A_u:int;
      
      private static var _0iW_:ByteArray;
      
      private static var buffer:ByteArray;
      
      private static var _1yT_:int;
      
      private static var _0C_q:int;
       
      
      public function _S_n()
      {
         super();
      }
      
      public static function _0Y_R_(param1:ByteArray) : BitmapData
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         _0iW_ = param1;
         buffer = new ByteArray();
         _0C_q = 4;
         _0iW_.position = 0;
         if(_0iW_.readUnsignedInt() != 2303741511)
         {
            return _1E_F_();
         }
         if(_0iW_.readUnsignedInt() != 218765834)
         {
            return _1E_F_();
         }
         var _loc4_:Array = _1wM_();
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            _0iW_.position = _loc4_[_loc3_].position;
            _loc2_ = true;
            if(_loc4_[_loc3_].type == _1A_p)
            {
               _loc5_++;
               if(_loc3_ == 0)
               {
                  _loc2_ = _T_C_(_loc4_[_loc3_].length);
               }
               else
               {
                  _loc2_ = false;
               }
            }
            if(_loc4_[_loc3_].type == _1N_3)
            {
               buffer.writeBytes(_0iW_,_0iW_.position,_loc4_[_loc3_].length);
            }
            if(!_loc2_ || _loc5_ > 1)
            {
               return _1E_F_();
            }
            _loc3_++;
         }
         var _loc6_:BitmapData = _zQ_();
         _0iW_ = null;
         buffer = null;
         return _loc6_;
      }
      
      public static function _e9(param1:ByteArray) : XML
      {
         var _loc2_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         _0iW_ = param1;
         _0iW_.position = 0;
         if(_0iW_.readUnsignedInt() != 2303741511)
         {
            _0iW_ = null;
            return null;
         }
         if(_0iW_.readUnsignedInt() != 218765834)
         {
            _0iW_ = null;
            return null;
         }
         var _loc3_:Array = _1wM_();
         var _loc4_:XML = <information/>;
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            if(_loc3_[_loc2_].type == _sD_)
            {
               _loc4_.appendChild(_1K_x(_loc3_[_loc2_].position,_loc3_[_loc2_].length));
            }
            if(_loc3_[_loc2_].type == _0lt)
            {
               _loc4_.appendChild(_0hP_(_loc3_[_loc2_].position,_loc3_[_loc2_].length));
            }
            if(_loc3_[_loc2_].type == _0x2)
            {
               _loc4_.appendChild(_18__(_loc3_[_loc2_].position,_loc3_[_loc2_].length));
            }
            _loc2_++;
         }
         _0iW_ = null;
         return _loc4_;
      }
      
      private static function _1K_x(param1:int, param2:int) : XML
      {
         var _loc3_:XML = <tEXt/>;
         var _loc4_:* = "";
         var _loc5_:* = "";
         var _loc6_:int = -1;
         _0iW_.position = param1;
         while(_0iW_.position < param1 + param2)
         {
            _loc6_ = _0iW_.readUnsignedByte();
            if(_loc6_ > 0)
            {
               _loc4_ = _loc4_ + String.fromCharCode(_loc6_);
               continue;
            }
            break;
         }
         _loc5_ = _0iW_.readUTFBytes(param1 + param2 - _0iW_.position);
         _loc3_.appendChild(new XML("<keyword>" + _loc4_ + "</keyword>"));
         _loc3_.appendChild(new XML("<text>" + _loc5_ + "</text>"));
         return _loc3_;
      }
      
      private static function _18__(param1:int, param2:int) : XML
      {
         var _loc3_:ByteArray = null;
         var _loc4_:XML = <zTXt/>;
         var _loc5_:* = "";
         var _loc6_:* = "";
         var _loc7_:int = -1;
         _0iW_.position = param1;
         while(_0iW_.position < param1 + param2)
         {
            _loc7_ = _0iW_.readUnsignedByte();
            if(_loc7_ > 0)
            {
               _loc5_ = _loc5_ + String.fromCharCode(_loc7_);
               continue;
            }
            break;
         }
         var _loc8_:int = _0iW_.readUnsignedByte();
         if(_loc8_ == 0)
         {
            _loc3_ = new ByteArray();
            _loc3_.writeBytes(_0iW_,_0iW_.position,param1 + param2 - _0iW_.position);
            _loc3_.uncompress();
            _loc6_ = _loc3_.readUTFBytes(_loc3_.length);
         }
         _loc4_.appendChild(new XML("<keyword>" + _loc5_ + "</keyword>"));
         _loc4_.appendChild(new XML("<text>" + _loc6_ + "</text>"));
         return _loc4_;
      }
      
      private static function _0hP_(param1:int, param2:int) : XML
      {
         var _loc3_:ByteArray = null;
         var _loc4_:XML = <iTXt/>;
         var _loc5_:* = "";
         var _loc6_:* = "";
         var _loc7_:* = "";
         var _loc8_:* = "";
         var _loc9_:int = -1;
         _0iW_.position = param1;
         while(_0iW_.position < param1 + param2)
         {
            _loc9_ = _0iW_.readUnsignedByte();
            if(_loc9_ > 0)
            {
               _loc5_ = _loc5_ + String.fromCharCode(_loc9_);
               continue;
            }
            break;
         }
         var _loc10_:* = _0iW_.readUnsignedByte() == 1;
         var _loc11_:int = _0iW_.readUnsignedByte();
         while(_0iW_.position < param1 + param2)
         {
            _loc9_ = _0iW_.readUnsignedByte();
            if(_loc9_ > 0)
            {
               _loc6_ = _loc6_ + String.fromCharCode(_loc9_);
               continue;
            }
            break;
         }
         while(_0iW_.position < param1 + param2)
         {
            _loc9_ = _0iW_.readUnsignedByte();
            if(_loc9_ > 0)
            {
               _loc7_ = _loc7_ + String.fromCharCode(_loc9_);
               continue;
            }
            break;
         }
         if(_loc10_)
         {
            if(_loc11_ == 0)
            {
               _loc3_ = new ByteArray();
               _loc3_.writeBytes(_0iW_,_0iW_.position,param1 + param2 - _0iW_.position);
               _loc3_.uncompress();
               _loc8_ = _loc3_.readUTFBytes(_loc3_.length);
            }
         }
         else
         {
            _loc8_ = _0iW_.readUTFBytes(param1 + param2 - _0iW_.position);
         }
         _loc4_.appendChild(new XML("<keyword>" + _loc5_ + "</keyword>"));
         _loc4_.appendChild(new XML("<text>" + _loc8_ + "</text>"));
         _loc4_.appendChild(new XML("<languageTag>" + _loc6_ + "</languageTag>"));
         _loc4_.appendChild(new XML("<translatedKeyword>" + _loc7_ + "</translatedKeyword>"));
         return _loc4_;
      }
      
      private static function _1E_F_() : BitmapData
      {
         _0iW_ = null;
         buffer = null;
         return null;
      }
      
      private static function _1wM_() : Array
      {
         var _loc1_:uint = 0;
         var _loc2_:int = 0;
         var _loc3_:Array = [];
         do
         {
            _loc1_ = _0iW_.readUnsignedInt();
            _loc2_ = _0iW_.readInt();
            _loc3_.push({
               "type":_loc2_,
               "position":_0iW_.position,
               "length":_loc1_
            });
            _0iW_.position = _0iW_.position + (_loc1_ + 4);
         }
         while(_loc2_ != _O_X_ && _0iW_.bytesAvailable > 0);
         
         return _loc3_;
      }
      
      private static function _T_C_(param1:int) : Boolean
      {
         if(param1 != 13)
         {
            return false;
         }
         _sH_ = _0iW_.readUnsignedInt();
         _1at = _0iW_.readUnsignedInt();
         _1E_2 = _0iW_.readUnsignedByte();
         _1mz = _0iW_.readUnsignedByte();
         _ne = _0iW_.readUnsignedByte();
         _0W_4 = _0iW_.readUnsignedByte();
         _0A_u = _0iW_.readUnsignedByte();
         if(_sH_ <= 0 || _1at <= 0)
         {
            return false;
         }
         switch(_1E_2)
         {
            case 1:
            case 2:
            case 4:
            case 8:
            case 16:
               switch(_1mz)
               {
                  case 0:
                     if(_1E_2 != 1 && _1E_2 != 2 && _1E_2 != 4 && _1E_2 != 8 && _1E_2 != 16)
                     {
                        return false;
                     }
                     break;
                  case 2:
                  case 4:
                  case 6:
                     if(_1E_2 != 8 && _1E_2 != 16)
                     {
                        return false;
                     }
                     break;
                  case 3:
                     if(_1E_2 != 1 && _1E_2 != 2 && _1E_2 != 4 && _1E_2 != 8)
                     {
                        return false;
                     }
                     break;
                  default:
                     return false;
               }
               if(_ne != 0 || _0W_4 != 0)
               {
                  return false;
               }
               if(_0A_u != 0 && _0A_u != 1)
               {
                  return false;
               }
               return true;
            default:
               return false;
         }
      }
      
      private static function _zQ_() : BitmapData
      {
         var bufferLen:uint = 0;
         var filter:int = 0;
         var i:int = 0;
         var r:uint = 0;
         var g:uint = 0;
         var b:uint = 0;
         var a:uint = 0;
         var bd:BitmapData = new BitmapData(_sH_,_1at);
         try
         {
            buffer.uncompress();
         }
         catch(err:*)
         {
            return null;
         }
         _1yT_ = 0;
         bufferLen = buffer.length;
         while(buffer.position < bufferLen)
         {
            filter = buffer.readUnsignedByte();
            if(filter == 0)
            {
               i = 0;
               while(i < _sH_)
               {
                  r = _jF_() << 16;
                  g = _jF_() << 8;
                  b = _jF_();
                  a = _jF_() << 24;
                  bd.setPixel32(i,_1yT_,a + r + g + b);
                  i = i + 1;
               }
            }
            else if(filter == 1)
            {
               i = 0;
               while(i < _sH_)
               {
                  r = _0bq() << 16;
                  g = _0bq() << 8;
                  b = _0bq();
                  a = _0bq() << 24;
                  bd.setPixel32(i,_1yT_,a + r + g + b);
                  i = i + 1;
               }
            }
            else if(filter == 2)
            {
               i = 0;
               while(i < _sH_)
               {
                  r = _1j7() << 16;
                  g = _1j7() << 8;
                  b = _1j7();
                  a = _1j7() << 24;
                  bd.setPixel32(i,_1yT_,a + r + g + b);
                  i = i + 1;
               }
            }
            else if(filter == 3)
            {
               i = 0;
               while(i < _sH_)
               {
                  r = _Z_E_() << 16;
                  g = _Z_E_() << 8;
                  b = _Z_E_();
                  a = _Z_E_() << 24;
                  bd.setPixel32(i,_1yT_,a + r + g + b);
                  i = i + 1;
               }
            }
            else if(filter == 4)
            {
               i = 0;
               while(i < _sH_)
               {
                  r = _1V_d() << 16;
                  g = _1V_d() << 8;
                  b = _1V_d();
                  a = _1V_d() << 24;
                  bd.setPixel32(i,_1yT_,a + r + g + b);
                  i = i + 1;
               }
            }
            else
            {
               buffer.position = buffer.position + _0C_q * _sH_;
            }
            _1yT_++;
         }
         return bd;
      }
      
      private static function _jF_() : uint
      {
         return buffer[buffer.position++];
      }
      
      private static function _0bq() : uint
      {
         var _loc1_:uint = buffer[buffer.position] + _jW_();
         _loc1_ = _loc1_ & 255;
         var _loc2_:* = buffer.position++;
         buffer[_loc2_] = _loc1_;
         return _loc1_;
      }
      
      private static function _1j7() : uint
      {
         var _loc1_:uint = buffer[buffer.position] + _0Z_K_();
         _loc1_ = _loc1_ & 255;
         var _loc2_:* = buffer.position++;
         buffer[_loc2_] = _loc1_;
         return _loc1_;
      }
      
      private static function _Z_E_() : uint
      {
         var _loc1_:uint = buffer[buffer.position] + Math.floor((_jW_() + _0Z_K_()) / 2);
         _loc1_ = _loc1_ & 255;
         var _loc2_:* = buffer.position++;
         buffer[_loc2_] = _loc1_;
         return _loc1_;
      }
      
      private static function _1V_d() : uint
      {
         var _loc1_:uint = buffer[buffer.position] + _0B_E_();
         _loc1_ = _loc1_ & 255;
         var _loc2_:* = buffer.position++;
         buffer[_loc2_] = _loc1_;
         return _loc1_;
      }
      
      private static function _0B_E_() : uint
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc1_:uint = _jW_();
         var _loc2_:uint = _0Z_K_();
         var _loc3_:uint = _22();
         _loc4_ = _loc1_ + _loc2_ - _loc3_;
         _loc5_ = Math.abs(_loc4_ - _loc1_);
         _loc6_ = Math.abs(_loc4_ - _loc2_);
         _loc7_ = Math.abs(_loc4_ - _loc3_);
         if(_loc5_ <= _loc6_ && _loc5_ <= _loc7_)
         {
            _loc8_ = _loc1_;
         }
         else if(_loc6_ <= _loc7_)
         {
            _loc8_ = _loc2_;
         }
         else
         {
            _loc8_ = _loc3_;
         }
         return _loc8_;
      }
      
      private static function _jW_() : uint
      {
         var _loc1_:int = _1yT_ * (_sH_ * _0C_q + 1);
         var _loc2_:int = buffer.position - _0C_q;
         if(_loc2_ <= _loc1_)
         {
            return 0;
         }
         return buffer[_loc2_];
      }
      
      private static function _0Z_K_() : uint
      {
         var _loc1_:int = buffer.position - (_sH_ * _0C_q + 1);
         if(_loc1_ < 0)
         {
            return 0;
         }
         return buffer[_loc1_];
      }
      
      private static function _22() : uint
      {
         var _loc1_:int = buffer.position - (_sH_ * _0C_q + 1);
         if(_loc1_ < 0)
         {
            return 0;
         }
         var _loc2_:int = (_1yT_ - 1) * (_sH_ * _0C_q + 1);
         _loc1_ = _loc1_ - _0C_q;
         if(_loc1_ <= _loc2_)
         {
            return 0;
         }
         return buffer[_loc1_];
      }
   }
}
