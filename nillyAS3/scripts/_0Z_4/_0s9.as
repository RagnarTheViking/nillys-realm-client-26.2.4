package _0Z_4
{
   import _0F_D_._12W_;
   import _wi.Injector;
   import _0pN_._1nd;
   import _f7.Signal;
   import _0pN_._1my;
   
   public class _0s9 implements _12W_
   {
       
      
      public var _T_X_:Injector;
      
      public var _0E_x:Class;
      
      public var priority:int;
      
      public function _0s9()
      {
         super();
      }
      
      public function _V_S_() : int
      {
         return this.priority;
      }
      
      public function make() : _1nd
      {
         var _loc1_:Signal = this._T_X_.getInstance(this._0E_x);
         return new _1my(_loc1_);
      }
   }
}
