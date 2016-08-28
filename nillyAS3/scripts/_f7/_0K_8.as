package _f7
{
   import flash.utils.getQualifiedClassName;
   import flash.errors.IllegalOperationError;
   
   public class _0K_8 implements _0V_a
   {
       
      
      protected var _zh:Array;
      
      protected var _1W_q:_f7._1p7;
      
      public function _0K_8(... rest)
      {
         this._1W_q = _f7._1p7.NIL;
         super();
         this.valueClasses = rest.length == 1 && rest[0] is Array?rest[0]:rest;
      }
      
      public function get valueClasses() : Array
      {
         return this._zh;
      }
      
      public function set valueClasses(param1:Array) : void
      {
         this._zh = !!param1?param1.slice():[];
         var _loc2_:int = this._zh.length;
         while(_loc2_--)
         {
            if(!(this._zh[_loc2_] is Class))
            {
               throw new ArgumentError("Invalid valueClasses argument: " + "item at index " + _loc2_ + " should be a Class but was:<" + this._zh[_loc2_] + ">." + getQualifiedClassName(this._zh[_loc2_]));
            }
         }
      }
      
      public function get _1mZ_() : uint
      {
         return this._1W_q.length;
      }
      
      public function addOnce(param1:Function) : _15B_
      {
         return this._2L_(param1,true);
      }
      
      public function remove(param1:Function) : _15B_
      {
         var _loc2_:_15B_ = this._1W_q.find(param1);
         if(!_loc2_)
         {
            return null;
         }
         this._1W_q = this._1W_q._1P_Y_(param1);
         return _loc2_;
      }
      
      public function removeAll() : void
      {
         this._1W_q = _f7._1p7.NIL;
      }
      
      public function dispatch(... rest) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = this._zh.length;
         var _loc3_:int = rest.length;
         if(_loc3_ < _loc2_)
         {
            throw new ArgumentError("Incorrect number of arguments. " + "Expected at least " + _loc2_ + " but received " + _loc3_ + ".");
         }
         while(_loc4_ < _loc2_)
         {
            if(!(rest[_loc4_] is this._zh[_loc4_] || rest[_loc4_] === null))
            {
               throw new ArgumentError("Value object <" + rest[_loc4_] + "> is not an instance of <" + this._zh[_loc4_] + ">.");
            }
            _loc4_++;
         }
         var _loc5_:_f7._1p7 = this._1W_q;
         if(_loc5_.nonEmpty)
         {
            while(_loc5_.nonEmpty)
            {
               _loc5_._1iX_.execute(rest);
               _loc5_ = _loc5_._1Z_;
            }
         }
      }
      
      protected function _2L_(param1:Function, param2:Boolean = false) : _15B_
      {
         var _loc3_:_15B_ = null;
         if(this._P_(param1,param2))
         {
            _loc3_ = new Slot(param1,this,param2);
            this._1W_q = this._1W_q.prepend(_loc3_);
            return _loc3_;
         }
         return this._1W_q.find(param1);
      }
      
      protected function _P_(param1:Function, param2:Boolean) : Boolean
      {
         if(!this._1W_q.nonEmpty)
         {
            return true;
         }
         var _loc3_:_15B_ = this._1W_q.find(param1);
         if(!_loc3_)
         {
            return true;
         }
         if(_loc3_.once != param2)
         {
            throw new IllegalOperationError("You cannot addOnce() then add() the same listener without removing the relationship first.");
         }
         return false;
      }
   }
}
