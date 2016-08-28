package _K_H_
{
   import _4u.Account;
   import _Z_U_._117;
   import _3b.DialogSignal;
   import _1sN_._0z3;
   import _0R_R_._0T_p;
   import _0pN_._114;
   import _0pN_._M_Y_;
   import _0pN_._1nd;
   import _0pN_._eg;
   import _0pN_._1my;
   import _06.BeginnersPackageOfferDialog;
   import _06._0T_n;
   
   public class _022
   {
       
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var model:_117;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0__z:_0z3;
      
      [Inject]
      public var _U_I_:_0T_p;
      
      [Inject]
      public var _0rU_:_114;
      
      public function _022()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:_M_Y_ = new _M_Y_(this._0__z,this._1R_g(),this._0l1());
         this._0rU_.add(_loc1_);
         _loc1_.start();
      }
      
      private function _1R_g() : _1nd
      {
         var _loc1_:_eg = new _eg();
         this.account.registered() && _loc1_.add(this._U_I_);
         _loc1_.add(new _1my(this._06Z_,new BeginnersPackageOfferDialog()));
         return _loc1_;
      }
      
      private function _0l1() : _1nd
      {
         var _loc1_:_eg = new _eg();
         _loc1_.add(new _1my(this._06Z_,new _0T_n()));
         return _loc1_;
      }
   }
}
