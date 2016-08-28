package _G_Z_
{
   import _V_y.ISignalCommandMap;
   import _4u.Account;
   import _m2._27;
   import _xc._1O_T_;
   import _xc._N_U_;
   import _1N_W_._0D_Q_;
   import _0y._0T_W_;
   
   public class _1F_y
   {
       
      
      [Inject]
      public var _1S_M_:ISignalCommandMap;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var data:XML;
      
      public function _1F_y()
      {
         super();
      }
      
      public function execute() : void
      {
         this._1S_M_.map(_27).toCommand(this._0Y_V_());
      }
      
      private function _0Y_V_() : Class
      {
         return !!this._0mQ_()?_1O_T_:_N_U_;
      }
      
      private function _0mQ_() : Boolean
      {
         return (this.account is _0D_Q_ || this.account is _0T_W_) && this.data["UseExternalPayments"] == null || Boolean(int(this.data["UseExternalPayments"]));
      }
   }
}
