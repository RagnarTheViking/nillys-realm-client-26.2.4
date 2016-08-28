package _0cj
{
   import _0f.IMediatorMap;
   import _1J_2._1O_N_;
   import flash.utils.Dictionary;
   import _0nd._0m1;
   import _0f._J_c;
   import _0f._1iK_;
   import _0nd._o2;
   import _1W_F_._0U_B_;
   import _1W_F_._do;
   import flash.display.DisplayObject;
   
   public class _1rI_ implements IMediatorMap, _1O_N_
   {
       
      
      private const _0xT_:Dictionary = new Dictionary();
      
      private const _Y_3:_0m1 = new _I_c();
      
      private var _handler:_J_c;
      
      private var _factory:_1iK_;
      
      public function _1rI_(param1:_1iK_, param2:_J_c = null)
      {
         super();
         this._factory = param1;
         this._handler = param2 || new _0P_0(this._factory);
      }
      
      public function _39(param1:_0U_B_) : _o2
      {
         return this._0xT_[param1._qm()._0C___] = this._0xT_[param1._qm()._0C___] || this._0cO_(param1);
      }
      
      public function map(param1:Class) : _o2
      {
         var _loc2_:_0U_B_ = new _do().allOf(param1);
         return this._39(_loc2_);
      }
      
      public function _1ho(param1:_0U_B_) : _0m1
      {
         return this._0xT_[param1._qm()._0C___] || this._Y_3;
      }
      
      public function _1kw(param1:Class) : _0m1
      {
         var _loc2_:_0U_B_ = new _do().allOf(param1);
         return this._1ho(_loc2_);
      }
      
      public function _N_m(param1:DisplayObject, param2:Class) : void
      {
         this._handler._N_m(param1,param2);
      }
      
      public function _0M_D_(param1:Object) : void
      {
         var _loc2_:Class = param1.constructor as Class;
         this._handler._0cc(param1,_loc2_);
      }
      
      public function _0br(param1:Object) : void
      {
         this._factory._rD_(param1);
      }
      
      private function _0cO_(param1:_0U_B_, param2:Class = null) : _o2
      {
         return new _Z_O_(param1._qm(),this._handler);
      }
   }
}
