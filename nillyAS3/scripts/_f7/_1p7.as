package _f7
{
   public final class _1p7
   {
      
      public static const NIL:_f7._1p7 = new _f7._1p7(null,null);
       
      
      public var _1iX_:_f7._15B_;
      
      public var _1Z_:_f7._1p7;
      
      public var nonEmpty:Boolean = false;
      
      public function _1p7(param1:_f7._15B_, param2:_f7._1p7 = null)
      {
         super();
         if(!param1 && !param2)
         {
            if(NIL)
            {
               throw new ArgumentError("Parameters head and tail are null. Use the NIL element instead.");
            }
            this.nonEmpty = false;
         }
         else
         {
            if(!param1)
            {
               throw new ArgumentError("Parameter head cannot be null.");
            }
            this._1iX_ = param1;
            this._1Z_ = param2 || NIL;
            this.nonEmpty = true;
         }
      }
      
      public function get length() : uint
      {
         var _loc1_:uint = 0;
         if(!this.nonEmpty)
         {
            return 0;
         }
         if(this._1Z_ == NIL)
         {
            return 1;
         }
         var _loc2_:_f7._1p7 = this;
         while(_loc2_.nonEmpty)
         {
            _loc1_++;
            _loc2_ = _loc2_._1Z_;
         }
         return _loc1_;
      }
      
      public function prepend(param1:_f7._15B_) : _f7._1p7
      {
         return new _f7._1p7(param1,this);
      }
      
      public function append(param1:_f7._15B_) : _f7._1p7
      {
         if(!param1)
         {
            return this;
         }
         if(!this.nonEmpty)
         {
            return new _f7._1p7(param1);
         }
         if(this._1Z_ == NIL)
         {
            return new _f7._1p7(param1).prepend(this._1iX_);
         }
         var _loc2_:_f7._1p7 = new _f7._1p7(this._1iX_);
         var _loc3_:_f7._1p7 = _loc2_;
         var _loc4_:_f7._1p7 = this._1Z_;
         while(_loc4_.nonEmpty)
         {
            _loc3_ = _loc3_._1Z_ = new _f7._1p7(_loc4_._1iX_);
            _loc4_ = _loc4_._1Z_;
         }
         _loc3_._1Z_ = new _f7._1p7(param1);
         return _loc2_;
      }
      
      public function insertWithPriority(param1:_f7._15B_) : _f7._1p7
      {
         if(!this.nonEmpty)
         {
            return new _f7._1p7(param1);
         }
         var _loc2_:int = param1.priority;
         if(_loc2_ > this._1iX_.priority)
         {
            return this.prepend(param1);
         }
         var _loc3_:_f7._1p7 = new _f7._1p7(this._1iX_);
         var _loc4_:_f7._1p7 = _loc3_;
         var _loc5_:_f7._1p7 = this._1Z_;
         while(_loc5_.nonEmpty)
         {
            if(_loc2_ > _loc5_._1iX_.priority)
            {
               _loc4_._1Z_ = _loc5_.prepend(param1);
               return _loc3_;
            }
            _loc4_ = _loc4_._1Z_ = new _f7._1p7(_loc5_._1iX_);
            _loc5_ = _loc5_._1Z_;
         }
         _loc4_._1Z_ = new _f7._1p7(param1);
         return _loc3_;
      }
      
      public function _1P_Y_(param1:Function) : _f7._1p7
      {
         if(!this.nonEmpty || param1 == null)
         {
            return this;
         }
         if(param1 == this._1iX_.listener)
         {
            return this._1Z_;
         }
         var _loc2_:_f7._1p7 = new _f7._1p7(this._1iX_);
         var _loc3_:_f7._1p7 = _loc2_;
         var _loc4_:_f7._1p7 = this._1Z_;
         while(_loc4_.nonEmpty)
         {
            if(_loc4_._1iX_.listener == param1)
            {
               _loc3_._1Z_ = _loc4_._1Z_;
               return _loc2_;
            }
            _loc3_ = _loc3_._1Z_ = new _f7._1p7(_loc4_._1iX_);
            _loc4_ = _loc4_._1Z_;
         }
         return this;
      }
      
      public function contains(param1:Function) : Boolean
      {
         if(!this.nonEmpty)
         {
            return false;
         }
         var _loc2_:_f7._1p7 = this;
         while(_loc2_.nonEmpty)
         {
            if(_loc2_._1iX_.listener == param1)
            {
               return true;
            }
            _loc2_ = _loc2_._1Z_;
         }
         return false;
      }
      
      public function find(param1:Function) : _f7._15B_
      {
         if(!this.nonEmpty)
         {
            return null;
         }
         var _loc2_:_f7._1p7 = this;
         while(_loc2_.nonEmpty)
         {
            if(_loc2_._1iX_.listener == param1)
            {
               return _loc2_._1iX_;
            }
            _loc2_ = _loc2_._1Z_;
         }
         return null;
      }
      
      public function toString() : String
      {
         var _loc1_:* = "";
         var _loc2_:_f7._1p7 = this;
         while(_loc2_.nonEmpty)
         {
            _loc1_ = _loc1_ + (_loc2_._1iX_ + " -> ");
            _loc2_ = _loc2_._1Z_;
         }
         _loc1_ = _loc1_ + "NIL";
         return "[List " + _loc1_ + "]";
      }
   }
}
