package com.hurlant.util.der
{
   import flash.utils.ByteArray;
   
   public dynamic class Sequence extends Array implements IAsn1Type
   {
       
      
      protected var type:uint;
      
      protected var len:uint;
      
      public function Sequence(param1:uint = 48, param2:uint = 0)
      {
         super();
         this.type = param1;
         this.len = param2;
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
         var _loc1_:IAsn1Type = null;
         var _loc3_:int = 0;
         var _loc2_:ByteArray = new ByteArray();
         while(_loc3_ < length)
         {
            _loc1_ = this[_loc3_];
            if(_loc1_ == null)
            {
               _loc2_.writeByte(5);
               _loc2_.writeByte(0);
            }
            else
            {
               _loc2_.writeBytes(_loc1_.toDER());
            }
            _loc3_++;
         }
         return DER.wrapDER(this.type,_loc2_);
      }
      
      public function toString() : String
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc3_:String = DER.indent;
         DER.indent = DER.indent + "    ";
         var _loc4_:* = "";
         while(_loc5_ < length)
         {
            if(this[_loc5_] != null)
            {
               _loc1_ = false;
               for(_loc2_ in this)
               {
                  if(_loc5_.toString() != _loc2_ && this[_loc5_] == this[_loc2_])
                  {
                     _loc4_ = _loc4_ + (_loc2_ + ": " + this[_loc5_] + "\n");
                     _loc1_ = true;
                     break;
                  }
               }
               if(!_loc1_)
               {
                  _loc4_ = _loc4_ + (this[_loc5_] + "\n");
               }
            }
            _loc5_++;
         }
         DER.indent = _loc3_;
         return DER.indent + "Sequence[" + this.type + "][" + this.len + "][\n" + _loc4_ + "\n" + _loc3_ + "]";
      }
      
      public function findAttributeValue(param1:String) : IAsn1Type
      {
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:ObjectIdentifier = null;
         for each(_loc2_ in this)
         {
            if(_loc2_ is Set)
            {
               _loc3_ = _loc2_[0];
               if(_loc3_ is Sequence)
               {
                  _loc4_ = _loc3_[0];
                  if(_loc4_ is ObjectIdentifier)
                  {
                     _loc5_ = _loc4_ as ObjectIdentifier;
                     if(_loc5_.toString() == param1)
                     {
                        return _loc3_[1] as IAsn1Type;
                     }
                  }
               }
            }
         }
         return null;
      }
   }
}
