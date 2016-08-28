package _0l7
{
   import _0sm._0H_i;
   import _0sb._1it;
   
   public class _3f
   {
       
      
      [Inject]
      public var register:_0H_i;
      
      [Inject]
      public var _07Q_:_0l7._Y_U_;
      
      public function _3f()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:_1it = null;
         _loc1_ = new _1it();
         _loc1_.name = "caretaker";
         _loc1_.description = "opens the pets caretaker query UI";
         this.register.dispatch(_loc1_,this._07Q_);
      }
   }
}
