package _i__
{
   import _wi.Injector;
   import flash.utils.Dictionary;
   
   public class _0Q_ implements _i__._0__L_
   {
       
      
      public var provider:_i__._0__L_;
      
      public function _0Q_(param1:_i__._0__L_)
      {
         super();
         this.provider = param1;
      }
      
      public function apply(param1:Class, param2:Injector, param3:Dictionary) : Object
      {
         return this.provider.apply(param1,param2,param3);
      }
      
      public function destroy() : void
      {
         this.provider.destroy();
      }
   }
}
