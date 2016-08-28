package _pX_
{
   import _0R_R_._1F_2;
   import _0pN_._114;
   import _1T_4._34;
   import _m2._1N_l;
   import _3b.DialogSignal;
   import _1T_4._1yM_;
   import _0pN_._M_Y_;
   import _0pN_._1nd;
   import _0pN_._eg;
   import _0pN_._1my;
   import _0T_b.WebAccountDetailDialog;
   import _0H_w._1P_e;
   
   public class _package
   {
       
      
      [Inject]
      public var _0pM_:_1F_2;
      
      [Inject]
      public var _0rU_:_114;
      
      [Inject]
      public var _1U_b:_34;
      
      [Inject]
      public var _050:_1N_l;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _S_s:_1yM_;
      
      public function _package()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:_M_Y_ = new _M_Y_(this._0pM_,this._1V_M_(),this._1j1());
         this._0rU_.add(_loc1_);
         _loc1_.start();
      }
      
      private function _1V_M_() : _1nd
      {
         var _loc1_:_eg = new _eg();
         _loc1_.add(new _1my(this._S_s,this._0ad()));
         _loc1_.add(new _1my(this._050));
         _loc1_.add(new _1my(this._06Z_,new WebAccountDetailDialog()));
         return _loc1_;
      }
      
      private function _1j1() : _1my
      {
         return new _1my(this._1U_b,this._0pM_);
      }
      
      private function _0ad() : _1P_e
      {
         var _loc1_:_1P_e = new _1P_e();
         _loc1_.category = "account";
         _loc1_._19E_ = "accountRegistered";
         return _loc1_;
      }
   }
}
