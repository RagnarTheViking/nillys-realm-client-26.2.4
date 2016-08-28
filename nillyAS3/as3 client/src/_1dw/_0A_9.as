package _1dw
{
   import _P_S_.Mediator;
   import _4u.Account;
   import _1R_9._J_m;
   import _3b.CloseDialogsSignal;
   import _3b.DialogSignal;
   import com.company.util._0vj;
   import _0J_8.RegisterWebAccountDialog;
   
   public class _0A_9 extends Mediator
   {
       
      
      [Inject]
      public var view:_1dw.SteamAccountDetailDialog;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var steam:_J_m;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _0A_9()
      {
         super();
      }
      
      override public function initialize() : void
      {
         this._0zw();
         this.view._06H_.add(this._11L_);
         this.view.register.add(this._02T_);
         this.view.link.add(this.onLink);
      }
      
      private function _0zw() : void
      {
         var _loc1_:String = this.steam._0mw();
         var _loc2_:String = this.account._1yb();
         var _loc3_:Boolean = _0vj._1mE_(_loc2_);
         this.view._G_z(_loc1_,_loc2_,_loc3_);
      }
      
      override public function destroy() : void
      {
         this.view._06H_.remove(this._11L_);
         this.view.register.remove(this._02T_);
         this.view.link.remove(this.onLink);
      }
      
      private function _11L_() : void
      {
         this._0dR_.dispatch();
      }
      
      private function _02T_() : void
      {
         this._06Z_.dispatch(new RegisterWebAccountDialog());
      }
      
      private function onLink() : void
      {
      }
   }
}
