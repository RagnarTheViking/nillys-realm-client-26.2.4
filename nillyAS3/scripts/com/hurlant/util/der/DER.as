package com.hurlant.util.der
{
   import flash.utils.ByteArray;
   
   public class DER
   {
      
      public static var indent:String = "";
       
      
      public function DER()
      {
         super();
      }
      
      public static function parse(param1:ByteArray, param2:* = null) : IAsn1Type
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:ByteArray = null;
         var _loc6_:* = 0;
         var _loc7_:int = 0;
         var _loc8_:Sequence = null;
         var _loc9_:Array = null;
         var _loc10_:Set = null;
         var _loc11_:ByteString = null;
         var _loc12_:PrintableString = null;
         var _loc13_:UTCTime = null;
         var _loc14_:Object = null;
         var _loc15_:* = false;
         var _loc16_:Boolean = false;
         var _loc17_:String = null;
         var _loc18_:* = undefined;
         var _loc19_:IAsn1Type = null;
         var _loc20_:int = 0;
         var _loc21_:ByteArray = null;
         _loc3_ = int(param1.readUnsignedByte());
         var _loc22_:* = (_loc3_ & 32) != 0;
         _loc3_ = _loc3_ & 31;
         _loc4_ = int(param1.readUnsignedByte());
         if(_loc4_ >= 128)
         {
            _loc6_ = _loc4_ & 127;
            _loc4_ = 0;
            while(_loc6_ > 0)
            {
               _loc4_ = _loc4_ << 8 | param1.readUnsignedByte();
               _loc6_--;
            }
         }
         switch(_loc3_)
         {
            case 0:
            case 16:
               _loc7_ = param1.position;
               _loc8_ = new Sequence(_loc3_,_loc4_);
               _loc9_ = param2 as Array;
               if(_loc9_ != null)
               {
                  _loc9_ = _loc9_.concat();
               }
               while(param1.position < _loc7_ + _loc4_)
               {
                  _loc14_ = null;
                  if(_loc9_ != null)
                  {
                     _loc14_ = _loc9_.shift();
                  }
                  if(_loc14_ != null)
                  {
                     while(_loc14_ && _loc14_.optional)
                     {
                        _loc15_ = _loc14_.value is Array;
                        _loc16_ = isConstructedType(param1);
                        if(_loc15_ != _loc16_)
                        {
                           _loc8_.push(_loc14_.defaultValue);
                           _loc8_[_loc14_.name] = _loc14_.defaultValue;
                           _loc14_ = _loc9_.shift();
                           continue;
                        }
                        break;
                     }
                  }
                  if(_loc14_ != null)
                  {
                     _loc17_ = _loc14_.name;
                     _loc18_ = _loc14_.value;
                     if(_loc14_.extract)
                     {
                        _loc20_ = getLengthOfNextElement(param1);
                        _loc21_ = new ByteArray();
                        _loc21_.writeBytes(param1,param1.position,_loc20_);
                        _loc8_[_loc17_ + "_bin"] = _loc21_;
                     }
                     _loc19_ = DER.parse(param1,_loc18_);
                     _loc8_.push(_loc19_);
                     _loc8_[_loc17_] = _loc19_;
                  }
                  else
                  {
                     _loc8_.push(DER.parse(param1));
                  }
               }
               return _loc8_;
            case 17:
               _loc7_ = param1.position;
               _loc10_ = new Set(_loc3_,_loc4_);
               while(param1.position < _loc7_ + _loc4_)
               {
                  _loc10_.push(DER.parse(param1));
               }
               return _loc10_;
            case 2:
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _loc5_.position = 0;
               return new Integer(_loc3_,_loc4_,_loc5_);
            case 6:
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _loc5_.position = 0;
               return new ObjectIdentifier(_loc3_,_loc4_,_loc5_);
            default:
            case 3:
               if(param1[param1.position] == 0)
               {
                  param1.position++;
                  _loc4_--;
               }
            case 4:
               _loc11_ = new ByteString(_loc3_,_loc4_);
               param1.readBytes(_loc11_,0,_loc4_);
               return _loc11_;
            case 5:
               return null;
            case 19:
               _loc12_ = new PrintableString(_loc3_,_loc4_);
               _loc12_.setString(param1.readMultiByte(_loc4_,"US-ASCII"));
               return _loc12_;
            case 34:
            case 20:
               _loc12_ = new PrintableString(_loc3_,_loc4_);
               _loc12_.setString(param1.readMultiByte(_loc4_,"latin1"));
               return _loc12_;
            case 23:
               _loc13_ = new UTCTime(_loc3_,_loc4_);
               _loc13_.setUTCTime(param1.readMultiByte(_loc4_,"US-ASCII"));
               return _loc13_;
         }
      }
      
      private static function getLengthOfNextElement(param1:ByteArray) : int
      {
         var _loc2_:* = 0;
         var _loc3_:uint = param1.position;
         param1.position++;
         var _loc4_:* = int(param1.readUnsignedByte());
         if(_loc4_ >= 128)
         {
            _loc2_ = _loc4_ & 127;
            _loc4_ = 0;
            while(_loc2_ > 0)
            {
               _loc4_ = _loc4_ << 8 | param1.readUnsignedByte();
               _loc2_--;
            }
         }
         _loc4_ = int(_loc4_ + (param1.position - _loc3_));
         param1.position = _loc3_;
         return _loc4_;
      }
      
      private static function isConstructedType(param1:ByteArray) : Boolean
      {
         var _loc2_:int = param1[param1.position];
         return (_loc2_ & 32) != 0;
      }
      
      public static function wrapDER(param1:int, param2:ByteArray) : ByteArray
      {
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeByte(param1);
         var _loc4_:int = param2.length;
         if(_loc4_ < 128)
         {
            _loc3_.writeByte(_loc4_);
         }
         else if(_loc4_ < 256)
         {
            _loc3_.writeByte(1 | 128);
            _loc3_.writeByte(_loc4_);
         }
         else if(_loc4_ < 65536)
         {
            _loc3_.writeByte(2 | 128);
            _loc3_.writeByte(_loc4_ >> 8);
            _loc3_.writeByte(_loc4_);
         }
         else if(_loc4_ < 65536 * 256)
         {
            _loc3_.writeByte(3 | 128);
            _loc3_.writeByte(_loc4_ >> 16);
            _loc3_.writeByte(_loc4_ >> 8);
            _loc3_.writeByte(_loc4_);
         }
         else
         {
            _loc3_.writeByte(4 | 128);
            _loc3_.writeByte(_loc4_ >> 24);
            _loc3_.writeByte(_loc4_ >> 16);
            _loc3_.writeByte(_loc4_ >> 8);
            _loc3_.writeByte(_loc4_);
         }
         _loc3_.writeBytes(param2);
         _loc3_.position = 0;
         return _loc3_;
      }
   }
}
