package _i__
{
   import _wi.Injector;
   import flash.utils.Dictionary;
   import _k1.SsInternal;
   
   public class _1lj implements _0__L_
   {
       
      
      private var _0bv:Class;
      
      public function _1lj(param1:Class)
      {
         super();
         this._0bv = param1;
      }
      
      public function apply(param1:Class, param2:Injector, param3:Dictionary) : Object
      {
         return param2.SsInternal::_4Q_(this._0bv);
      }
      
      public function destroy() : void
      {
      }
   }
}
