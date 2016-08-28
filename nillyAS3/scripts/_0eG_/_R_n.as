package _0eG_
{
   import flash.errors.IllegalOperationError;
   
   public class _R_n extends _4N_
   {
       
      
      public function _R_n()
      {
         super();
      }
      
      override public function describeMismatch(param1:Object, param2:Description) : void
      {
         this.matchesOrDescribesMismatch(param1,param2);
      }
      
      protected function matchesOrDescribesMismatch(param1:Object, param2:Description) : Boolean
      {
         throw new IllegalOperationError("DiagnosingMatcher#matches is abstract and must be overriden in a subclass");
      }
      
      override public function matches(param1:Object) : Boolean
      {
         return this.matchesOrDescribesMismatch(param1,new _17A_());
      }
   }
}
