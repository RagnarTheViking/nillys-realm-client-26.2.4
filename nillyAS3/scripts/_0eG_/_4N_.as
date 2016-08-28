package _0eG_
{
   import flash.errors.IllegalOperationError;
   
   public class _4N_ implements _xn
   {
       
      
      public function _4N_()
      {
         super();
      }
      
      public function describeMismatch(param1:Object, param2:Description) : void
      {
         param2.appendText("was ")._0uv(param1);
      }
      
      public function matches(param1:Object) : Boolean
      {
         throw new IllegalOperationError("BaseMatcher#matches must be override by subclass");
      }
      
      public function describeTo(param1:Description) : void
      {
         throw new IllegalOperationError("BaseMatcher#describeTo must be override by subclass");
      }
      
      public function toString() : String
      {
         return _0Z_e.toString(this);
      }
   }
}
