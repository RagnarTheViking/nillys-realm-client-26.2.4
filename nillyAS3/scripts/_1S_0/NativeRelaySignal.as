package _1S_0
{
   import _f7.Signal;
   import flash.events.IEventDispatcher;
   import flash.events.Event;
   import _f7._15B_;
   import _f7._1p7;
   import _f7.Slot;
   
   public class NativeRelaySignal extends Signal implements INativeDispatcher
   {
       
      
      protected var _0tA_:IEventDispatcher;
      
      protected var _0S_n:String;
      
      protected var _0tw:Class;
      
      public function NativeRelaySignal(param1:IEventDispatcher, param2:String, param3:Class = null)
      {
         super(param3 || Event);
         this._0I_3 = param2;
         this.eventClass = param3;
         this.target = param1;
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
         _zh = [this._0tw];
      }
      
      override public function set valueClasses(param1:Array) : void
      {
         this.eventClass = param1 && param1.length > 0?param1[0]:null;
      }
      
      override public function add(param1:Function) : _15B_
      {
         return this._110(param1);
      }
      
      override public function addOnce(param1:Function) : _15B_
      {
         return this._J_P_(param1);
      }
      
      public function _110(param1:Function, param2:int = 0) : _15B_
      {
         return this._vr(param1,false,param2);
      }
      
      public function _J_P_(param1:Function, param2:int = 0) : _15B_
      {
         return this._vr(param1,true,param2);
      }
      
      override public function remove(param1:Function) : _15B_
      {
         var _loc2_:Boolean = _1W_q.nonEmpty;
         var _loc3_:_15B_ = super.remove(param1);
         if(_loc2_ != _1W_q.nonEmpty)
         {
            this.target.removeEventListener(this.eventType,this.onNativeEvent);
         }
         return _loc3_;
      }
      
      override public function removeAll() : void
      {
         if(this.target)
         {
            this.target.removeEventListener(this.eventType,this.onNativeEvent);
         }
         super.removeAll();
      }
      
      override public function dispatch(... rest) : void
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
      
      protected function onNativeEvent(param1:Event) : void
      {
         var _loc2_:_1p7 = _1W_q;
         while(_loc2_.nonEmpty)
         {
            _loc2_._1iX_.execute1(param1);
            _loc2_ = _loc2_._1Z_;
         }
      }
      
      protected function _vr(param1:Function, param2:Boolean = false, param3:int = 0) : _15B_
      {
         var _loc5_:_15B_ = null;
         if(!this.target)
         {
            throw new ArgumentError("Target object cannot be null.");
         }
         var _loc4_:Boolean = _1W_q.nonEmpty;
         if(_P_(param1,param2))
         {
            _loc5_ = new Slot(param1,this,param2,param3);
            _1W_q = _1W_q.insertWithPriority(_loc5_);
         }
         else
         {
            _loc5_ = _1W_q.find(param1);
         }
         if(_loc4_ != _1W_q.nonEmpty)
         {
            this.target.addEventListener(this.eventType,this.onNativeEvent,false,param3);
         }
         return _loc5_;
      }
   }
}
