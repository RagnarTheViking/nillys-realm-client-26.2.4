package _0A_T_
{
   import _v4.Client;
   import _04e._05X_;
   import _1T_4._kc;
   import _1T_4._0es;
   import _1T_4._1U_z;
   import _06s._F_d;
   import Packets.Server.Death;
   import _0Q_Q_._42;
   import _0Q_Q_._1oj;
   import _W_Q_.CharacterSelectionAndNewsScreen;
   
   public class _1nC_
   {
       
      
      [Inject]
      public var player:Client;
      
      [Inject]
      public var model:_05X_;
      
      [Inject]
      public var _11v:_kc;
      
      [Inject]
      public var _kU_:_0es;
      
      [Inject]
      public var _0rh:_1U_z;
      
      [Inject]
      public var _13A_:_F_d;
      
      public function _1nC_()
      {
         super();
      }
      
      public function execute() : void
      {
         this._11v.dispatch();
         if(this.model._0z__())
         {
            this._0G_e();
         }
         else
         {
            this._G_x();
         }
      }
      
      private function _0G_e() : void
      {
         var _loc1_:Death = this.model._1sw();
         var _loc2_:_1oj = new _42(this.player.getAccountId(),_loc1_.charId_);
         this._13A_.dispatch(_loc2_);
      }
      
      private function _G_x() : void
      {
         this._0rh.dispatch(new CharacterSelectionAndNewsScreen());
      }
   }
}
