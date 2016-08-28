package _G_Z_
{
   import _4u.Account;
   import _3b.DialogSignal;
   import _v4.Client;
   import _1T_4._ws;
   import _1T_4._0tI_;
   import _0pN_._114;
   import _0H_w.PurchaseCharacterClassTask;
   import _0H_w._1N_c;
   import _0R_R_._1uC_;
   import _0J_8.NeedRegistrationDialog;
   import _0pN_._eg;
   import _0pN_._M_Y_;
   import _0pN_._1my;
   import _0pN_._1nd;
   import _05g.NotEnoughGoldDialog;
   import _C_._1O_I_;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   
   public class _I_b
   {
       
      
      [Inject]
      public var classType:int;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0U_H_:Client;
      
      [Inject]
      public var _xf:_ws;
      
      [Inject]
      public var _1H_y:_0tI_;
      
      [Inject]
      public var _0rU_:_114;
      
      [Inject]
      public var _0pM_:PurchaseCharacterClassTask;
      
      [Inject]
      public var failure:_1N_c;
      
      [Inject]
      public var _dk:_1uC_;
      
      private var cost:int;
      
      public function _I_b()
      {
         super();
      }
      
      public function execute() : void
      {
         this.cost = this._J_a();
         if(!this.account.registered())
         {
            this._1k0();
         }
         else if(this._09__())
         {
            this._4s();
         }
         else
         {
            this._06f();
         }
      }
      
      private function _1k0() : void
      {
         this._06Z_.dispatch(new NeedRegistrationDialog("In order to unlock a class type you must be a registered user."));
         this._xf.dispatch();
      }
      
      private function _4s() : void
      {
         this._0U_H_.UpdateCredits(-1 * this.cost);
         this._1H_y.dispatch(this.classType);
         var _loc1_:_eg = new _eg();
         _loc1_.add(new _M_Y_(this._0pM_,this._dk,this._0l1()));
         _loc1_.add(new _1my(this._xf));
         this._0rU_.add(_loc1_);
         _loc1_.start();
      }
      
      private function _0l1() : _1nd
      {
         this.failure._1__a = this._0pM_;
         return this.failure;
      }
      
      private function _06f() : void
      {
         var _loc1_:NotEnoughGoldDialog = new NotEnoughGoldDialog();
         _loc1_._1aO_(_1O_I_._01M_,{"cost":this.cost});
         this._06Z_.dispatch(_loc1_);
         this._xf.dispatch();
      }
      
      private function _J_a() : int
      {
         return ObjectLibrary.XmlData[this.classType].UnlockCost;
      }
      
      private function _09__() : Boolean
      {
         return !this.cost || this.cost <= this._0U_H_.getCredits();
      }
   }
}
