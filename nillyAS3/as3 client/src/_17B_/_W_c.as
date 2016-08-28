package _17B_
{
   import _E_Y_._0rZ_;
   import _05g._1S_m;
   import _f7.Signal;
   import _E_Y_._u6;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class _W_c extends _0rZ_
   {
       
      
      private const _01T_:_1S_m = new _1S_m();
      
      public const ready:Signal = _01T_.complete;
      
      public const selected:Signal = new Signal(String);
      
      public function _W_c(param1:Array)
      {
         super();
         _Z_a(this._0X_w());
         setItems(this._02r(param1));
         this.ready.addOnce(_1A_s);
      }
      
      private function _0X_w() : _u6
      {
         var _loc1_:_u6 = new _u6();
         _loc1_._1gC_(2);
         return _loc1_;
      }
      
      private function _02r(param1:Array) : Vector.<DisplayObject>
      {
         var _loc3_:int = 0;
         var _loc2_:Vector.<DisplayObject> = new Vector.<DisplayObject>();
         while(_loc3_ < param1.length)
         {
            _loc2_.push(this._U_7(param1[_loc3_]));
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function _U_7(param1:Object) : _1E_d
      {
         var _loc2_:_1E_d = new _1E_d(param1.category,param1.info);
         _loc2_.addEventListener(MouseEvent.CLICK,this._1k9);
         this._01T_.push(_loc2_.textChanged);
         return _loc2_;
      }
      
      private function _1k9(param1:MouseEvent) : void
      {
         var _loc2_:_1E_d = param1.currentTarget as _1E_d;
         this.selected.dispatch(_loc2_.info);
      }
   }
}
