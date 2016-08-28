package com.company.assembleegameclient.objects
{
   import _0Z_1.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import _1S_e.MoneyChangerPanel;
   
   public class MoneyChanger extends GameObject implements _1kF_
   {
       
      
      public function MoneyChanger(param1:XML)
      {
         super(param1);
         _1kM_ = true;
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         return new MoneyChangerPanel(param1);
      }
   }
}
