package _1Z_i
{
   import _J_4._1I_J_;
   import _J_4._U_D_;
   import flash.utils.Dictionary;
   import _1kz._1a9;
   import _J_4._1ex;
   import _1kz._0gB_;
   
   public class _12__ implements _1I_J_, _U_D_
   {
       
      
      private const _A_2:Dictionary = new Dictionary();
      
      private var _03L_:_1a9;
      
      public function _12__(param1:_1a9)
      {
         super();
         this._03L_ = param1;
      }
      
      public function toCommand(param1:Class) : _1ex
      {
         return this.locked(this._A_2[param1]) || this._01j(param1);
      }
      
      public function _T_p(param1:Class) : void
      {
         var _loc2_:_0gB_ = this._A_2[param1];
         _loc2_ && this._03L_._rS_(_loc2_);
         delete this._A_2[param1];
      }
      
      public function _P_Y_() : void
      {
         var _loc1_:_0gB_ = null;
         for each(_loc1_ in this._A_2)
         {
            this._03L_._rS_(_loc1_);
            delete this._A_2[_loc1_.commandClass];
         }
      }
      
      private function _01j(param1:Class) : _wL_
      {
         var _loc2_:_wL_ = new _wL_(param1);
         this._03L_._0N_x(_loc2_);
         this._A_2[param1] = _loc2_;
         return _loc2_;
      }
      
      private function locked(param1:_wL_) : _wL_
      {
         if(!param1)
         {
            return null;
         }
         param1._11v();
         return param1;
      }
   }
}
