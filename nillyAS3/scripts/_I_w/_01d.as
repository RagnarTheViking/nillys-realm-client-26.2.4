package _I_w
{
   import flash.events.EventDispatcher;
   import _1__8._06G_;
   import flash.utils.Dictionary;
   import _1__8._9h;
   import _1__8._4L_;
   import flash.events.IEventDispatcher;
   
   public class _01d extends EventDispatcher implements _06G_
   {
       
      
      private const _0T_X_:Dictionary = new Dictionary();
      
      private var _state:String = "uninitialized";
      
      private var _0tA_:Object;
      
      private var _1T_k:int;
      
      private var _0gK_:_I_w._0vO_;
      
      private var _hh:_I_w._0vO_;
      
      private var _K_3:_I_w._0vO_;
      
      private var _0K___:_I_w._0vO_;
      
      public function _01d(param1:Object)
      {
         super();
         this._0tA_ = param1;
         this._12M_();
      }
      
      public function get state() : String
      {
         return this._state;
      }
      
      public function get target() : Object
      {
         return this._0tA_;
      }
      
      public function get initialized() : Boolean
      {
         return this._state != _9h._A_X_ && this._state != _9h._0kZ_;
      }
      
      public function get active() : Boolean
      {
         return this._state == _9h._O_L_;
      }
      
      public function get suspended() : Boolean
      {
         return this._state == _9h._R_C_;
      }
      
      public function get destroyed() : Boolean
      {
         return this._state == _9h._K_R_;
      }
      
      public function initialize(param1:Function = null) : void
      {
         this._0gK_.enter(param1);
      }
      
      public function suspend(param1:Function = null) : void
      {
         this._hh.enter(param1);
      }
      
      public function resume(param1:Function = null) : void
      {
         this._K_3.enter(param1);
      }
      
      public function destroy(param1:Function = null) : void
      {
         this._0K___.enter(param1);
      }
      
      public function _0H_v(param1:Function) : _06G_
      {
         this._0gK_._0c9(param1);
         return this;
      }
      
      public function _1S_s(param1:Function) : _06G_
      {
         this._hh._0c9(param1);
         return this;
      }
      
      public function _V_U_(param1:Function) : _06G_
      {
         this._K_3._0c9(param1);
         return this;
      }
      
      public function _1K_s(param1:Function) : _06G_
      {
         this._0K___._0c9(param1);
         return this;
      }
      
      public function _15q(param1:Function) : _06G_
      {
         this.addEventListener(_4L_._1ji,this._65(param1,true));
         return this;
      }
      
      public function _1xK_(param1:Function) : _06G_
      {
         this.addEventListener(_4L_._1T_E_,this._65(param1));
         return this;
      }
      
      public function _yB_(param1:Function) : _06G_
      {
         this.addEventListener(_4L_._0nh,this._65(param1));
         return this;
      }
      
      public function _0O_v(param1:Function) : _06G_
      {
         this.addEventListener(_4L_._01I_,this._65(param1,true));
         return this;
      }
      
      public function _1dl(param1:Function) : _06G_
      {
         this.addEventListener(_4L_._rx,this._65(param1,true));
         return this;
      }
      
      public function _1__X_(param1:Function) : _06G_
      {
         this.addEventListener(_4L_._0t1,this._65(param1));
         return this;
      }
      
      public function _z8(param1:Function) : _06G_
      {
         this.addEventListener(_4L_._0kH_,this._65(param1));
         return this;
      }
      
      public function _Y_W_(param1:Function) : _06G_
      {
         this.addEventListener(_4L_._1nG_,this._65(param1,true));
         return this;
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         param4 = this._004(param1,param4);
         super.addEventListener(param1,param2,param3,param4,param5);
      }
      
      function _D_8(param1:String) : void
      {
         if(this._state == param1)
         {
            return;
         }
         this._state = param1;
      }
      
      function _1er(... rest) : void
      {
         var _loc2_:String = null;
         for each(_loc2_ in rest)
         {
            this._0T_X_[_loc2_] = true;
         }
      }
      
      private function _12M_() : void
      {
         this._0gK_ = new _I_w._0vO_(_4L_._0W_8,this).fromStates(_9h._A_X_).toStates(_9h._0kZ_,_9h._O_L_).withEvents(_4L_._0W_8,_4L_._1ji,_4L_._rx);
         this._hh = new _I_w._0vO_(_4L_._0M_e,this).fromStates(_9h._O_L_).toStates(_9h._0a8,_9h._R_C_).withEvents(_4L_._0M_e,_4L_._1T_E_,_4L_._0t1).inReverse();
         this._K_3 = new _I_w._0vO_(_4L_._P_z,this).fromStates(_9h._R_C_).toStates(_9h._0A_F_,_9h._O_L_).withEvents(_4L_._P_z,_4L_._0nh,_4L_._0kH_);
         this._0K___ = new _I_w._0vO_(_4L_._1X_W_,this).fromStates(_9h._R_C_,_9h._O_L_).toStates(_9h._sI_,_9h._K_R_).withEvents(_4L_._1X_W_,_4L_._01I_,_4L_._1nG_).inReverse();
      }
      
      private function _004(param1:String, param2:int) : int
      {
         return param2 == 0 && this._0T_X_[param1]?int(this._1T_k++):int(param2);
      }
      
      private function _65(param1:Function, param2:Boolean = false) : Function
      {
         var handler:Function = param1;
         var once:Boolean = param2;
         if(handler.length > 1)
         {
            throw new Error("When and After handlers must accept 0-1 arguments");
         }
         if(handler.length == 1)
         {
            return function(param1:_4L_):void
            {
               once && IEventDispatcher(param1.target).removeEventListener(param1.type,arguments.callee);
               handler(param1.type);
            };
         }
         return function(param1:_4L_):void
         {
            once && IEventDispatcher(param1.target).removeEventListener(param1.type,arguments.callee);
            handler();
         };
      }
   }
}
