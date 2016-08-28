package _1S_0
{
   import flash.events.IEventDispatcher;
   import _f7._1p7;
   import flash.events.Event;
   import _f7._15B_;
   import _f7.Slot;
   import flash.errors.IllegalOperationError;
   
   public class _1mh implements INativeDispatcher
   {
       
      
      protected var _0tA_:IEventDispatcher;
      
      protected var _0S_n:String;
      
      protected var _0tw:Class;
      
      protected var _zh:Array;
      
      protected var _1W_q:_1p7;
      
      public function _1mh(param1:IEventDispatcher = null, param2:String = "", param3:Class = null)
      {
         super();
         this._1W_q = _1p7.NIL;
         this.target = param1;
         this._0I_3 = param2;
         this.eventClass = param3;
      }
      
      public function get eventType() : String
      {
         return this._0S_n;
      }
      
      public function set _0I_3(param1:String) : void
      {
         this._0S_n = param1;
      }
      
      public function get eventClass() : Class
      {
         return this._0tw;
      }
      
      public function set eventClass(param1:Class) : void
      {
         this._0tw = param1 || Event;
         this._zh = [this._0tw];
      }
      
      public function get valueClasses() : Array
      {
         return this._zh;
      }
      
      public function set valueClasses(param1:Array) : void
      {
         this.eventClass = param1 && param1.length > 0?param1[0]:null;
      }
      
      public function get _1mZ_() : uint
      {
         return this._1W_q.length;
      }
      
      public function get target() : IEventDispatcher
      {
         return this._0tA_;
      }
      
      public function set target(param1:IEventDispatcher) : void
      {
         if(param1 == this._0tA_)
         {
            return;
         }
         if(this._0tA_)
         {
            this.removeAll();
         }
         this._0tA_ = param1;
      }
      
      public function add(param1:Function) : _15B_
      {
         return this._110(param1);
      }
      
      public function _110(param1:Function, param2:int = 0) : _15B_
      {
         return this._vr(param1,false,param2);
      }
      
      public function addOnce(param1:Function) : _15B_
      {
         return this._J_P_(param1);
      }
      
      public function _J_P_(param1:Function, param2:int = 0) : _15B_
      {
         return this._vr(param1,true,param2);
      }
      
      public function remove(param1:Function) : _15B_
      {
         var _loc2_:_15B_ = this._1W_q.find(param1);
         if(!_loc2_)
         {
            return null;
         }
         this._0tA_.removeEventListener(this._0S_n,_loc2_.execute1);
         this._1W_q = this._1W_q._1P_Y_(param1);
         return _loc2_;
      }
      
      public function removeAll() : void
      {
         var _loc1_:_1p7 = this._1W_q;
         while(_loc1_.nonEmpty)
         {
            this.target.removeEventListener(this._0S_n,_loc1_._1iX_.execute1);
            _loc1_ = _loc1_._1Z_;
         }
         this._1W_q = _1p7.NIL;
      }
      
      public function dispatch(... rest) : void
      {
         if(null == rest)
         {
            throw new ArgumentError("Event object expected.");
         }
         if(rest.length != 1)
         {
            throw new ArgumentError("No more than one Event object expected.");
         }
         this.dispatchEvent(rest[0] as Event);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         if(!this.target)
         {
            throw new ArgumentError("Target object cannot be null.");
         }
         if(!param1)
         {
            throw new ArgumentError("Event object cannot be null.");
         }
         if(!(param1 is this.eventClass))
         {
            throw new ArgumentError("Event object " + param1 + " is not an instance of " + this.eventClass + ".");
         }
         if(param1.type != this.eventType)
         {
            throw new ArgumentError("Event object has incorrect type. Expected <" + this.eventType + "> but was <" + param1.type + ">.");
         }
         return this.target.dispatchEvent(param1);
      }
      
      protected function _vr(param1:Function, param2:Boolean = false, param3:int = 0) : _15B_
      {
         var _loc4_:_15B_ = null;
         if(!this.target)
         {
            throw new ArgumentError("Target object cannot be null.");
         }
         if(this._P_(param1,param2))
         {
            _loc4_ = new Slot(param1,this,param2,param3);
            this._1W_q = this._1W_q.prepend(_loc4_);
            this._0tA_.addEventListener(this._0S_n,_loc4_.execute1,false,param3);
            return _loc4_;
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
         if(_loc3_)
         {
            if(_loc3_.once != param2)
            {
               throw new IllegalOperationError("You cannot addOnce() then add() the same listener without removing the relationship first.");
            }
            return false;
         }
         return true;
      }
   }
}
