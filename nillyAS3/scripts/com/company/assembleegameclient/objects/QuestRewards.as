package com.company.assembleegameclient.objects
{
   import _0Z_1.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import _F_0._0E_r;
   
   public class QuestRewards extends GameObject implements _1kF_
   {
       
      
      public function QuestRewards(param1:XML)
      {
         super(param1);
         _1kM_ = true;
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         return new _0E_r(param1);
      }
   }
}
