package com.company.assembleegameclient.objects
{
   import ToolTips.ToolTip;
   import ToolTips._0bd;
   import _C_._1O_I_;
   import _0Z_1.Panel;
   import com.company.assembleegameclient.game.GameSprite;
   import _17B_._1X_A_;
   
   public class PetUpgrader extends GameObject implements _1kF_
   {
       
      
      public function PetUpgrader(param1:XML)
      {
         super(param1);
         _1kM_ = true;
      }
      
      public function getTooltip() : ToolTip
      {
         return new _0bd(3552822,10197915,_1O_I_._0py,_1O_I_._185,200);
      }
      
      public function getPanel(param1:GameSprite) : Panel
      {
         return new _1X_A_(param1,objectType_);
      }
   }
}
