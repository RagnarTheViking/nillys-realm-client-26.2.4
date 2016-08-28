package _0J_8
{
   import _P_S_.Mediator;
   import _4u.Account;
   import _m2._1N_l;
   
   public class _1X_y extends Mediator
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var view:_0J_8._0C_M_;
      
      [Inject]
      public var update:_1N_l;
      
      public function _1X_y()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view._G_z(this.account._1yb(),this.account.registered());
         this.update.add(this._1h5);
      }
      
      override public function destroy() : void
      {
         this.update.remove(this._1h5);
      }
      
      private function _1h5() : void
      {
         this.view._G_z(this.account._1yb(),this.account.registered());
      }
   }
}
