package _0pn
{
   import _3b.DialogSignal;
   import _0C_j._ze;
   import _C_._1O_I_;
   
   public class _1I_8
   {
       
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _1I_8()
      {
         super();
      }
      
      public function execute() : void
      {
         this._06Z_.dispatch(this._F_Y_());
      }
      
      private function _F_Y_() : _ze
      {
         return new _ze().setTitle(_1O_I_._wg).setBody(_1O_I_._vh,_1O_I_._0V_t);
      }
   }
}
