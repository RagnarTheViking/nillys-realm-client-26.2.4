package _0cj
{
   import _0nd._o2;
   import _0nd._1K_Z_;
   import _0nd._0m1;
   import flash.utils.Dictionary;
   import _1W_F_._15u;
   import _0f._J_c;
   import _0nd._09u;
   import _0f._1F_b;
   
   public class _Z_O_ implements _o2, _1K_Z_, _0m1
   {
       
      
      private const _A_2:Dictionary = new Dictionary();
      
      private var _matcher:_15u;
      
      private var _handler:_J_c;
      
      public function _Z_O_(param1:_15u, param2:_J_c)
      {
         super();
         this._matcher = param1;
         this._handler = param2;
      }
      
      public function toMediator(param1:Class) : _09u
      {
         return this._1C_X_(param1) || this._01j(param1);
      }
      
      public function _mC_(param1:Class) : _1F_b
      {
         return this._A_2[param1];
      }
      
      public function _1qe(param1:Class) : void
      {
         var _loc2_:_1F_b = this._A_2[param1];
         delete this._A_2[param1];
         this._handler._rS_(_loc2_);
      }
      
      public function _A_Y_() : void
      {
         var _loc1_:_1F_b = null;
         for each(_loc1_ in this._A_2)
         {
            delete this._A_2[_loc1_._0R_u];
            this._handler._rS_(_loc1_);
         }
      }
      
      private function _01j(param1:Class) : _0E_g
      {
         var _loc2_:_0E_g = new _0E_g(this._matcher,param1);
         this._handler._0N_x(_loc2_);
         this._A_2[param1] = _loc2_;
         return _loc2_;
      }
      
      private function _1C_X_(param1:Class) : _0E_g
      {
         var _loc2_:_0E_g = this._A_2[param1];
         if(_loc2_)
         {
            _loc2_._11v();
         }
         return _loc2_;
      }
   }
}
