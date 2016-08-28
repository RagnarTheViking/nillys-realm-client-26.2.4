package com.hurlant.util.der
{
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   
   public class ObjectIdentifier implements IAsn1Type
   {
      
      {
         registerClassAlias("com.hurlant.util.der.ObjectIdentifier",ObjectIdentifier);
      }
      
      private var type:uint;
      
      private var len:uint;
      
      private var oid:Array;
      
      public function ObjectIdentifier(param1:uint = 0, param2:uint = 0, param3:* = null)
      {
         super();
         this.type = param1;
         this.len = param2;
         if(param3 is ByteArray)
         {
            this.parse(param3 as ByteArray);
         }
         else if(param3 is String)
         {
            this.generate(param3 as String);
         }
         else
         {
            throw new Error("Invalid call to new ObjectIdentifier");
         }
      }
      
      private function generate(param1:String) : void
      {
         this.oid = param1.split(".");
      }
      
      private function parse(param1:ByteArray) : void
      {
         var _loc2_:* = false;
         var _loc5_:uint = 0;
         var _loc3_:uint = param1.readUnsignedByte();
         var _loc4_:Array = [];
         _loc4_.push(uint(_loc3_ / 40));
         _loc4_.push(uint(_loc3_ % 40));
         while(param1.bytesAvailable > 0)
         {
            _loc3_ = param1.readUnsignedByte();
            _loc2_ = (_loc3_ & 128) == 0;
            _loc3_ = _loc3_ & 127;
            _loc5_ = _loc5_ * 128 + _loc3_;
            if(_loc2_)
            {
               _loc4_.push(_loc5_);
               _loc5_ = 0;
            }
         }
         this.oid = _loc4_;
      }
      
      public function getLength() : uint
      {
         return this.len;
      }
      
      public function getType() : uint
      {
         return this.type;
      }
      
      public function toDER() : ByteArray
      {
         var _loc1_:int = 0;
         var _loc2_:Array = [];
         _loc2_[0] = this.oid[0] * 40 + this.oid[1];
         var _loc3_:int = 2;
         while(_loc3_ < this.oid.length)
         {
            _loc1_ = parseInt(this.oid[_loc3_]);
            if(_loc1_ < 128)
            {
               _loc2_.push(_loc1_);
            }
            else if(_loc1_ < 128 * 128)
            {
               _loc2_.push(_loc1_ >> 7 | 128);
               _loc2_.push(_loc1_ & 127);
            }
            else if(_loc1_ < 128 * 128 * 128)
            {
               _loc2_.push(_loc1_ >> 14 | 128);
               _loc2_.push(_loc1_ >> 7 & 127 | 128);
               _loc2_.push(_loc1_ & 127);
            }
            else if(_loc1_ < 128 * 128 * 128 * 128)
            {
               _loc2_.push(_loc1_ >> 21 | 128);
               _loc2_.push(_loc1_ >> 14 & 127 | 128);
               _loc2_.push(_loc1_ >> 7 & 127 | 128);
               _loc2_.push(_loc1_ & 127);
            }
            else
            {
               throw new Error("OID element bigger than we thought. :(");
            }
            _loc3_++;
         }
         this.len = _loc2_.length;
         if(this.type == 0)
         {
            this.type = 6;
         }
         _loc2_.unshift(this.len);
         _loc2_.unshift(this.type);
         var _loc4_:ByteArray = new ByteArray();
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_[_loc3_] = _loc2_[_loc3_];
            _loc3_++;
         }
         return _loc4_;
      }
      
      public function toString() : String
      {
         return DER.indent + this.oid.join(".");
      }
      
      public function dump() : String
      {
         return "OID[" + this.type + "][" + this.len + "][" + this.toString() + "]";
      }
   }
}
