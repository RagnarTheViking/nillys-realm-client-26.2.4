package _i__
{
   import _wi.Injector;
   import flash.utils.Dictionary;
   
   public class _W_b implements _0__L_
   {
       
      
      private var _value:Object;
      
      public function _W_b(param1:Object)
      {
         super();
         this._value = param1;
      }
      
      public function apply(param1:Class, param2:Injector, param3:Dictionary) : Object
      {
         return this._value;
      }
      
      public function destroy() : void
      {
      }
   }
}
