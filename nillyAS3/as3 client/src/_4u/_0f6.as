package _4u
{
   import _0R_R_._0ju;
   import _0pN_._114;
   import _1T_4._0es;
   import _3b.DialogSignal;
   import _3b.CloseDialogsSignal;
   import _v4.Client;
   import _1T_4._1yM_;
   import _0J_8.BuyingDialog;
   import _0pN_._eg;
   import _0pN_._M_Y_;
   import _0pN_._1my;
   import _0pN_._1nd;
   import _W_Q_.CharacterSelectionAndNewsScreen;
   import _0H_w._1P_e;
   import _1O_R_.ErrorDialog;
   
   public class _0f6
   {
       
      
      [Inject]
      public var price:int;
      
      [Inject]
      public var _0pM_:_0ju;
      
      [Inject]
      public var _0rU_:_114;
      
      [Inject]
      public var _kU_:_0es;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var _0dR_:CloseDialogsSignal;
      
      [Inject]
      public var model:Client;
      
      [Inject]
      public var account:_4u.Account;
      
      [Inject]
      public var _S_s:_1yM_;
      
      public function _0f6()
      {
         super();
      }
      
      public function execute() : void
      {
         if(this._8F_())
         {
            this._ac();
         }
         else
         {
            this._00o();
         }
      }
      
      private function _8F_() : Boolean
      {
         if(this.model.getCharSlotCurrency() == 0)
         {
            return this.model.getCredits() < this.model.getNextCharSlotPrice();
         }
         if(this.model.getCharSlotCurrency() == 1)
         {
            return this.model.getFame() < this.model.getNextCharSlotPrice();
         }
         return false;
      }
      
      private function _ac() : void
      {
      }
      
      private function _00o() : void
      {
         this._06Z_.dispatch(new BuyingDialog());
         var _loc1_:_eg = new _eg();
         _loc1_.add(new _M_Y_(this._0pM_,this._1R_g(),this._0l1()));
         _loc1_.add(new _1my(this._0dR_));
         this._0rU_.add(_loc1_);
         _loc1_.start();
      }
      
      private function _1R_g() : _1nd
      {
         var _loc1_:_eg = new _eg();
         _loc1_.add(new _1my(this._kU_,new CharacterSelectionAndNewsScreen()));
         _loc1_.add(new _1my(this._S_s,this._0V_0()));
         return _loc1_;
      }
      
      private function _0V_0() : _1P_e
      {
         var _loc1_:_1P_e = new _1P_e();
         _loc1_.category = "credits";
         _loc1_._19E_ = "buyConverted";
         _loc1_.label = "Character Slot";
         _loc1_.value = this.price;
         return _loc1_;
      }
      
      private function _0l1() : _1nd
      {
         return new _1my(this._06Z_,new ErrorDialog("Unable to complete character slot purchase"));
      }
   }
}
