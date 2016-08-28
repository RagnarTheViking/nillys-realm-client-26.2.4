package _0Z_4
{
   import _0F_D_._12W_;
   import _wi.Injector;
   import _0pN_._1nd;
   
   public class _1ms implements _12W_
   {
       
      
      public var _T_X_:Injector;
      
      public var _O_x:Class;
      
      public var priority:int;
      
      public function _1ms()
      {
         super();
      }
      
      public function _V_S_() : int
      {
         return this.priority;
      }
      
      public function make() : _1nd
      {
         return this._T_X_.getInstance(this._O_x);
      }
   }
}
