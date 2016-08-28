package _lE_
{
   import _0sm._0H_i;
   import _0sb._1it;
   
   public class _10W_
   {
       
      
      [Inject]
      public var register:_0H_i;
      
      [Inject]
      public var _0Y_w:_lE_._0X_y;
      
      public function _10W_()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:_1it = null;
         _loc1_ = new _1it();
         _loc1_.name = "reskin";
         _loc1_.description = "opens the reskin UI";
         this.register.dispatch(_loc1_,this._0Y_w);
      }
   }
}
