package _0wG_
{
   import _0eG_._4N_;
   import _0eG_.Description;
   
   public class _ug extends _4N_
   {
       
      
      private var _value:Object;
      
      public function _ug(param1:Object)
      {
         super();
         this._value = param1;
      }
      
      private function __use(param1:Object, param2:Object) : Boolean
      {
         if(isNaN(param1 as Number))
         {
            return isNaN(param2 as Number);
         }
         if(param1 == null)
         {
            return param2 == null;
         }
         if(param1 is Array)
         {
            return param2 is Array && this._y(param1 as Array,param2 as Array);
         }
         return param1 == param2;
      }
      
      private function _y(param1:Array, param2:Array) : Boolean
      {
         return this._fz(param1,param2) && this._0Q_x(param1,param2);
      }
      
      override public function describeTo(param1:Description) : void
      {
         param1._0uv(this._value);
      }
      
      private function _0Q_x(param1:Array, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = param1.length;
         while(_loc3_ < _loc4_)
         {
            if(!this.__use(param1[_loc3_],param2[_loc3_]))
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      override public function matches(param1:Object) : Boolean
      {
         return this.__use(param1,this._value);
      }
      
      private function _fz(param1:Array, param2:Array) : Boolean
      {
         return param1.length == param2.length;
      }
   }
}
