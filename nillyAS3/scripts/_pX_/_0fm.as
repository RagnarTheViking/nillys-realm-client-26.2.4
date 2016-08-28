package _pX_
{
   import _4u.Account;
   import _3b.DialogSignal;
   import _0T_b.WebAccountDetailDialog;
   import _0T_b._mb;
   
   public class _0fm
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _0fm()
      {
         super();
      }
      
      public function execute() : void
      {
         if(this.account.registered())
         {
            this._06Z_.dispatch(new WebAccountDetailDialog());
         }
         else
         {
            this._06Z_.dispatch(new _mb());
         }
      }
   }
}
