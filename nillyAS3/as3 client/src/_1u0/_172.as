package _1u0
{
   import _1__8._127;
   import _4u.Account;
   import _3b.DialogSignal;
   import _0J_8.NeedRegistrationDialog;
   
   public class _172 implements _127
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _172()
      {
         super();
      }
      
      public function approve() : Boolean
      {
         var _loc1_:Boolean = this.account.registered();
         _loc1_ || this._03b();
         return _loc1_;
      }
      
      protected function getString() : String
      {
         return "";
      }
      
      private function _03b() : void
      {
         this._06Z_.dispatch(new NeedRegistrationDialog(this.getString()));
      }
   }
}
