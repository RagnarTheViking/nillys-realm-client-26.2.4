package _1I_2
{
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import flash.display.DisplayObjectContainer;
   import flash.display.DisplayObject;
   
   public class _O_g extends EventDispatcher
   {
       
      
      private const _bindings:Vector.<_1I_2._u__> = new Vector.<_1I_2._u__>();
      
      private const _1W_o:Vector.<_1I_2._u__> = new Vector.<_1I_2._u__>();
      
      private const _bindingByContainer:Dictionary = new Dictionary();
      
      public function _O_g()
      {
         super();
      }
      
      public function get _0hr() : Vector.<_1I_2._u__>
      {
         return this._bindings;
      }
      
      public function get _0L_u() : Vector.<_1I_2._u__>
      {
         return this._1W_o;
      }
      
      public function _rz(param1:DisplayObjectContainer) : _1I_2._u__
      {
         return this._bindingByContainer[param1] = this._bindingByContainer[param1] || this._6a(param1);
      }
      
      public function _G_m(param1:DisplayObjectContainer) : _1I_2._u__
      {
         var _loc2_:_1I_2._u__ = this._bindingByContainer[param1];
         _loc2_ && this._1S_6(_loc2_);
         return _loc2_;
      }
      
      public function _0E_G_(param1:DisplayObject) : _1I_2._u__
      {
         var _loc2_:_1I_2._u__ = null;
         var _loc3_:DisplayObjectContainer = param1.parent;
         while(_loc3_)
         {
            _loc2_ = this._bindingByContainer[_loc3_];
            if(_loc2_)
            {
               return _loc2_;
            }
            _loc3_ = _loc3_.parent;
         }
         return null;
      }
      
      public function _1W_3(param1:DisplayObjectContainer) : _1I_2._u__
      {
         return this._bindingByContainer[param1];
      }
      
      private function _6a(param1:DisplayObjectContainer) : _1I_2._u__
      {
         var _loc2_:_1I_2._u__ = null;
         var _loc3_:_1I_2._u__ = new _1I_2._u__(param1);
         this._bindings.push(_loc3_);
         _loc3_.addEventListener(_1sz._L_U_,this._1zB_);
         _loc3_.parent = this._0E_G_(param1);
         if(_loc3_.parent == null)
         {
            this._0B_N_(_loc3_);
         }
         for each(_loc2_ in this._bindingByContainer)
         {
            if(param1.contains(_loc2_.container))
            {
               if(!_loc2_.parent)
               {
                  this._1D_w(_loc2_);
                  _loc2_.parent = _loc3_;
               }
               else if(!param1.contains(_loc2_.parent.container))
               {
                  _loc2_.parent = _loc3_;
               }
            }
         }
         dispatchEvent(new _11M_(_11M_._0S_k,_loc3_.container));
         return _loc3_;
      }
      
      private function _1S_6(param1:_1I_2._u__) : void
      {
         var _loc2_:_1I_2._u__ = null;
         delete this._bindingByContainer[param1.container];
         var _loc3_:int = this._bindings.indexOf(param1);
         this._bindings.splice(_loc3_,1);
         param1.removeEventListener(_1sz._L_U_,this._1zB_);
         if(!param1.parent)
         {
            this._1D_w(param1);
         }
         for each(_loc2_ in this._bindingByContainer)
         {
            if(_loc2_.parent == param1)
            {
               _loc2_.parent = param1.parent;
               if(!_loc2_.parent)
               {
                  this._0B_N_(_loc2_);
               }
            }
         }
         dispatchEvent(new _11M_(_11M_._1G_X_,param1.container));
      }
      
      private function _0B_N_(param1:_1I_2._u__) : void
      {
         this._1W_o.push(param1);
         dispatchEvent(new _11M_(_11M_._cz,param1.container));
      }
      
      private function _1D_w(param1:_1I_2._u__) : void
      {
         var _loc2_:int = this._1W_o.indexOf(param1);
         this._1W_o.splice(_loc2_,1);
         dispatchEvent(new _11M_(_11M_._0nx,param1.container));
      }
      
      private function _1zB_(param1:_1sz) : void
      {
         this._1S_6(param1.target as _1I_2._u__);
      }
   }
}
