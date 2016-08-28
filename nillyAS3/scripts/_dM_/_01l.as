package _dM_
{
   import _0O_c._H_0;
   import _0R_R_._1F_2;
   import _0pN_._114;
   import _m2._1N_l;
   import _3b.DialogSignal;
   import _1T_4._34;
   import _0pN_._M_Y_;
   import _0pN_._eg;
   import _0pN_._1my;
   import _0u4.KongregateAccountDetailDialog;
   import _0pN_._1nd;
   
   public class _01l
   {
       
      
      [Inject]
      public var data:_H_0;
      
      [Inject]
      public var _0pM_:_1F_2;
      
      [Inject]
      public var _0rU_:_114;
      
      [Inject]
      public var update:_1N_l;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _1U_b:_34;
      
      public function _01l()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:_M_Y_ = new _M_Y_(this._0pM_,this._uS_(),this._N_t());
         this._0rU_.add(_loc1_);
         _loc1_.start();
      }
      
      private function _uS_() : _eg
      {
         var _loc1_:_eg = new _eg();
         _loc1_.add(new _1my(this.update));
         _loc1_.add(new _1my(this._06Z_,new KongregateAccountDetailDialog()));
         return _loc1_;
      }
      
      private function _N_t() : _1nd
      {
         return new _1my(this._1U_b,this._0pM_);
      }
   }
}
