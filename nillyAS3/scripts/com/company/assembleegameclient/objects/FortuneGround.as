package com.company.assembleegameclient.objects
{
   import _0Z_1.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import _1S_e.FortuneGroundPanel;
   
   public class FortuneGround extends GameObject implements _1kF_
   {
       
      
      public function FortuneGround(param1:XML)
      {
         super(param1);
         _1kM_ = true;
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         return new FortuneGroundPanel(param1,objectType_);
      }
   }
}
