package _1R_m
{
   import _0sm._0H_i;
   import _0sb._1it;
   
   public class _0bT_
   {
       
      
      [Inject]
      public var _1C_0:_0H_i;
      
      [Inject]
      public var _03M_:_1R_m._1H_h;
      
      public function _0bT_()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:_1it = null;
         _loc1_ = new _1it();
         _loc1_.name = "setlang";
         _loc1_.description = "Sets the locale language (defaults to en-US)";
         this._1C_0.dispatch(_loc1_,this._03M_);
      }
   }
}
