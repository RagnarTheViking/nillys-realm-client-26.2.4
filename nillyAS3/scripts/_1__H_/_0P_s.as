package _1__H_
{
   import _P_S_.Mediator;
   import _1F_z._07p;
   import _0Z_d._1sk;
   
   public class _0P_s extends Mediator
   {
       
      
      [Inject]
      public var _12P_:_07p;
      
      [Inject]
      public var _R_m:_1sk;
      
      public function _0P_s()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._R_m.add(this._t);
      }
      
      override public function destroy() : void
      {
         this._R_m.remove(this._t);
      }
      
      private function _t() : void
      {
         this._12P_.clear();
      }
   }
}
