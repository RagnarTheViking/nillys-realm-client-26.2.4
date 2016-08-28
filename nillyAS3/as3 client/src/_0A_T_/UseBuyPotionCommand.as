package _0A_T_
{
   import _ge._0g0;
   import _ge._I_I_;
   import _S_b._O_e;
   import _1__8._19A_;
   import Packets.PacketManagerBase;
   import com.company.assembleegameclient.objects.Player;
   import _S_b._1gV_;
   import com.company.assembleegameclient.parameters.Parameters;
   import _ll.SFX;
   import flash.utils.getTimer;
   
   public class UseBuyPotionCommand
   {
       
      
      [Inject]
      public var _W_d:_0g0;
      
      [Inject]
      public var _13n:_I_I_;
      
      [Inject]
      public var _1tf:_O_e;
      
      [Inject]
      public var _0G_2:_19A_;
      
      private var _7R_:PacketManagerBase;
      
      private var player:Player;
      
      private var _0yS_:int;
      
      private var count:int;
      
      private var _xH_:_1gV_;
      
      public function UseBuyPotionCommand()
      {
         this._7R_ = PacketManagerBase.instance;
         super();
      }
      
      public function execute() : void
      {
         this.player = this._1tf._14O_.map.player_;
         if(this.player == null)
         {
            return;
         }
         this._0yS_ = this._W_d.objectId;
         this.count = this.player.getPotionCount(this._0yS_);
         this._xH_ = this._13n._3l(this._0yS_);
         if(this.count > 0 || this._0Y_j())
         {
            this._J_Q_();
         }
         else
         {
            this._0G_2.info("Not safe to purchase potion");
         }
      }
      
      private function _0Y_j() : Boolean
      {
         var _loc1_:* = this.player.credits_ >= this._xH_._3v(this.player.getPotionCount(this._0yS_));
         var _loc2_:Boolean = Parameters.data_.contextualPotionBuy;
         return _loc1_ && _loc2_;
      }
      
      private function _J_Q_() : void
      {
         if(this._1ha())
         {
            this._0G_2.info("UseBuyPotionCommand.execute: User has MAX of that attribute, not requesting a use/buy from server.");
         }
         else
         {
            this._0uc();
            SFX.play("use_potion");
         }
      }
      
      private function _1ha() : Boolean
      {
         if(this._0yS_ == _I_I_._1__7)
         {
            return this.player.hp_ >= this.player.maxHp_;
         }
         if(this._0yS_ == _I_I_._11C_)
         {
            return this.player.mp_ >= this.player.maxMp_;
         }
         return false;
      }
      
      private function _0uc() : void
      {
         var _loc1_:int = _I_I_._Y_H_(this._W_d.objectId);
         var _loc2_:int = Parameters.data_.contextualPotionBuy;
         this._7R_.useItem(getTimer(),this.player.objectId_,_loc1_,this._0yS_,this.player.x_,this.player.y_,_loc2_);
         if(this.player.getPotionCount(this._W_d.objectId) == 0)
         {
            this._13n._3l(this._W_d.objectId)._0kF_();
         }
      }
   }
}
