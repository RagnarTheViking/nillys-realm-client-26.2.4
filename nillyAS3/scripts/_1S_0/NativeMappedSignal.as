package _1S_0
{
   import flash.utils.getQualifiedClassName;
   import flash.events.Event;
   import _f7._1p7;
   import flash.events.IEventDispatcher;
   
   public class NativeMappedSignal extends NativeRelaySignal
   {
       
      
      private var _mappingFunction:Function = null;
      
      public function NativeMappedSignal(param1:IEventDispatcher, param2:String, param3:Class = null, ... rest)
      {
         super(param1,param2,param3);
         this.valueClasses = rest;
      }
      
      protected function get mappingFunction() : Function
      {
         return this._mappingFunction;
      }
      
      override public function get eventClass() : Class
      {
         return _0tw;
      }
      
      override public function set eventClass(param1:Class) : void
      {
         _0tw = param1;
      }
      
      override public function set valueClasses(param1:Array) : void
      {
         _zh = !!param1?param1.slice():[];
         var _loc2_:int = _zh.length;
         while(_loc2_--)
         {
            if(!(_zh[_loc2_] is Class))
            {
               throw new ArgumentError("Invalid valueClasses argument: " + "item at index " + _loc2_ + " should be a Class but was:<" + _zh[_loc2_] + ">." + getQualifiedClassName(_zh[_loc2_]));
            }
         }
      }
      
      public function _0mG_(... rest) : NativeMappedSignal
      {
         var objectListOrFunction:Array = rest;
         if(objectListOrFunction.length == 1 && objectListOrFunction[0] is Function)
         {
            this._mappingFunction = objectListOrFunction[0] as Function;
            if(this._mappingFunction.length > 1)
            {
               throw new ArgumentError("Mapping function has " + this._mappingFunction.length + " arguments but it needs zero or one of type Event");
            }
         }
         else
         {
            this._mappingFunction = function():Object
            {
               return objectListOrFunction;
            };
         }
         return this;
      }
      
      protected function _1N_w(param1:Event) : Object
      {
         if(this.mappingFunction != null)
         {
            if(this.mappingFunction.length == 1)
            {
               return this.mappingFunction(param1);
            }
            return this.mappingFunction();
         }
         if(valueClasses.length == 0)
         {
            return [];
         }
         throw new ArgumentError("There are valueClasses set to be dispatched <" + valueClasses + "> but mappingFunction is null.");
      }
      
      override public function dispatchEvent(param1:Event) : Boolean
      {
         var _loc2_:Array = null;
         var _loc3_:Object = null;
         var _loc4_:Class = null;
         var _loc5_:int = 0;
         var _loc6_:Object = this._1N_w(param1);
         var _loc7_:int = valueClasses.length;
         if(_loc6_ is Array)
         {
            _loc2_ = _loc6_ as Array;
            _loc5_ = 0;
            while(_loc5_ < _loc7_)
            {
               _loc3_ = _loc2_[_loc5_];
               _loc4_ = valueClasses[_loc5_];
               if(!(_loc3_ === null || _loc3_ is _loc4_))
               {
                  throw new ArgumentError("Value object <" + _loc3_ + "> is not an instance of <" + _loc4_ + ">.");
               }
               _loc5_++;
            }
         }
         else
         {
            if(_loc7_ > 1)
            {
               throw new ArgumentError("Expected more than one value.");
            }
            if(!(_loc6_ is valueClasses[0]))
            {
               throw new ArgumentError("Mapping returned " + getQualifiedClassName(_loc6_) + ", expected " + valueClasses[0] + ".");
            }
         }
         return super.dispatchEvent(param1);
      }
      
      override protected function onNativeEvent(param1:Event) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Object = this._1N_w(param1);
         var _loc4_:_1p7 = _1W_q;
         if(_loc3_ is Array)
         {
            if(valueClasses.length == 1 && valueClasses[0] == Array)
            {
               while(_loc4_.nonEmpty)
               {
                  _loc4_._1iX_.execute1(_loc3_);
                  _loc4_ = _loc4_._1Z_;
               }
            }
            else
            {
               _loc2_ = _loc3_ as Array;
               while(_loc4_.nonEmpty)
               {
                  _loc4_._1iX_.execute(_loc2_);
                  _loc4_ = _loc4_._1Z_;
               }
            }
         }
         else
         {
            while(_loc4_.nonEmpty)
            {
               _loc4_._1iX_.execute1(_loc3_);
               _loc4_ = _loc4_._1Z_;
            }
         }
      }
   }
}
