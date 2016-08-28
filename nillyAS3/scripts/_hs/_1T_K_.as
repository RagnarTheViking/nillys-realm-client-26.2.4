package _hs
{
   import _3b.DialogSignal;
   import _00I_.KabamAccountDetailDialog;
   
   public class _1T_K_
   {
       
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _1T_K_()
      {
         super();
      }
      
      public function execute() : void
      {
         this._06Z_.dispatch(new KabamAccountDetailDialog());
      }
   }
}
