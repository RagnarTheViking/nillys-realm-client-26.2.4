package _0u4
{
   import _P_S_.Mediator;
   import _4u.Account;
   import _3b.CloseDialogsSignal;
   import _3b.DialogSignal;
   import com.company.util._0vj;
   import _0J_8.RegisterWebAccountDialog;
   
   public class _V_g extends Mediator
   {
       
      
      [Inject]
      public var view:_0u4.KongregateAccountDetailDialog;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _1iN_:_0u4._0us;
      
      public function _V_g()
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
         var _loc1_:String = this._1iN_._1yb();
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
