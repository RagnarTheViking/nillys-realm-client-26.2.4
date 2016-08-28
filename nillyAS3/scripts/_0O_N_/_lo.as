package _0O_N_
{
   import _0sm._0H_i;
   import _0sb._1it;
   
   public class _lo
   {
       
      
      [Inject]
      public var register:_0H_i;
      
      [Inject]
      public var setFocus:_0O_N_._1uf;
      
      public function _lo()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:_1it = null;
         _loc1_ = new _1it();
         _loc1_.name = "follow";
         _loc1_.description = "follow a game object (by name)";
         this.register.dispatch(_loc1_,this.setFocus);
      }
   }
}
