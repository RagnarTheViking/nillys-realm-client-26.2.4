package com.company.assembleegameclient.objects
{
   import _0Z_1.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import _1S_e.MysteryBoxPanel;
   
   public class MysteryBoxGround extends GameObject implements _1kF_
   {
       
      
      public function MysteryBoxGround(param1:XML)
      {
         super(param1);
         _1kM_ = true;
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         return new MysteryBoxPanel(param1,objectType_);
      }
   }
}
