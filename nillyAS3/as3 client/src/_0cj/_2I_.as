package _0cj
{
   import flash.events.EventDispatcher;
   import _0f._1iK_;
   import flash.utils.Dictionary;
   import _wi.Injector;
   import _0f._1F_b;
   import _1W_F_._15u;
   import _0f._0D_L_;
   import _I_w.guardsApprove;
   import _I_w.applyHooks;
   
   public class _2I_ extends EventDispatcher implements _1iK_
   {
       
      
      private const _dC_:Dictionary = new Dictionary();
      
      private var _A_A_:Injector;
      
      public function _2I_(param1:Injector)
      {
         super();
         this._A_A_ = param1;
      }
      
      public function _1bg(param1:Object, param2:_1F_b) : Object
      {
         return !!this._dC_[param1]?this._dC_[param1][param2]:null;
      }
      
      public function _1iD_(param1:Object, param2:Class, param3:Array) : Array
      {
         var _loc4_:_15u = null;
         var _loc5_:Object = null;
         var _loc6_:_1F_b = null;
         var _loc7_:Array = [];
         for each(_loc6_ in param3)
         {
            _loc5_ = this._1bg(param1,_loc6_);
            if(!_loc5_)
            {
               _loc4_ = _loc6_._0az;
               this._1z(_loc4_,param2,param1);
               _loc5_ = this._14T_(param1,_loc6_);
               this._J_5(_loc4_,param2,param1);
            }
            if(_loc5_)
            {
               _loc7_.push(_loc5_);
            }
         }
         return _loc7_;
      }
      
      public function _rD_(param1:Object) : void
      {
         var _loc2_:* = null;
         var _loc3_:Dictionary = this._dC_[param1];
         if(!_loc3_)
         {
            return;
         }
         if(hasEventListener(_0D_L_._0V_K_))
         {
            for(_loc2_ in _loc3_)
            {
               dispatchEvent(new _0D_L_(_0D_L_._0V_K_,_loc3_[_loc2_],param1,_loc2_ as _1F_b,this));
            }
         }
         delete this._dC_[param1];
      }
      
      public function _sj() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in this._dC_)
         {
            this._rD_(_loc1_);
         }
      }
      
      private function _14T_(param1:Object, param2:_1F_b) : Object
      {
         var _loc3_:Object = this._1bg(param1,param2);
         if(_loc3_)
         {
            return _loc3_;
         }
         if(guardsApprove(param2._P_O_,this._A_A_))
         {
            _loc3_ = this._A_A_.getInstance(param2._0R_u);
            this._A_A_.map(param2._0R_u)._1as(_loc3_);
            applyHooks(param2._1P_S_,this._A_A_);
            this._A_A_._1kw(param2._0R_u);
            this._1nf(_loc3_,param1,param2);
         }
         return _loc3_;
      }
      
      private function _1nf(param1:Object, param2:Object, param3:_1F_b) : void
      {
         this._dC_[param2] = this._dC_[param2] || new Dictionary();
         this._dC_[param2][param3] = param1;
         if(hasEventListener(_0D_L_._0xW_))
         {
            dispatchEvent(new _0D_L_(_0D_L_._0xW_,param1,param2,param3,this));
         }
      }
      
      private function _1z(param1:_15u, param2:Class, param3:Object) : void
      {
         var _loc4_:Class = null;
         var _loc5_:Vector.<Class> = this._wm(param1,param2);
         for each(_loc4_ in _loc5_)
         {
            this._A_A_.map(_loc4_)._1as(param3);
         }
      }
      
      private function _J_5(param1:_15u, param2:Class, param3:Object) : void
      {
         var _loc4_:Class = null;
         var _loc5_:Vector.<Class> = this._wm(param1,param2);
         for each(_loc4_ in _loc5_)
         {
            if(this._A_A_._T_c(_loc4_))
            {
               this._A_A_._1kw(_loc4_);
            }
         }
      }
      
      private function _wm(param1:_15u, param2:Class) : Vector.<Class>
      {
         var _loc3_:Vector.<Class> = param1._073.concat(param1._0uu);
         if(_loc3_.indexOf(param2) == -1)
         {
            _loc3_.push(param2);
         }
         return _loc3_;
      }
   }
}
