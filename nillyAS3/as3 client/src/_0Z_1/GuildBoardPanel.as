package _0Z_1
{
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.objects.Player;
   import _0M_P_._0rB_;
   import com.company.assembleegameclient.util.GuildUtil;
   import com.company.assembleegameclient.game.GameSprite;
   import _C_._1O_I_;
   
   public class GuildBoardPanel extends _0eJ_
   {
       
      
      public function GuildBoardPanel(param1:GameSprite)
      {
         super(param1,_1O_I_._0jX_,_1O_I_._0iz);
      }
      
      override protected function onButtonClick(param1:MouseEvent) : void
      {
         var _loc2_:Player = gs_.map.player_;
         if(_loc2_ == null)
         {
            return;
         }
         gs_.addChild(new _0rB_(_loc2_.guildRank_ >= GuildUtil._0k3));
      }
   }
}
