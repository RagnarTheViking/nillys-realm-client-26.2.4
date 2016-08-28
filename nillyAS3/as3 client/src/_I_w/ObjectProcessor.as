package _I_w
{
   import _0eG_._xn;
   
   public class ObjectProcessor
   {
       
      
      private const _handlers:Array = [];
      
      public function ObjectProcessor()
      {
         super();
      }
      
      public function _1q9(param1:_xn, param2:Function) : void
      {
         this._handlers.push(new ObjectHandler(param1,param2));
      }
      
      public function _vx(param1:Object) : void
      {
         var _loc2_:ObjectHandler = null;
         for each(_loc2_ in this._handlers)
         {
            _loc2_.handle(param1);
         }
      }
   }
}

import _0eG_._xn;

class ObjectHandler
{
    
   
   private var _matcher:_xn;
   
   private var _handler:Function;
   
   function ObjectHandler(param1:_xn, param2:Function)
   {
      super();
      this._matcher = param1;
      this._handler = param2;
   }
   
   public function handle(param1:Object) : void
   {
      this._matcher.matches(param1) && this._handler(param1);
   }
}
