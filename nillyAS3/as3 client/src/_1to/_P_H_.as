package _1to
{
   import _0E_T_._Y_F_;
   import _v4.Client;
   import _0fP_._1E_3;
   import _0pN_._114;
   import _3b.DialogSignal;
   import _0E_T_._1G_k;
   import _05g.NotEnoughGoldDialog;
   
   public class _P_H_
   {
       
      
      [Inject]
      public var skin:_Y_F_;
      
      [Inject]
      public var model:Client;
      
      [Inject]
      public var _0pM_:_1E_3;
      
      [Inject]
      public var _0rU_:_114;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      public function _P_H_()
      {
         super();
      }
      
      public function execute() : void
      {
         if(this._1I_R_())
         {
            this._j6();
         }
      }
      
      private function _j6() : void
      {
         if(this._r7())
         {
            this._0rC_();
         }
         else
         {
            this._0b5();
         }
      }
      
      private function _1I_R_() : Boolean
      {
         return this.skin._0J_m() == _1G_k.PURCHASABLE;
      }
      
      private function _r7() : Boolean
      {
         return this.model.getCredits() >= this.skin.cost;
      }
      
      private function _0rC_() : void
      {
         this._0rU_.add(this._0pM_);
         this._0pM_.start();
      }
      
      private function _0b5() : void
      {
         this._06Z_.dispatch(new NotEnoughGoldDialog());
      }
   }
}
