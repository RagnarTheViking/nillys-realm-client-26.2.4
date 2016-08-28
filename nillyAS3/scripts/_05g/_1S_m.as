package _05g
{
   import _f7.Signal;
   import flash.utils.Dictionary;
   import _0B_y._0P_H_;
   
   public class _1S_m
   {
       
      
      public var complete:Signal;
      
      private var _B_i:Dictionary;
      
      public function _1S_m()
      {
         this.complete = new Signal();
         this._B_i = new Dictionary();
         super();
      }
      
      public function push(param1:Signal) : _1S_m
      {
         this._B_i[param1] = true;
         this._1D_c(param1);
         return this;
      }
      
      public function pushArgs(... rest) : _1S_m
      {
         var _loc2_:Signal = null;
         for each(_loc2_ in rest)
         {
            this.push(_loc2_);
         }
         return this;
      }
      
      private function _1D_c(param1:Signal) : void
      {
         var onTextChanged:Function = null;
         var value:Signal = param1;
         onTextChanged = function():void
         {
            delete _B_i[value];
            _c5();
         };
         value.addOnce(onTextChanged);
      }
      
      private function _c5() : void
      {
         if(this.isEmpty())
         {
            this.complete.dispatch();
         }
      }
      
      public function isEmpty() : Boolean
      {
         return _0P_H_._1t0(this._B_i).length == 0;
      }
   }
}
