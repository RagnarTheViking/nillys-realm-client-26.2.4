package _1__0
{
   import _00X_._0b9;
   import _0pN_._114;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import _1T_4._0es;
   import _0pN_._eg;
   import _0pN_._1my;
   import _1dI_.DeletingCharacterView;
   import _0pN_._M_Y_;
   import _0pN_._1nd;
   import _W_Q_.CharacterSelectionAndNewsScreen;
   
   public class _1R_G_
   {
       
      
      [Inject]
      public var _0pM_:_0b9;
      
      [Inject]
      public var _0rU_:_114;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var closeDialogs:CloseDialogsSignal;
      
      [Inject]
      public var _kU_:_0es;
      
      public function _1R_G_()
      {
         super();
      }
      
      public function execute() : void
      {
         var _loc1_:_eg = new _eg();
         _loc1_.add(new _1my(this._06Z_,new DeletingCharacterView()));
         _loc1_.add(new _M_Y_(this._0pM_,this._uS_(),this._N_t()));
         this._0rU_.add(_loc1_);
         _loc1_.start();
      }
      
      private function _uS_() : _1nd
      {
         var _loc1_:_eg = new _eg();
         _loc1_.add(new _1my(this._kU_,new CharacterSelectionAndNewsScreen()));
         _loc1_.add(new _1my(this.closeDialogs));
         return _loc1_;
      }
      
      private function _N_t() : _1nd
      {
         return new _1my(this._06Z_,"Unable to delete character");
      }
   }
}
