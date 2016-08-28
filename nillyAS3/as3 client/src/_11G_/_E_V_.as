package _11G_
{
   import _4u.Account;
   import _v4.Client;
   import _1T_4._1U_z;
   import _0jo._1xX_;
   import _3b.DialogSignal;
   import _0hJ_._Z___;
   import _uO_._0N_w;
   import _W_Q_.CharacterSelectionAndNewsScreen;
   import _ge._1R_J_;
   import _05g.AgeVerificationDialog;
   
   public class _E_V_
   {
       
      
      private const _0E_0:int = 782;
      
      [Inject]
      public var account:Account;
      
      [Inject]
      public var model:Client;
      
      [Inject]
      public var _0rh:_1U_z;
      
      [Inject]
      public var _1M_n:_1xX_;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var servers:_Z___;
      
      [Inject]
      public var _rV_:_0N_w;
      
      public function _E_V_()
      {
         super();
      }
      
      public function execute() : void
      {
         if(!this.servers._bp())
         {
            this._kS_();
         }
         else if(!this.model.ageVerified())
         {
            this._1T_8();
         }
         else
         {
            this._G_x();
         }
      }
      
      private function _G_x() : void
      {
         this._0rh.dispatch(new CharacterSelectionAndNewsScreen());
      }
      
      private function _kr() : void
      {
         this._1M_n.dispatch(this._4c());
      }
      
      private function _4c() : _1R_J_
      {
         var _loc1_:_1R_J_ = new _1R_J_();
         _loc1_._1F_H_ = true;
         _loc1_.charId = this.model.getNextCharId();
         _loc1_._B_o = -1;
         _loc1_._vt = true;
         return _loc1_;
      }
      
      private function _1T_8() : void
      {
         this._06Z_.dispatch(new AgeVerificationDialog());
      }
      
      private function _kS_() : void
      {
         this._06Z_.dispatch(this._rV_._F_Y_());
      }
   }
}
