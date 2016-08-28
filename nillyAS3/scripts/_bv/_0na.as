package _bv
{
   import _P_S_.Mediator;
   import _1E_7._7p;
   import _1C_p.News;
   import _0H_A_._0T_c;
   import _1C_p._16E_;
   
   public class _0na extends Mediator
   {
      
      public static var _64:Boolean = true;
       
      
      [Inject]
      public var update:_7p;
      
      [Inject]
      public var model:News;
      
      [Inject]
      public var _I_p:_0T_c;
      
      public function _0na()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.update.add(this._x7);
         this._I_p.start();
         if(_64)
         {
            _64 = false;
            this.model._F_s();
         }
      }
      
      override public function destroy() : void
      {
         this.update.remove(this._x7);
      }
      
      private function _x7(param1:Vector.<_16E_>) : void
      {
         this.model._F_s();
      }
   }
}
