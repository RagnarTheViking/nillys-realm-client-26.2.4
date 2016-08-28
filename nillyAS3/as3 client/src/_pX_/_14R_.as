package _pX_
{
   import _0R_R_._0K_S_;
   import _0pN_._114;
   import _1T_4._34;
   import _3b.DialogSignal;
   import _0pN_._1__K_;
   import _0pN_._1my;
   import _0T_b.WebLoginDialog;
   import _0pN_._M_Y_;
   
   public class _14R_
   {
       
      
      [Inject]
      public var email:String;
      
      [Inject]
      public var _0pM_:_0K_S_;
      
      [Inject]
      public var _0rU_:_114;
      
      [Inject]
      public var _1U_b:_34;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _14R_()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:_1__K_ = new _1__K_();
         _loc1_.add(new _1my(this._06Z_,new WebLoginDialog()));
         var _loc2_:_1__K_ = new _1__K_();
         _loc2_.add(new _1my(this._1U_b,this._0pM_));
         var _loc3_:_M_Y_ = new _M_Y_(this._0pM_,_loc1_,_loc2_);
         this._0rU_.add(_loc3_);
         _loc3_.start();
      }
   }
}
