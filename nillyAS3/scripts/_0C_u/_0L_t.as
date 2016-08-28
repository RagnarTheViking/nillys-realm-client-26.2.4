package _0C_u
{
   import _04e._05X_;
   import _1T_4._kc;
   import _1T_4._1U_z;
   import _W_Q_.CharacterSelectionAndNewsScreen;
   import _05g.TitleView;
   
   public class _0L_t
   {
       
      
      [Inject]
      public var model:_05X_;
      
      [Inject]
      public var _11v:_kc;
      
      [Inject]
      public var _kU_:_1U_z;
      
      public function _0L_t()
      {
         super();
      }
      
      public function execute() : void
      {
         if(this.model._0z__())
         {
            this._00N_();
         }
         else
         {
            this._th();
         }
      }
      
      private function _00N_() : void
      {
         this.model._I_V_();
         this._11v.dispatch();
         this._kU_.dispatch(new CharacterSelectionAndNewsScreen());
      }
      
      private function _th() : void
      {
         this._kU_.dispatch(new TitleView());
      }
   }
}
