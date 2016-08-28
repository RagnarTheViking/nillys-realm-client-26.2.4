package _xc
{
   import _3b.DialogSignal;
   import _0J_8.MoneyFrame;
   
   public class _N_U_
   {
       
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _N_U_()
      {
         super();
      }
      
      public function execute() : void
      {
         this._06Z_.dispatch(new MoneyFrame());
      }
   }
}
