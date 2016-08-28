package com.company.assembleegameclient.objects
{
   import _0Z_1.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import _1U_P_.ArenaQueryPanel;
   
   public class ArenaGuard extends GameObject implements _1kF_
   {
       
      
      public function ArenaGuard(param1:XML)
      {
         super(param1);
         _1kM_ = true;
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         return new ArenaQueryPanel(param1,objectType_);
      }
   }
}
