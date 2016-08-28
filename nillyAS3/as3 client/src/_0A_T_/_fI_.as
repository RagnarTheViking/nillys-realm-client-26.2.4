package _0A_T_
{
   import _1T_4._0es;
   import _ge._1R_J_;
   import _v4.Client;
   import _1F_z._0P_4;
   import _0hJ_._Z___;
   import _0R_R_._1uC_;
   import _0pN_._114;
   import _jQ_.SocketServerModel;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   import com.company.assembleegameclient.parameters.Parameters;
   import _0hJ_.Server;
   import flash.utils.ByteArray;
   import com.company.assembleegameclient.game.GameSprite;
   
   public class _fI_
   {
      
      public static const _0yH_:int = 2000;
       
      
      [Inject]
      public var _kU_:_0es;
      
      [Inject]
      public var data:_1R_J_;
      
      [Inject]
      public var model:Client;
      
      [Inject]
      public var _0xI_:_0P_4;
      
      [Inject]
      public var servers:_Z___;
      
      [Inject]
      public var _0pM_:_1uC_;
      
      [Inject]
      public var _0rU_:_114;
      
      [Inject]
      public var _G_O_:SocketServerModel;
      
      public function _fI_()
      {
         super();
      }
      
      public function execute() : void
      {
         if(!this.data._vt)
         {
            this._G_O_.connectDelayMS = _0yH_;
         }
         this._1O_S_();
         this._n9();
         this._1D_V_();
      }
      
      private function _1D_V_() : void
      {
         var _loc1_:SavedCharacter = this.model.getCharacter(this.model._1U_H_);
         if(_loc1_)
         {
            this._0xI_._1mB_(_loc1_.getPetVO());
         }
         else
         {
            if(this.model._1U_H_ && this._0xI_._0T_T_() && !this.data._vt)
            {
               return;
            }
            this._0xI_._1mB_(null);
         }
      }
      
      private function _1O_S_() : void
      {
         Parameters.data_.charIdUseMap[this.data.charId] = new Date().getTime();
         Parameters.save();
      }
      
      private function _n9() : void
      {
         var _loc1_:Server = this.data.server || this.servers._J_i();
         var _loc2_:int = !!this.data._vt?int(this._0X_S_()):int(this.data.gameId);
         var _loc3_:Boolean = this.data._1F_H_;
         var _loc4_:int = this.data.charId;
         var _loc5_:int = !!this.data._vt?-1:int(this.data._B_o);
         var _loc6_:ByteArray = this.data.key;
         this.model._1U_H_ = _loc4_;
         this._kU_.dispatch(new GameSprite(_loc1_,_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,this.model,null,this.data._10h));
      }
      
      private function _0X_S_() : int
      {
         var _loc1_:int = 0;
         if(Parameters.data_.needsTutorial)
         {
            _loc1_ = Parameters._1L_K_;
         }
         else if(Parameters.data_.needsRandomRealm)
         {
            _loc1_ = Parameters._0H_5;
         }
         else
         {
            _loc1_ = Parameters._1lr;
         }
         return _loc1_;
      }
   }
}
