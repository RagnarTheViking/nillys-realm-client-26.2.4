package _K_H_
{
   import _C_._1O_I_;
   import _4u.Account;
   import _Z_U_._117;
   import _3b.DialogSignal;
   import _m2._16d;
   import _0b6._1u9;
   import _0y._0T_W_;
   import _1N_W_._0D_Q_;
   import _06._8n;
   import _4u._0dl;
   import _0J_8.NeedRegistrationDialog;
   
   public class BuyBeginnersPackageCommand
   {
      
      private static const _M_N_:String = _1O_I_._z9;
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var model:_117;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _06A_:_16d;
      
      [Inject]
      public var _1P_m:_1u9;
      
      public function BuyBeginnersPackageCommand()
      {
         super();
      }
      
      public function execute() : void
      {
         if(this.account.registered())
         {
            this._B_8();
         }
         else
         {
            this._L_Q_();
         }
      }
      
      private function _B_8() : void
      {
         if(this.account is _0T_W_ || this.account is _0D_Q_)
         {
            this._06Z_.dispatch(new _8n());
         }
         else
         {
            this._2__1();
         }
      }
      
      private function _2__1() : void
      {
         var _loc1_:_0dl = new _0dl();
         _loc1_.offer = this.model._D_o();
         this._1P_m.dispatch(_loc1_);
      }
      
      private function _L_Q_() : void
      {
         this._06Z_.dispatch(new NeedRegistrationDialog(_M_N_));
      }
   }
}
