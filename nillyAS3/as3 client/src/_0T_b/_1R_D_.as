package _0T_b
{
   import _P_S_.Mediator;
   import _4u.Account;
   import _m2._xU_;
   import _3b.DialogSignal;
   
   public class _1R_D_ extends Mediator
   {
       
      
      [Inject]
      public var view:_0T_b._1fd;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var logout:_xU_;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _1R_D_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this.view.login.add(this._0A_H_);
         this.view.register.add(this._02T_);
      }
      
      override public function destroy() : void
      {
         this.view.login.remove(this._0A_H_);
         this.view.register.remove(this._02T_);
      }
      
      private function _02T_() : void
      {
         this._06Z_.dispatch(new _mb());
      }
      
      private function _0A_H_() : void
      {
         if(this.account.registered())
         {
            this._1aG_();
         }
         else
         {
            this._06Z_.dispatch(new WebLoginDialog());
         }
      }
      
      private function _1aG_() : void
      {
         this.logout.dispatch();
         this.view._G_z("",false);
      }
   }
}
