package _dM_
{
   import _4u.Account;
   import _0u4._0us;
   import _3b.DialogSignal;
   import _0u4.KongregateAccountDetailDialog;
   
   public class _pH_
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _1iN_:_0us;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _pH_()
      {
         super();
      }
      
      public function execute() : void
      {
         if(this.account.registered())
         {
            this._06Z_.dispatch(new KongregateAccountDetailDialog());
         }
         else
         {
            this._1iN_._1C_t();
         }
      }
   }
}
