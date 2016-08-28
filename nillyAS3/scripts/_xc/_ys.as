package _xc
{
   import _0R_R_._105;
   import _0pN_._114;
   import _1T_4._1U_z;
   import _3b.DialogSignal;
   import _0pN_._M_Y_;
   import _0pN_._1nd;
   import _0pN_._1my;
   import _W_Q_.CharacterSelectionAndNewsScreen;
   import _1O_R_.ErrorDialog;
   
   public class _ys
   {
       
      
      private const _1R_V_:String = "Unable to verify age";
      
      [Inject]
      public var _0pM_:_105;
      
      [Inject]
      public var _0rU_:_114;
      
      [Inject]
      public var _kU_:_1U_z;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _ys()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:_M_Y_ = new _M_Y_(this._0pM_);
         _loc1_._1hh(this._1R_g());
         _loc1_._9c(this._0l1());
         this._0rU_.add(_loc1_);
         _loc1_.start();
      }
      
      private function _1R_g() : _1nd
      {
         return new _1my(this._kU_,new CharacterSelectionAndNewsScreen());
      }
      
      private function _0l1() : _1nd
      {
         return new _1my(this._06Z_,new ErrorDialog(this._1R_V_));
      }
   }
}
