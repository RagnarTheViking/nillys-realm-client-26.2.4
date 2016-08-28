package _1I_2
{
   import flash.events.EventDispatcher;
   import _1J_2._1O_N_;
   import flash.display.DisplayObjectContainer;
   import flash.display.DisplayObject;
   
   public class _u__ extends EventDispatcher
   {
       
      
      private const _handlers:Vector.<_1O_N_> = new Vector.<_1O_N_>();
      
      private var _parent:_1I_2._u__;
      
      private var _O_a:DisplayObjectContainer;
      
      public function _u__(param1:DisplayObjectContainer)
      {
         super();
         this._O_a = param1;
      }
      
      public function get parent() : _1I_2._u__
      {
         return this._parent;
      }
      
      public function set parent(param1:_1I_2._u__) : void
      {
         this._parent = param1;
      }
      
      public function get container() : DisplayObjectContainer
      {
         return this._O_a;
      }
      
      public function get _0xi() : uint
      {
         return this._handlers.length;
      }
      
      public function _1jI_(param1:_1O_N_) : void
      {
         if(this._handlers.indexOf(param1) > -1)
         {
            return;
         }
         this._handlers.push(param1);
      }
      
      public function _1zC_(param1:_1O_N_) : void
      {
         var _loc2_:int = this._handlers.indexOf(param1);
         if(_loc2_ > -1)
         {
            this._handlers.splice(_loc2_,1);
            if(this._handlers.length == 0)
            {
               dispatchEvent(new _1sz(_1sz._L_U_));
            }
         }
      }
      
      public function _N_m(param1:DisplayObject, param2:Class) : void
      {
         var _loc3_:_1O_N_ = null;
         var _loc5_:int = 0;
         var _loc4_:uint = this._handlers.length;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = this._handlers[_loc5_] as _1O_N_;
            _loc3_._N_m(param1,param2);
            _loc5_++;
         }
      }
   }
}
