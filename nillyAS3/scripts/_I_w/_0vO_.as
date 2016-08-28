package _I_w
{
   import _1__8._4L_;
   
   public class _0vO_
   {
       
      
      private const _19D_:Vector.<String> = new Vector.<String>();
      
      private const _0gL_:_I_w.MessageDispatcher = new _I_w.MessageDispatcher();
      
      private const _callbacks:Array = [];
      
      private var _name:String;
      
      private var _U_h:_I_w._01d;
      
      private var _ew:String;
      
      private var _finalState:String;
      
      private var _preTransitionEvent:String;
      
      private var _transitionEvent:String;
      
      private var _postTransitionEvent:String;
      
      private var _15H_:Boolean;
      
      public function _0vO_(param1:String, param2:_I_w._01d)
      {
         super();
         this._name = param1;
         this._U_h = param2;
      }
      
      public function fromStates(... rest) : _0vO_
      {
         var _loc2_:String = null;
         for each(_loc2_ in rest)
         {
            this._19D_.push(_loc2_);
         }
         return this;
      }
      
      public function toStates(param1:String, param2:String) : _0vO_
      {
         this._ew = param1;
         this._finalState = param2;
         return this;
      }
      
      public function withEvents(param1:String, param2:String, param3:String) : _0vO_
      {
         this._preTransitionEvent = param1;
         this._transitionEvent = param2;
         this._postTransitionEvent = param3;
         this._15H_ && this._U_h._1er(param1,param2,param3);
         return this;
      }
      
      public function inReverse() : _0vO_
      {
         this._15H_ = true;
         this._U_h._1er(this._preTransitionEvent,this._transitionEvent,this._postTransitionEvent);
         return this;
      }
      
      public function _0c9(param1:Function) : _0vO_
      {
         this._0gL_._0gF_(this._name,param1);
         return this;
      }
      
      public function enter(param1:Function = null) : void
      {
         var initialState:String = null;
         var callback:Function = param1;
         if(this._U_h.state == this._finalState)
         {
            callback && safelyCallBack(callback,null,this._name);
            return;
         }
         if(this._U_h.state == this._ew)
         {
            callback && this._callbacks.push(callback);
            return;
         }
         if(this._15k())
         {
            this.reportError("Invalid transition",[callback]);
            return;
         }
         initialState = this._U_h.state;
         callback && this._callbacks.push(callback);
         this.setState(this._ew);
         this._0gL_._1R_6(this._name,function(param1:Object):void
         {
            var _loc2_:Function = null;
            if(param1)
            {
               setState(initialState);
               reportError(param1,_callbacks);
               return;
            }
            dispatch(_preTransitionEvent);
            dispatch(_transitionEvent);
            setState(_finalState);
            var _loc3_:Array = _callbacks.concat();
            _callbacks.length = 0;
            for each(_loc2_ in _loc3_)
            {
               safelyCallBack(_loc2_,null,_name);
            }
            dispatch(_postTransitionEvent);
         },this._15H_);
      }
      
      private function _15k() : Boolean
      {
         return this._19D_.length > 0 && this._19D_.indexOf(this._U_h.state) == -1;
      }
      
      private function setState(param1:String) : void
      {
         param1 && this._U_h._D_8(param1);
      }
      
      private function dispatch(param1:String) : void
      {
         if(param1 && this._U_h.hasEventListener(param1))
         {
            this._U_h.dispatchEvent(new _4L_(param1));
         }
      }
      
      private function reportError(param1:Object, param2:Array = null) : void
      {
         var _loc3_:_4L_ = null;
         var _loc4_:Function = null;
         var _loc5_:Error = param1 is Error?param1 as Error:new Error(param1);
         if(this._U_h.hasEventListener(_4L_.ERROR))
         {
            _loc3_ = new _4L_(_4L_.ERROR);
            _loc3_.error = _loc5_;
            this._U_h.dispatchEvent(_loc3_);
            if(param2)
            {
               for each(_loc4_ in param2)
               {
                  _loc4_ && safelyCallBack(_loc4_,_loc5_,this._name);
               }
               param2.length = 0;
            }
            return;
         }
         throw _loc5_;
      }
   }
}
