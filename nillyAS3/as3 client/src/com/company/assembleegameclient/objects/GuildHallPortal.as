package com.company.assembleegameclient.objects
{
   import _0Z_1.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import _0Z_1.GuildHallPortalPanel;
   
   public class GuildHallPortal extends GameObject implements _1kF_
   {
       
      
      public function GuildHallPortal(param1:XML)
      {
         super(param1);
         _1kM_ = true;
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         return new GuildHallPortalPanel(param1,this);
      }
   }
}
