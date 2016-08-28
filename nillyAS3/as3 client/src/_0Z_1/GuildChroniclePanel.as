package _0Z_1
{
   import flash.events.MouseEvent;
   import _tZ_._1k2;
   import com.company.assembleegameclient.game.GameSprite;
   import _C_._1O_I_;
   
   public class GuildChroniclePanel extends _0eJ_
   {
       
      
      public function GuildChroniclePanel(param1:GameSprite)
      {
         super(param1,_1O_I_._02i,_1O_I_._0iz);
      }
      
      override protected function onButtonClick(param1:MouseEvent) : void
      {
         gs_.mui_.clearInput();
         gs_.addChild(new _1k2(gs_));
      }
   }
}
