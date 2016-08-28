package com.company.assembleegameclient.objects
{
   import _0Z_1.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import _0Z_1.GuildBoardPanel;
   
   public class GuildBoard extends GameObject implements _1kF_
   {
       
      
      public function GuildBoard(param1:XML)
      {
         super(param1);
         _1kM_ = true;
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         return new GuildBoardPanel(param1);
      }
   }
}
